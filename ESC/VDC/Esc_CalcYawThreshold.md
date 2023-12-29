```C
final_threshold = Esc_yrc.thresholds_base_desen + Esc_yrc.dynamic_desen - Esc_yrc.dynamic_sen;
Esc_yrc.target_yaw_rate_threshold = final_threshold;

temp_osbi = Esc_yrc.target_yaw_rate_threshold + Cal.yaw_error_act_thr_hyst + Esc_yrc.dynamic_activation_hysf; //128
temp_osbi = limit(temp_osbi, 0, 200*128);
temp_thr_limit = limit(Esc_yrc.target_yaw_rate_threshold, 1, 200*64);

if ( Esc_yrc.ay_yaw >= 0 ){
  Esc_yrc.yaw_plus_active_thr = Esc_yrc.r_ref + temp_osbi;
  Esc_yrc.target_yaw_rate_filt = Esc_yrc.r_ref + temp_thr_limit;
}
else{
  Esc_yrc.yaw_plus_active_thr = Esc_yrc.r_ref - temp_osbi;
  Esc_yrc.target_yaw_rate_filt = Esc_yrc.r_ref -temp_thr_limit;
}

if SIGN(Esc_yrc.ay_yaw == SIGN(Esc_input.filt_yr)){
  if(Esc_yrc.ay_yaw >= 0){
    if (Esc_input.filt_yr > Esc_yrc.yaw_plus_active_thr){
      Esc_yrc.error_present = 1;
    }
    else if (Esc_input.filt_yr < Esc_yrc.target_yaw_rate_filt){
      Esc_yrc.error_present = 0;
    }
  }
  else{
    if (Esc_input.filt_yr < Esc_yrc.yaw_plus_active_thr){
      Esc_yrc.error_present = 1;
    }
    else if (Esc_input.filt_yr > Esc_yrc.target_yaw_rate_filt){
      Esc_yrc.error_present = 0;
    }
  }
}
```
