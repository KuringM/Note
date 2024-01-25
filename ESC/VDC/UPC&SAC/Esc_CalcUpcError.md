```c
tmp_fr_slip_angle_diff = (Esc_input.filt_yr - Esc_yrc.swa_yaw) * Esc_input.wheel_base / ( Meter /*1024*/ * 256) * ( WHL_ANGLE_DEGREES/*128*/ / DEGREE_PER_SEC/*128*/) / Esc_input_process.veh_spd;

Esc_upc.fr_slip_angle_diff_phase_delay = Util_Filter(tmp_fr_slip_angle_diff, &Filt1_upc_erroe_states, &cal.upc_error_filt_coeff ); // 1U

temp_fr_slip_angle_dot = Esc_upc.fr_slip_angle_diff_phase_delay - Esc_upc.fr_slip_angle_diff_Phase_delay_old;
temp_fr_slip_angle_dot = limit(temp_fr_slip_angle_dot * 128 /128 * 10, -2^16, 2^16)

temp_filter = Util_Filter3(temp_fr_slip_angle_dot, &Filt3_fr_slip_angle_dot_states, &cal.fr_slip_angle_dot_filt_coef);
Esc_upc.fr_slip_angle_dot = limit(temp_filter, -2^16, 2^16);

temp_fr_slip_angle_diff_thr = LookUp(Esc_input_process.veh_spd, 4, cal.max_fr_slip_angle_diff_tbl); //1024
temp_fr_surface_gain = LookUp(Mue.mu_act_y_s16, 4, cal.upc_surface_gain_tbl); //256
Esc_upc.max_fr_slip_angle_diff = temp_fr_slip_angle_diff_thr * temp_fr_surface_gain / 256;
Esc_upc.us_entry_spd_thr = LookUp(Mue.mu_act_y_s16, 4, cal.upc_entry_spd_tbl); //256
Esc_upc.us_entry_error_thr = LookUp(Mue.mu_act_y_s16, 3, cal.upc_entry_error_thr_tbl); //128
Esc_upc.us_exit_thr = LookUp(Mue.mu_act_y_s16, 3, cal.upc_exit_thr_tbl); //128
Esc_upc.fr_slip_angle_diff_Phase_delay_old = Esc_upc.fr_slip_angle_diff_phase_delay;

if Esc_input.is_tcs_split_detected == 1 || Esc_input.is_in_abs_split_ctrl == 1
{
  Esc_upc.us_entry_error_thr = Esc_upc.us_entry_error_thr + cal.upc_entry_error_hys; //128
}

if Esc_input.sign_ay > 0
{
  Esc_upc.upc_prop_error = - Esc_upc.fr_slip_angle_diff_phase_delay - Esc_upc.max_fr_slip_angle_diff;
}
else{
  Esc_upc.upc_prop_error = Esc_upc.fr_slip_angle_diff_phase_delay - Esc_upc.max_fr_slip_angle_diff;
}

if Esc_upc.fr_slip_angle_diff_phase_delay * Esc_input.sign_ay > 0{
  temp_reserve = Esc_upc.max_fr_slip_angle_diff;
}
else if (ABS(Esc_upc.fr_slip_angle_diff_phase_delay) > Esc_upc.max_fr_slip_angle_diff){
  temp_reserve = 0;
}
else{
  temp_reserve = Esc_upc.max_fr_slip_angle_diff - ABS(Esc_upc.fr_slip_angle_diff_phase_delay);
  temp_reserve = max(temp_reserve. 0);
}

Esc_upc.front_max_slip_angle_safety_margin = temp_reserve * 1024 / max(Esc_upc.max_fr_slip_angle_diff, 0.5 * 128);
```