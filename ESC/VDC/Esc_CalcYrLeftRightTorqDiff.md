```C
tmp_p_gain = LookUp(Mue.mu_act_y_s16, 5, Cal.yrc_prop_gain); //1
tmp_d_gain = LookUp(Mue.mu_act_y_s16, 5, Cal.yrc_deri_gain); //1
tmp_i_gain = LookUp(Mue.mu_act_y_s16, 5, Cal.yrc_int_gain); //1024

if(Mue.mu_act_y_s16 <= Cal.high_mu_thr) //256
{
  temp_yaw_max_torque = Cal.max_torq_diff_yrc_low_mu; //256
  temp_ydc_max_torque = Cal.max_torq_diff_ydc_low_mu;
}
else{
  temp_yaw_max_torque = Cal.max_torq_diff_yrc; //256
  temp_ydc_max_torque = Cal.max_torq_diff_ydc;
}

if ( Esc_yrc.yrc_yaw_active == 1 || Esc_yrc.int_term_l_r_diff != 0)
{
  controller_action_required = 1;
}
else{
  controller_action_required = 0;
}

// Calculate P term 
if controller_action_required == 1 {Esc_yrc.yr_error = Esc_yrc.yr_error_os;}
else {Esc_yrc.yr_error = 0}

if ( controller_action_required == 1){
  Esc_yrc.prop_term_l_r_diff = limit( Esc_yrc.yr_error * tmp_p_gain / 128 *1, -temp_yaw_max_torque, temp_yaw_max_torque);
  if (Esc_yrc.yr_error * Esc_yrc.ay_yaw < 0)
  {
    Esc_yrc.prop_term_l_r_diff = Esc_yrc.prop_term_l_r_diff * Cal.prop_mod_gain_under_thr / 1024; //1024
  }
}
else{
  Esc_yrc.prop_term_l_r_diff = 0;
}

if(controller_action_required == 1){
  if(Esc_yrc.peak_prop_term_l_r_diff < ABS(Esc_yrc.prop_term_l_r_diff))
  {
    Esc_yrc.peak_prop_term_l_r_diff = ABS(Esc_yrc.prop_term_l_r_diff);
  }
}
else{
  Esc_yrc.peak_prop_term_l_r_diff = 0;
}

// Calculate D term
if ( Esc_yrc.swa_yaw_dot * Esc_input.filt_yr < 0
  && Esc_yrc.swa_yaw_dot * Esc_input.yr_dot < 0)
{
  r_lin_deriv_limited = limit(Esc_yrc.swa_yaw_dot, -Cal.max_swa_yaw_dot_limit, cal.max_swa_yaw_dot_limit); //64
  r_ref_d_error = Esc_input.yr_dot - r_lin_deriv_limited;
  r_ref_d_error = r_ref_d_error * cal.yrc_dev_gain / 1024; //1024
  Esc_yrc.yrc_deviate = limit(r_ref_d_error, -2^16, 2^16);
}
else{
  Esc_yrc.yrc_deviate = Esc_input.yr_dot;
}

if(controller_action_required == 1){
  Esc_yrc.diff_term_l_r_diff = limit( Esc_yrc.yrc_deviate * tmp_d_gain / 64 * 1, -temp_yaw_max_torque, temp_yaw_max_torque);
  if ( Esc_yrc.diff_term_l_r_diff * Esc_yrc.ay_yaw < 0){
    Esc_yrc.diff_term_l_r_diff = Esc_yrc.diff_term_l_r_diff * Cal.dev_mod_gain_under_thr / 1024;
  }
}
else{
  Esc_yrc.diff_term_l_r_diff = 0;
}

// Calculate I term 
Esc_yrc.yrc_int_in = limit(Esc_yrc.prop_term_l_r_diff + Esc_yrc.diff_term_l_r_diff, -2^16, 2^16);

if (Esc_yrc.yrc_int_in * Esc_yrc.ay_yaw < 0
  &&Esc_yrc.int_term_l_r_diff !=0){
  Esc_yrc.yrc_int_in = Esc_yrc.yrc_int_in * cal.int_mod_gain_under_thr / 1024; //1024
}

if (Esc_yrc.int_term_l_r_diff * Esc_yrc.yrc_torq_diff_for_ireset < 0
  ||Esc_yrc.ay_yaw * Esc_yrc.yrc_torq_diff_for_ireset < 0
  || Esc_yrc.ay_yaw * Esc_input.sign_yr < 0)
{
  integrator_out_of_phase = 1;
}
else{ integrator_out_of_phase = 0;}

if ( integrator_out_of_phase == 1
  || controller_action_required == 0
  || Esc_cst.act_mode != FULL_CONTROL
  || Esc_yrc.ay_yaw * Esc_yrc.prop_term_l_r_diff <= 0 && Esc_yrc.yr_l_r_torq_diff_no_limit == 0
  ||(
    ABS(Esc_yrc.filt_yr < cal.integral_reset_yaw_thr)
    && ABS(Esc_input_process.ay_yaw_filter < Cal.integral_reset_yaw_thr)
    && ABS(Esc_yrc.swa_yaw < cal.integral_reset_yaw_thr)
  )
  ||(
    Esc_yrc.yrc_yaw_active == 0
    && Esc_input.driver_braking_torque[0] > cal.min_brk_torq_for_abs_override
    && Esc_input.driver_braking_torque[1] > cal.min_brk_torq_for_abs_override
    && Esc_input.driver_braking_torque[2] > cal.min_brk_torq_for_abs_override
    && Esc_input.driver_braking_torque[3] > cal.min_brk_torq_for_abs_override
  )
  || Esc_yrc.yrc_yaw_active == 0 && Esc_itd.incline_turn_detected == 1
  || Esc_input.veh_spd_unlimited < Cal.yrc_vs_entrance_thr
  )
{
  reset_integrator = 1;
}
else{ reset_integrator = 0;}

if (Esc_yrc.yrc_yaw_active == 1 && reset_integrator == 0){
  temp_int_in = limit(Esc_yrc.yrc_int_in, -cal.max_integral_error, cal.max_integral_error);
  temp_max_int_term = ABS(Esc_yrc.peak_prop_term_l_r_diff * cal.max_int_term_gain / 256 *1); //256
  Esc_yrc.int_term_l_r_diff = limit(temp_int_in * tmp_i_gain / 1024 + Esc_yrc.int_term_l_r_diff, -temp_max_int_term, temp_max_int_term);
}
else if (Esc_yrc.int_term_l_r_diff !=0 && reset_integrator == 0){
  delta_int_term = Esc_yrc.yrc_int_in * tmp_i_gain / 1024;
  delta_int_term = ABS(delta_int_term);
  temp_int_ramp_rate = limit(delta_int_term, cal.min_integral_ramp_rate, cal.max_integral_ramp_rate);

  if Esc_yrc.int_term_l_r_diff > 0{
    Esc_yrc.int_term_l_r_diff = Max(Esc_yrc.int_term_l_r_diff- temp_int_ramp_rate, 0);
  }
  else{
    Esc_yrc.int_term_l_r_diff = MIN(Esc_yrc.int_term_l_r_diff + temp_int_ramp_rate, 0);
  }
}
else { Esc_yrc.int_term_l_r_diff = 0}

temp_min_yaw_torque = LookUp(Mue.mu_act_y_s16, 5, cal.min_yrc_torque_tbl); //1
temp_speed_gain = LookUp(Esc_input_process.veh_spd, 5, cal.yrc_speed_gain); //256
temp_max_torq_rate = LookUp(Esc_yrc.yr_l_r_torq_diff_no_limit, 5, cal.max_yrc_torq_rate_tbl); //1

if Esc_cst.act_mode == FULL_CONTROL
{
  if controller_action_required == 1{
    os_cor_mnt_r_ref_sum = Esc_yrc.prop_term_l_r_diff + Esc_yrc.int_term_l_r_diff + Esc_yrc.diff_term_l_r_diff;
    if ( ABS(os_cor_mnt_r_ref_sum) <= temp_min_yaw_torque && Esc_yrc.min_torq_reset == 0){
      if(os_cor_mnt_r_ref_sum > 0){
        os_cor_mnt_r_ref_sum = Max(os_cor_mnt_r_ref_sum, temp_min_yaw_torque);
      }
      else{
        os_cor_mnt_r_ref_sum = MIN(os_cor_mnt_r_ref_sum, -temp_min_yaw_torque);
      }
    }
    else{
      Esc_yrc.min_torq_reset = 1;
    }
  }
  else{
    os_cor_mnt_r_ref_sum = 0;
    Esc_yrc.min_torq_reset = 0;
  }

  os_cor_mnt_r_ref_sum = os_cor_mnt_r_ref_sum * temp_speed_gain / 256;
  os_cor_mnt_r_ref_sum = limit(os_cor_mnt_r_ref_sum, -temp_yaw_max_torque, temp_yaw_max_torque);
  Esc_yrc.yrc_torq_diff_for_ireset = os_cor_mnt_r_ref_sum;
  
  if(Esc_yrc.ay_yaw >= 0){
    Esc_yrc.yr_l_r_torq_diff_no_limit = limit(os_cor_mnt_r_ref_sum, 0, Esc_yrc.yr_l_r_torq_diff_no_limit + temp_max_torq_rate);
  }
  else{
    Esc_yrc.yr_l_r_torq_diff_no_limit = limit(os_cor_mnt_r_ref_sum, Esc_yrc.yr_l_r_torq_diff_no_limit - temp_max_torq_rate, 0);
  }
}
else{
  if Esc_yrc.yr_l_r_torq_diff_no_limit > 0{
    Esc_yrc.yr_l_r_torq_diff_no_limit = Max(Esc_yrc.yr_l_r_torq_diff_no_limit - cal.yrc_torq_rampout, 0); //1
  }
  if Esc_yrc.yr_l_r_torq_diff_no_limit < 0{
    Esc_yrc.yr_l_r_torq_diff_no_limit = Min(Esc_yrc.yr_l_r_torq_diff_no_limit - cal.yrc_torq_rampout, 0);
  }
  Esc_yrc.yrc_torq_diff_for_ireset =0;
}

if cal.yrc_torq_limit_alwd == 1{
  Esc_yrc.yr_l_r_torq_diff_yaw = Esc_CalcRateLimitOsCorMnt();
}
else{
  Esc_yrc.yr_l_r_torq_diff_yaw = Esc_yrc.yr_l_r_torq_diff_no_limit;
}
// YRC PID END

temp_ydc_p_gain = LookUp(Esc_input_process.veh_spd, 4, cal.ydc_speed_p_gain); //1024
temp_ydc_d_gain = LookUp(Esc_input_process.veh_spd, 4, cal.ydc_speed_d_gain)

if Esc_yrc.ydc_active != 0 && Esc_cst.act_mode ==FULL_CONTROL{
  if Esc_yrc.ydc_error_os * Esc_input.filt_yr > 0{
    temp_ydc_p_term = Esc_input.filt_yr * temp_ydc_p_gain / 128 *1;
  }
  else{
    temp_ydc_p_term = 0;
  }

  temp_ydc_d_term = Esc_yrc.ydc_error_os * temp_ydc_d_gain / 64 *1;

  Esc_yrc.ydc_l_r_torq_diff = limit(temp_ydc_p_term + temp_ydc_d_term, -temp_ydc_max_torque, temp_ydc_max_torque);
}
else{
  if(Esc_yrc.ydc_l_r_torq_diff > 0){
    Esc_yrc.ydc_l_r_torq_diff = MAX(Esc_yrc.ydc_l_r_torq_diff - cal.yrc_torq_rampout, 0); //1
  }
  else if Esc_yrc.ydc_l_r_torq_diff < 0{
    Esc_yrc.ydc_l_r_torq_diff = MIN(Esc_yrc.ydc_l_r_torq_diff + cal.yrc_torq_rampout, 0);
  }
}

if(SIGN(Esc_yrc.ydc_l_r_torq_diff) == SIGN(Esc_yrc.yr_l_r_torq_diff_yaw)
  || Esc_yrc.ydc_l_r_torq_diff == 0
  || Esc_yrc.yr_l_r_torq_diff_yaw == 0)
{
  if Esc_yrc.ydc_l_r_torq_diff == 0{
    Esc_yrc.yr_l_r_torq_diff = Esc_yrc.yr_l_r_torq_diff_yaw;
  }
  else if Esc_yrc.yr_l_r_torq_diff_yaw == 0{
    Esc_yrc.yr_l_r_torq_diff = Esc_yrc.ydc_l_r_torq_diff;
  }
  else{
    Esc_yrc=yr_l_r_torq_diff = MAX(ABS(Esc_yrc.ydc_l_r_torq_diff), ABS(Esc_yrc.yr_l_r_torq_diff_yaw));
    Esc_yrc.yr_l_r_torq_diff = SIGN(Esc_yrc.yr_l_r_torq_diff_yaw) * Esc_yrc.yr_l_r_torq_diff;
  }
}
else{Esc_yrc.yr_l_r_torq_diff = Esc_yrc.ydc_l_r_torq_diff;}

Esc_yrc.yr_l_r_torq_diff = limit(Esc_yrc.yr_l_r_torq_diff, -temp_yaw_max_torque, temp_yaw_max_torque);
Esc_yrc.yrc_active = Esc_yrc.ydc_active || Esc_yrc.yrc_yaw_active;
```