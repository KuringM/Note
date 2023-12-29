```c
temp_us_brk_p_gain = Lookup(Mue.mu_act_y_s16, 3, cal.us_brk_p_gain_tbl);
temp_us_brk_d_gain = Lookup(Mue.mu_act_y_s16, 3, cal.us_brk_d_gain_tbl);
temp_us_brk_i_gain = Lookup(Mue.mu_act_y_s16, 3, cal.us_brk_i_gain_tbl);

if Esc_yrc.ydc_active == 1
{
	Esc_sac.us_prohibited = 1;
	Esc_sac.us_prohibited_timer = 1000;
}
else{
	if Esc_sac.us_prohibited_timer > 0
	{
		Esc_sac.us_prohibited_timer = max(Esc_sac.us_prohibited_timer - ESC_CONTROL_LOOPTIME, 0);
	}
	else{
		Esc_sac.us_prohibited = 0;}
}

if Esc_input.filt_ay >= 0
{
	Esc_sac.us_target_ay_yaw = min(Esc_yrc.swa_yaw, Esc_yrc.target_yaw_rate_filt);
}
else
{
	Esc_sac.us_target_ay_yaw = max(Esc_yrc.swa_yaw, Esc_yrc.target_yaw_rate_filt);
}

temp_delta_yaw = Esc_input.filt_yr - Esc_sac.us_target_ay_yaw;
temp_us_brk_speed_gain = Lookup(Esc_input_process.veh_spd, 5, cal.us_brk_speed_gain_tbl); //256

if Esc_sac.us_prohibited == 0 && Esc_cst.act_mode == FULL_CONTROL
{
	if Esc_sac.us_brk_active == 0
	{
		if (
			Esc_input_process.veh_spd > cal.us_brk_spd_thr //256
		&& Mue.mu_act_y_s16 < cal.us_brake_ay_thr
		&&(
			(SIGN(Esc_input.filt_yr) > 0 && Esc_input_process.sa_at_wheel > cal.us_enable_sa_at_wheel_thr)
			|| (SIGN(Esc_input.filt_yr) < 0 && Esc_input_process.sa_at_wheel < - cal.us_enable_sa_at_wheel_thr)
		)
		&& Esc_upc.us_delay_timer <= 0
		&& Esc_upc.upc_prop_error > max(Esc_sac.front_max_slip_angle, Esc_upc.us_entry_error_thr)
		&& SIGN(Esc_input.filt_yr) == SIGN(Esc_yrc.swa_yaw)
		&& SIGN(Esc_input.filt_yr) ==  SIGN(Esc_input.filt_ay)
		&& (
			(temp_delta_yaw <= -DEGREE_PER_SEC && Esc_input.sign_ay > 0 && Esc_input.swa_dot > 0) //128
			|| (temp_delta_yaw >= DEGREE_PER_SEC && Esc_input.sign_ay < 0 && Esc_input.swa_dot < 0))
		)
		{
			Esc_sac.us_brk_active_wait_timer = min(Esc_sac.us_brk_active_wait_timer + ESC_CONTROL_LOOPTIME, 20);
			if Esc_sac.us_brk_active_wait_timer >= 20 * 1{
				Esc_sac.us_brk_active = 1;
				Esc_sac.us_brk_active_wait_timer = 0;
			}
			else{
				Esc_sac.us_brk_active = 0;
			}
		}
		else{
			Esc_sac.us_brk_active = 0;
			Esc_sac.us_brk_active_wait_timer = 0;
		}
	}
	else{
		if (Esc_upc.upc_prop_error <= Esc_sac.front_max_slip_angle - cal.us_brake_exit_slip_angle_thr //128
		||(
			(temp_delta_yaw >= DEGREE_PER_SEC || Esc_input.swa_dot < -50 * 16) 
			&& Esc_input.sign_ay >= 0)
		||(
			(temp_delta_yaw <= - DEGREE_PER_SEC || Esc_input.swa_dot > 50 * 16) 
			&& Esc_input.sign_ay < 0))
		)
		{
			Esc_sac.us_brk_active = 0;
		}
	}

	if Esc_sac.us_brk_active == 1{
		Esc_sac.us_prop_term = temp_us_brk_p_gain * temp_delta_yaw / 128 *1;
		Esc_sac.us_deri_term = temp_us_brk_d_gain * Esc_input.yr_dot / 64 *1;

		temp_delta_us_int_term = (Esc_sac.us_prop_term + Esc_sac.us_deri_term) * temp_us_brk_i_gain / (1024 / 128);
		Esc_sac.us_int_term = limit(Esc_sac.us_int_term + temp_delta_us_int_term, -cal.max_torq_diff_us * 128, cal.max_torq_diff_us * 128); //1
		
		Esc_sac.sac_us_l_r_torq_diff_raw = limit( Esc_sac.us_prop_term + Esc_sac.us_deri_term + Esc_sac.us_int_term /128, -cal.max_torq_diff_us, cal.max_torq_diff_us);

		if Esc_input.sign_ay >= 0
		{
			Esc_sac.sac_us_l_r_torq_diff_raw = min( Esc_sac.sac_us_l_r_torq_diff_raw, 0);
		}
		else{
			Esc_sac.sac_us_l_r_torq_diff_raw = max( Esc_sac.sac_us_l_r_torq_diff_raw, 0);
		}

		Esc_sac.sac_us_l_r_torq_diff_raw = Esc_sac.sac_us_l_r_torq_diff_raw * temp_us_brk_speed_gain /128;
	}
	else{
		Esc_sac.us_prop_term = 0;
		Esc_sac.us_deri_term = 0;
		Esc_sac.us_int_term = 0;
		Esc_sac.sac_us_l_r_torq_diff_raw = 0;
	}
}
else{
	Esc_sac.us_brk_active = 0;
	Esc_sac.us_prop_term = 0;
	Esc_sac.us_deri_term = 0;
	Esc_sac.sac_us_l_r_torq_diff_raw = 0;
	Esc_sac.us_brk_active_wait_timer = 0;
}

if Esc_sac.sac_us_l_r_torq_diff_raw > 0{
	Esc_sac.sac_us_l_r_torq_diff = limit(Esc_sac.sac_us_l_r_torq_diff_raw, Esc_sac.sac_us_l_r_torq_diff - cal.us_ramp_down, Esc_sac.sac_us_l_r_torq_diff + cal.us_ramp_up); //1
	Esc_sac.sac_us_l_r_torq_diff = max(Esc_sac.sac_us_l_r_torq_diff, 0);
}
else if Esc_sac.sac_us_l_r_torq_diff < 0{
	Esc_sac.sac_us_l_r_torq_diff = limit(Esc_sac.sac_us_l_r_torq_diff_raw, Esc_sac.sac_us_l_r_torq_diff - cal.us_ramp_up, Esc_sac.sac_us_l_r_torq_diff + cal.us_ramp_down); //1
	Esc_sac.sac_us_l_r_torq_diff = min(Esc_sac.sac_us_l_r_torq_diff, 0);
}
else {
	if Esc_sac.sac_us_l_r_torq_diff > 0{
		Esc_sac.sac_us_l_r_torq_diff = max(Esc_sac.sac_us_l_r_torq_diff - cal.us_ramp_down, 0);
	}
	else if (Esc_sac.sac_us_l_r_torq_diff < 0){
		Esc_sac.sac_us_l_r_torq_diff = min(Esc_sac.sac_us_l_r_torq_diff + cal.us_ramp_down, 0);
	}
	else{
		Esc_sac.sac_us_l_r_torq_diff = 0;
	}
}

Esc_sac.sac_us_l_r_torq_diff = limit(Esc_sac.sac_us_l_r_torq_diff, -cal.max_torq_diff_us, cal.max_torq_diff_us);
```
