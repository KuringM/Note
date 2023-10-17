## Calc Powertrain Tcs Derivative Term

```c
whl_vel_err_avg = (Tcs_whl[left].delta_spd_error + Tcs_whl[rihgt].delta_spd_error) /2;
whl_vel_ax_avg = (Tcs_input.whl_ax[left]+Tcs_input.whl_ax[right]) /2;
whl_vel_range = (Tcs_whl[left].velocity_range + Tcs_whl[right].velocity_range) /2;

// Calibrate PTC D_ref
if(whl_vel_err_avg < 0
 &&whl_vel_range)
{
    if(Tcs_input.gear_position == GEAR_1)
    {
        d_ref = - whl_vel_err_avg * Cal.axl_d_ref_inc[axle] / whl_vel_range; //256
    }
    else
    {
        d_ref = - whl_vel_err_avg * Cal.axl_d_ref_inc_hi_gear[axle] / whl_vel_range; //256
    }
}
else{ d_ref = 0;}
d_ref = d_ref + Max(Tcs_input.veh_ax, 0);
d_term = 0;

// Calibrate PTC D gain
temp_gain = Cal.pt_der_gain_f/r[GEAR]; //1
temp_gain = temp_gain * Tcs_axle[].pt_torq_mod_gain /1024;
temp_gain = temp_gain * Tcs_axle[].pt_first_cycle_gain /256;

// Calculate PTC D term
if(TCS_axle[].split_mu_conf < 0.99 *1024
 &&Tcs_axle[].fast_split_mu_detected == 0
 &&Tcs_input.wheel_sensor_valid[left/right] == 0
 &&Tcs_input.veh_spd < Cal.axl_d_max_vel) //256
{
    d_term = whl_vel_ax_avg - d_ref * 32/256;
    d_term = d_term * temp_gain / 256*1;
    
    if(Tcs_input.RC_Active_At_Wheel[left] == 1
     ||Tcs_input.RC_Active_At_Wheel[left] == 1)
    {
        d_term = d_term * Cal.axl_d_ramp_check[] / 256; //256
    }
}

Tcs_axle[].pt_derivative_term = Limit(d_term, Cal.axl_d_lim_min[], Cal.axl_d_lim_min[]); //1 1
```

