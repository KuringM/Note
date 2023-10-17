## `CalcDeltaIntegralTermStateHomo`

```c
excessive_two_slip = 1;

if(Tcs_axle[].slip_state == STATE_HOMOGENEOUS)
{
    if(Tcs_whl[left].delta_spd_error < Cal.two_slip_min_f/r //256
       ||Tcs_whl[right].delta_spd_error < Cal.two_slip_min_f/r) //256
    {
        excessive_two_slip = 0;
    }
    //pd term
    temp_pt_pd_term = Tcs_axle[].pt_proportional_term + Tcs_axle[].pt_derivative_term;
    excessive_two_slip = -  excessive_two_slip;
    
    temp_gain = Cal.pt_int_gain_f/r_[Gear]; //1024*4
    if(Tcs_axle[].gain_scheduling == GAIN_INITIAL)
    {
        temp_gain = temp_gain * Cal.pt_int_1st_cycle_adjust_f/r / 256; //256
    }
    
    temp_delta_iterm = temp_delta_iterm * temp_gain / (4096/256); 
    
    if(Tcs_input.whl_ax[left] < Cal.two_slip_whl_recovery_thr_f/r //32
       &&Tcs_input.whl_ax[right] < Cal.two_slip_whl_recovery_thr_f/r) //32
    {
        temp_avg_recover_whl_ax = (Tcs_input.whl_ax[left] + Tcs_input.whl_ax[right]) /2;
        temp_avg_recover_whl_ax = Lookup(temp_avg_recover_whl_ax, 4, Cal.two_whl_recovery_inc_f/r_tbl); //256
        temp_delta_iterm = Max(temp_delta_iterm, temp_avg_recover_whl_ax);
    }
    else if(Tcs_input.whl_ax[left] + Tcs_input.whl_ax[right]) < 2 * Cal.two_slip_whl_recovery_thr_f/r
    {
        temp_delta_iterm = Max(temp_delta_iterm, Cal.one_whl_recovery_inc_f/r); //32
    }
    
    if( Tcs_input.veh_spd < Cal.homo_engine_veh_spd_thr //256
      	&& Tcs_input.engine_speed_[] < Cal.homo_engine_speed_thr //1
      	&& Tcs_input.engine_dot[] < Cal.homo_engine_speed_dot_thr) //1
    {
        temp_delta_iterm = Max(temp_delta_iterm, Cal.home_engine_inc); //32
    }
    if( Tcs_input.veh_ax > Cal.two_slip_accel_thr && temp_delta_iterm < 0)
    {
        temp_delta_iterm = temp_delta_iterm * Cal.two_slip_accel_thr / Tcs_input.veh_ax; //256
    }
    
    if( Tcs_input.bend_detect_estimate > Cal.two_slip_bend_adjust) //1024
    {
        if( temp_delta_iterm <= 0 && temp_pt_pd_term < 0)
        {
            temp_delta_iterm = temp_delta_iterm * Tcs_input.bend_detect_estimate / Cal.two_slip_bend_adjust; //1024
            temp_delta_iterm = Min(temp_delta_iterm, Cal.two_slip_bend_part);  //256
        }
        else
        {
            temp_delta_iterm = temp_delta_iterm * Cal.two_slip_bend_adjust / Tcs_input.bend_detect_estimate; //1024
        }
    }
    else if(Tcs_input.os_us_metric < - Cal.two_slip_us_adjust && axle == 0) //1024
    {
        if( temp_delta_iterm <= 0 && temp_pt_pd_term < 0)
        {
            temp_delta_iterm = temp_delta_iterm * ABS(Tcs_input.os_us_metric) / Cal.two_slip_us_adjust; //1024
            temp_delta_iterm = Min(temp_delta_iterm, Cal.two_slip_us_part);  //256
        }
        else
        {
            temp_delta_iterm = temp_delta_iterm * Cal.two_slip_us_adjust / ABS(Tcs_input.os_us_metric); //1024
        }
    }
    else if(Tcs_input.os_us_metric > Cal.two_slip_os_adjust && axle == 1)
    {
        if( temp_delta_iterm <= 0 && temp_pt_pd_term < 0)
        {
            temp_delta_iterm = temp_delta_iterm * ABS(Tcs_input.os_us_metric) / Cal.two_slip_os_adjust; //1024
            temp_delta_iterm = Min(temp_delta_iterm, Cal.two_slip_os_part);  //256
        }
        else
        {
            temp_delta_iterm = temp_delta_iterm * Cal.two_slip_os_adjust / ABS(Tcs_input.os_us_metric); //1024
        }
    }
  
    if( Tcs_input.veh_ax < Cal.two_slip_ax_min //256
      	&& excessive_two_slip == 1
      	&& Tcs_axle[].tcs_active_timer > Cal.two_slip_highmu_time) //1
    {
        if( temp_delta_iterm < 0)
        {
            temp_delta_iterm = temp_delta_iterm * Cal.two_slip_ax_gain /1024; //1024
        }
    }
    
    if( Tcs_axle[].engine_low_rpm == 1 && temp_delta_iterm < 0)
    {
        temp_delta_iterm = temp_delta_iterm * Tcs_input.engine_speed[axle] / (2 * Cal.stall_clear_rpm); //1
    }
    
    if( Tcs_input.axle_shudd_detect[] == 1
      	&& Tcs_axle[].engine_low_rpm == 0)
    {
        if( temp_delta_iterm < 0)
        {
            temp_delta_iterm = temp_delta_iterm * Cal.shudder_homo_i_red_gain_f/r /1024; //1024
            temp_delta_iterm = Max(temp_delta_iterm, Cal.shudder_homo_i_term_delta_cap_f/r); //256
        }
        else
        {
            temp_delta_iterm = temp_delta_iterm * Cal.shudder_homo_i_inc_gian_f/r /1024; //1024
        }
    }
    
    Tcs_axle[].pt_delta_integral_term = Limit(temp_delta_iterm, -Cal.axl_int_delta_min_f/r, Cal.axl_int_delta_max_f/r); //256 256
}
```

