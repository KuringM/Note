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
if(Tcs_axle[].slip_state == STATE_STABLE)
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
    
    if(fast_wheel_ax > temp_veh_ax_low_res + Cal.ax_thr_1st_whl_accel[]
     ||first_wheel_accel = 1)
    {
        Tcs_axle[].first_wheel_decel_stable_state = 0;
    }
    
    Tcs_axle[].noslip_time = Min(Tcs_axle[].noslip_time + 10, 30000);
    
    temp_depart_soon_slip_thr = Lookup(Tcs_axle[f/r].noslip_time, 4, Cal.depart_soon_slip_f/r_thr_tbl); //1024
    temp_depart_soon_slip_thr = temp_depart_soon_slip_thr * fast_range /1024;
    temp_stable_soon_slip_thr = Lookup(Tcs_axle[f/r].noslip_time, 4, Cal.stable_soon_slip_f/r_thr_tbl); //1024
    temp_stable_soon_slip_thr = temp_stable_soon_slip_thr * fast_range /1024;
    
    if(fast_wheel_ax > Tcs_input.veh_ax * 32/256 + Cal.must_stable_whl_ax_thr_f/r //32
       &&(fast_wheel_ax > Tcs_input.veh_ax * 32/256 + Cal.stable_whl_ax_thr_f/r //32
        ||fast_slip > temp_depart_soon_slip_thr))
    ||(Tcs_input.bend_detect_estimate > Cal.too_stable_bend_thr //1024
       &&(Tcs_input.os_us_metric < -Cal.too_stable_us_the && axle == F //1024
       	  ||Tcs_input.os_us_metric > Cal.too_stable_us_the && axle == R) //1024
       &&Tcs_axle[].first_wheel_decel_stable_state == 0)
    {
        whl_depart_soon = 1;
        Tcs_axle[].noslip_time -= Tcs_axle[].noslip_time * Cal.stable_depart_soon_dec_gain_f/r /1024; //1024
    }
    else if(fast_slip < temp_stable_soon_slip_thr
            &&(Tcs_input.bend_detect_estimate < Cal.too_stable_bend_low_thr //1024
               ||(Tcs_input.os_us_metric > -Cal.too_stable_low_the && axle == F //1024
      	    	  ||Tcs_input.os_us_metric < Cal.too_stable_low_the && axle == R)))
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
    
    //Todo
    if(whl_depart_soon = 0)
}
else
{
    Tcs_axle[].first_wheel_decel_stable_state = 1;
    Tcs_axle[].noslip_time = Max(Tcs_axle[].noslip_time - Cal.stable_time_reset[], 0); //1
}
```

