```c
Esc_upc.control_active = 1;
Esc_upc.control_state = S_UPC_ACTIVE;

if Esc_upc.control_active_old != Esc_upc.control_active{
  Esc_upc.us_fx_cmd = 0;
  Esc_upc.us_proportion_term = 0;
  Esc_upc.us_integral_term = 0;
  Esc_upc.slot = 1;
  Esc_upc.driving_torq_latched_front = Max(Esc_input.axle_drving_torq[0], Cal.upc_min_latch_torq_f); //1
  Esc_upc.driving_torq_latched_rear = Max(Esc_input.axle_drving_torq[1], Cal.upc_min_latch_torq_r); //1
}
else{ Esc_upc.slot =2 ;}

Esc_upc.max_torq_us = Max(Esc_upc.driving_torq_latched_front + Esc_upc.driving_torq_latched_rear - cal.torq_latched_offst, 0);

temp_upc_p_gain = LookUp(Mue.mu_act_y_s16, 3, Cal.upc_p_gain_tbl);
temp_upc_d_gain = LookUp(Mue.mu_act_y_s16, 3, Cal.upc_d_gain_tbl);
temp_upc_i_gain = LookUp(Mue.mu_act_y_s16, 3, Cal.upc_integral_gain_tbl);
temp_upc_speed_gain = LookUp(Esc_input_process.veh_spd, 3, Cal.upc_spd_gain_tbl);

Esc_upc.us_proportion_term = Esc_upc.upc_prop_error * temp_upc_p_gain / 128 * 1; 
Esc_upc.us_proportion_term = limit(Esc_upc.us_proportion_term, -cal.us_prop_max, cal.us_prop_max); //1

Esc_upc.us_differential_term = Esc_upc.fr_slip_angle_dot * temp_upc_d_gain;
Esc_upc.us_differential_term = limit(Esc_upc.us_differential_term, -cal.us_deri_max, cal.us_deri_max); //1

temp_upc_pd_term = Esc_upc.us_proportion_term + Esc_upc.us_differential_term;
temp_delta_us_integral_term = temp_upc_pd_term * temp_upc_i_gain / (1024 / 128);
temp_delta_us_integral_term = limit(temp_delta_us_integral_term, cal.upc_int_neg_change_limit, cal.upc_int_pos_change_limit); //128
Esc_upc.us_integral_term = limit(Esc_upc.us_integral_term + temp_delta_us_integral_term, 0, Esc_upc.max_torq_us * 128);
Esc_upc.us_fx_cmd = temp_upc_pd_term + Esc_upc.us_integral_term / 128;
Esc_upc.us_fx_cmd = Esc_upc.us_fx_cmd * temp_upc_speed_gain / 1024;
Esc_upc.us_fx_cmd = limit(Esc_upc.us_fx_cmd, 0, 2^16);
```

