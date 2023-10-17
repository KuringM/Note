## `CalcDeltaIntegralTermStateSplit`

```c
if( Tcs_axle[].slip_state == STATE_SPLIT)
{
    if( Tcs_input.engine_speed[] > Cal.split_high_dec_min_rpm_f/r //1
      	&&( Tcs_whl[left].delta_spd_error > Cal.split_high_dec_slip_thr_f/r //256
          	||Tcs_whl[right].delta_spd_error > Cal.split_high_dec_slip_thr_f/r 
          	||Tcs_axle[].in_slip_engine_control == 1))
    {
        temp_delta_iterm = - Cal.split_high_dec_dec_f/r * Tcs_axle[].wheels_in_slip_cnt; //256
        
        if(axle == Front_axle)
        {
            if( Tcs_pin[0].proportional_term > 0)
            {
                if( Tcs_input.whl_ax[right] < Cal.split_fast_recov_whl_ax_thr_f) //32
                {
                    temp_delta_iterm = Lookup(Tcs_input.whl_ax[right], 4, Cal.split_recov_low_inc_f_tbl); //32
                }
                else if( Tcs_input.whl_ax[right] < Cal.split_low_recov_whl_ax_thr_f) //32
                {
                    temp_delta_iterm = 0;
                }
            }
            else
            {
                if( Tcs_input.whl_ax[left] < Cal.split_fast_recov_whl_ax_thr_f) //32
                {
                    temp_delta_iterm = Lookup(Tcs_input.whl_ax[left], 4, Cal.split_recov_low_inc_f_tbl); //32
                }
                else if( Tcs_input.whl_ax[left] < Cal.split_low_recov_whl_ax_thr_f) //32
                {
                    temp_delta_iterm = 0;
                }
            }
        }
        else //axle == rear_axle
        {
            if( Tcs_pin[1].proportional_term > 0)
            {
                if( Tcs_input.whl_ax[right] < Cal.split_fast_recov_whl_ax_thr_r) //32
                {
                    temp_delta_iterm = Lookup(Tcs_input.whl_ax[right], 4, Cal.split_recov_low_inc_r_tbl); //32
                }
                else if( Tcs_input.whl_ax[right] < Cal.split_low_recov_whl_ax_thr_r) //32
                {
                    temp_delta_iterm = 0;
                }
            }
            else
            {
                if( Tcs_input.whl_ax[left] < Cal.split_fast_recov_whl_ax_thr_r) //32
                {
                    temp_delta_iterm = Lookup(Tcs_input.whl_ax[left], 4, Cal.split_recov_low_inc_r_tbl); //32
                }
                else if( Tcs_input.whl_ax[left] < Cal.split_low_recov_whl_ax_thr_r) //32
                {
                    temp_delta_iterm = 0;
                }
            }
        }
    }
    else if(Tcs_input.engine_speed[] > Cal.split_no_dec_low_rpm_f/r //1
           	&&(Tcs_whl[left].delta_spd_error > Cal.split_no_dec_slip_thr_f/r //256
               ||Tcs_whl[right].delta_spd_error > Cal.split_no_dec_slip_thr_f/r))
    {
        if(Tcs_whl[0].delta_spd_error > Cal.split_low_dec_slip_thr_f/r //256
           ||Tcs_whl[1].delta_spd_error > Cal.split_low_dec_slip_thr_f/r)
        {
            temp_delta_iterm = -Cal.split_low_dec_dec_f/r * Tcs_axle[].wheel_in_slip_cnt; //256
        }
        else
        {
            temp_delta_iterm = 0;
        }
        
        if(Tcs_input.gas_pedal_position > Cal.split_low_dec_ovrrev_min_gas //1024
        && Tcs_input.engine_speed[] > Cal.split_low_dec_ovrrev_min_rpm_f/r //1
        && Tcs_input.engine_speed_dot[] > Cal.split_low_dec_ovrrev_min_del_rpm_f/r //1
        && Tcs_input.veh_spd < Cal.split_low_dec_ovrrev_max_spd) //256
        {
            temp_delta_iterm = -Cal.split_low_dec_ovrrev_dec_f/r; //256
        }
        
        if(axle == Front_axle)
        {
            if( Tcs_pin[0].proportional_term > 0)
            {
                if( Tcs_input.whl_ax[right] < Cal.split_fast_recov_whl_ax_thr_f) //32
                {
                    temp_delta_iterm = Lookup(Tcs_input.whl_ax[right], 4, Cal.split_recov_high_inc_f_tbl); //32
                }
                else if( Tcs_input.whl_ax[right] < 0)
                {
                    temp_delta_iterm = Cal.split_recov_slow_inc_f; //256
                }
            }
            else
            {
                if( Tcs_input.whl_ax[left] < Cal.split_fast_recov_whl_ax_thr_f) //32
                {
                    temp_delta_iterm = Lookup(Tcs_input.whl_ax[left], 4, Cal.split_recov_high_inc_f_tbl); //32
                }
                else if( Tcs_input.whl_ax[left] < 0) 
                {
                    temp_delta_iterm = Cal.split_recov_slow_inc_f; //256
                }
            }
        }
        else //axle == rear_axle
        {
            if( Tcs_pin[1].proportional_term > 0)
            {
                if( Tcs_input.whl_ax[right] < Cal.split_fast_recov_whl_ax_thr_r) //32
                {
                    temp_delta_iterm = Lookup(Tcs_input.whl_ax[right], 4, Cal.split_recov_high_inc_r_tbl); //32
                }
                else if( Tcs_input.whl_ax[right] < 0) //32
                {
                    temp_delta_iterm = Cal.split_recov_slow_inc_r; //256
                }
            }
            else
            {
                if( Tcs_input.whl_ax[left] < Cal.split_fast_recov_whl_ax_thr_r) //32
                {
                    temp_delta_iterm = Lookup(Tcs_input.whl_ax[left], 4, Cal.split_recov_high_inc_r_tbl); //32
                }
                else if( Tcs_input.whl_ax[left] < 0) //32
                {
                    temp_delta_iterm = Cal.split_recov_slow_inc_r; //256
                }
            }
        }
    }
    else 
    {
        temp_delta_iterm = Cal.split_normal_inc_f/r * Tcs_axle[].split_mu_conf /1024; //1024
        if(Tcs_input.engine_speed[] < Cal.split_no_dec_low_rpm[]
        && Tcs_input.engine_speed_dot[] < Cal.split_speedup_inc_max_del_rpm_f/r) //1
        {
            temp_delta_iterm = temp_delta_iterm * Cal.split_speedup_inc_mult_f/r / 1024; //1024
        }
    }
    
    if(Tcs_axle[].fast_split_mu_detected == 1 && temp_delta_iterm < 0)
    {
        temp_delta_iterm = temp_delta_iterm * Cal.fast_split_gain_f/r /1024; //1024
    }
    if(Tcs_axle[].split_slip_on_high == 1)
    {
        temp_delta_iterm = -Cal.split_himu_slip_dec_f/r; //256
    }
    
    Tcs_axle[].pt_delta_integral_term = temp_delta_iterm
}
```

