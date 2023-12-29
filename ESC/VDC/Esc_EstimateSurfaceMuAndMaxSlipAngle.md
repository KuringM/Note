```C
tmp_front_max_slip_angle= Lookup(Esc_input_process.veh_spd, 4, cal.us_slip_angle_thr_tbl);
tmp_front_surface_estimation_gain = Lookup(Mue.mu_act_y_s16, 4, cal.us_surface_estimation_gain_tbl);
tmp_front_max_slip_angle = tmp_front_max_slip_angle * tmp_front_surface_estimation_gain / 256);
Esc_sac.front_max_slip_angle = tmp_front_max_slip_angle;

if ( Esc_itd.incline_turn_detected == 0){
  Esc_sac.front_max_slip_angle = cal.f_msa_bc_adjust + Esc_sac.front_max_slip_angle; //128
}
```