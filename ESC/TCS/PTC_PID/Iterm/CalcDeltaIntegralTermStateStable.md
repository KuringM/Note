## `CalcDeltaIntegralTermStateStable`

```c
whl_depart_soon = 0;
all_wheel_is_stable = 1;
first_wheel_accel = 0;

temp_veh_ax_low_res = 0;
fast_slip = 0;
fast_range = 0;
fast_wheel_ax = 0;
no_slip_time = 3000;
/*
STATE_STABLE 0
STATE_SPLIT 1
STATE_HOMOGENEOUS 2
*/
if(Tcs_axle[].slip_state == z)
{
  temp_veh_ax_low_res = Max(Tcs_input.veh_ax * 32 /256, 0);
  
  fast_slip = Max(Tcs_whl[left].delta_spd_side, Tcs_whl[right].delta_spd_side);
  fast_range = Max(Tcs_whl[left].velocity_range - Tcs_whl[right].velocity_range);
  fast_wheel_ax = Max(Tcs_input.whl_ax[left], Tcs_input.whl_ax[left]);
  no_slip_time = MIN(Tcs_whl[left].out_slip_time, Tcs_whl[right].out_slip_time);
  
  if(Tcs_whl[left].delta_spd_side > Tcs_whl[left].velocity_range * Cal.first_wheel_accel_slip_thr[] /1024 //1024
   &&Tcs_input.whl_ax[left] > temp_veh_ax_low_res + Cal.ax_thr_1st_whl_low_accel[]) //32
  ||(Tcs_whl[right].delta_spd_side > Tcs_whl[right].velocity_range * Cal.first_wheel_accel_slip_thr[] /1024 //1024
   &&Tcs_input.whl_ax[right] > temp_veh_ax_low_res + Cal.ax_thr_1st_whl_low_accel[])
  {
    first_wheel_accel = 1;
  }
  
  if(fast_wheel_ax > temp_veh_ax_low_res + Cal.ax_thr_1st_whl_accel[] //32
   ||first_wheel_accel = 1)
  {
    Tcs_axle[].first_wheel_decel_stable_state = 0;
  }
    
  Tcs_axle[].noslip_time = Min(Tcs_axle[].noslip_time + 10, 30000);
    
  temp_depart_soon_slip_thr = Lookup(Tcs_axle[f/r].noslip_time, 4, Cal.depart_soon_slip_f/r_thr_tbl); //1024
  temp_depart_soon_slip_thr = temp_depart_soon_slip_thr * fast_range /1024;
  temp_stable_soon_slip_thr = Lookup(Tcs_axle[f/r].noslip_time, 4, Cal.stable_soon_slip_f/r_thr_tbl); //1024
  temp_stable_soon_slip_thr = temp_stable_soon_slip_thr * fast_range /1024;
    
    //Calculate `Tcs_axle[].noslip_time`
  if(fast_wheel_ax > Tcs_input.veh_ax * 32/256 + Cal.must_stable_whl_ax_thr_f/r //32
    &&( fast_wheel_ax > Tcs_input.veh_ax * 32/256 + Cal.stable_whl_ax_thr_f/r //32
      ||fast_slip > temp_depart_soon_slip_thr))
  ||(Tcs_input.bend_detect_estimate > Cal.too_stable_bend_thr //1024
    &&(Tcs_input.os_us_metric < -Cal.too_stable_us_thr && axle == F //1024
     ||Tcs_input.os_us_metric > Cal.too_stable_us_thr && axle == R) //1024
    &&Tcs_axle[].first_wheel_decel_stable_state == 0)
  {
    whl_depart_soon = 1;
    Tcs_axle[].noslip_time -= Tcs_axle[].noslip_time * Cal.stable_depart_soon_dec_gain_f/r /1024; //1024
  }
  else if( fast_slip < temp_stable_soon_slip_thr
        &&(
          Tcs_input.bend_detect_estimate < Cal.too_stable_bend_low_thr //1024
          ||(Tcs_input.os_us_metric > -Cal.too_stable_us_low_thr && axle == F //1024
      	   ||Tcs_input.os_us_metric < Cal.too_stable_os_low_thr && axle == R)
        ))
  {
        if(Tcs_whl[left].stable_time <= Cal.whl_stable_time_thr_f/r //1
           ||Tcs_whl[right].stable_time <= Cal.whl_stable_time_thr_f/r) //1
        {
            all_wheel_is_stable = 0;
        }
        if(all_wheel_is_stable == 1)
        {
            Tcs_axle[].noslip_time = Max(Tcs_axle[].noslip_time + Cal.too_stable_gain_hi[] * 10/1024, Cal.min_noslip_time_stable_f/r); //1 1024
        }
        else
        {
            Tcs_axle[].noslip_time = Tcs_axle[].noslip_time + Cal.too_stable_gain_min_f/r * 10/1024; //1024
        }
  }
    
    //Calculate `no slip time`
    if(whl_depart_soon = 0
      &&(fast_slip < fast_range * Cal.stable_slip_thr_init_restore_f/r /1024 //1024
         || Tcs_axle[].first_wheel_decel_stable_state == 1))
    {
        Tcs_axle[].noslip_init_restore = 1;
        no_slip_time = Min(Tcs_axle[].noslip_time + no_slip_time * Cal.stable_noslip_time_gain_f/r /1024); //1024
        no_slip_time = Max(no_slip_time, Cal.min_noslip_time_init_f/r); //1
    }
    else
    {
        if(Tcs_axle[].noslip_init_restore ==1)
        {
            Tcs_axle[].noslip_time = 0;
            Tcs_axle[].noslip_init_restore = 0;
        }
        no_slip_time = Tcs_axle[].noslip_time;
    }
    no_slip_time = Min(no_slip_time, 30000);
    
    //Calibrate `Tcs_axle[].pt_delta_integral_term`
    Tcs_axle[].pt_delta_integral_term = Lookup(no_slip_time, 8, Cal.Stable_delta_iterm_f/r_tbl); //256
    if(Tcs_axle[].noslip_init_restore == 1)
    {
        Tcs_axle[].pt_delta_integral_term = Max(Tcs_axle[].pt_delta_integral_term, Cal.stable_delta_iterm_init_restore_f/r); //256
    }
    if(Tcs_input.axle_shudd_detect[] == 1)
    {
        shudder_adjust = Cal.no_slip_shudder_thr_f/r - Tcs_input.axle_shudd_confidence[]; //1024
        shudder_adjust = Max(shudder_adjust, Cal.no_slip_shudder_min_f/r); //1024
        Tcs_axle[].pt_delta_integral_term = pt_delta_integral_term * shudder_adjust /1024;
    }
    if(Tcs_input.bend_detect_estimate > Cal.stable_bend_adjust_thr) //1024
    {
        Tcs_axle[].pt_delta_integral_term = Tcs_axle[].pt_delta_integral_term * Cal.stable_bend_adjust_thr \ //1024
                                            / Max(1, Tcs_input.bend_detect_estimate);
    }
    else
    {
        if(fast_slip > fast_range / Cal.stable_delta_iterm_slip_range_f/r) //1
        {
            Tcs_axle[].pt_delta_integral_term = Max(Tcs_axle[].pt_delta_integral_term, 0);
        }
        else
        {
            Tcs_axle[].pt_delta_integral_term = Max(Tcs_axle[].pt_delta_integral_term, Cal.stable_min_delta_iterm_f/r); //256
        }
    }
    if(Tcs_axle[].split_mu_deteted == 1)
    {
        Tcs_axle[].pt_delta_integral_term = Max(Tcs_axle[].pt_delta_integral_term, Cal.split_inc_in_stable_state_f/r); //256
    }
}
else
{
    Tcs_axle[].first_wheel_decel_stable_state = 1;
    Tcs_axle[].noslip_time = Max(Tcs_axle[].noslip_time - Cal.stable_time_reset[], 0); //1
}
```

