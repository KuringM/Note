## Calculate `Tcs_axle[].pt_torque_request`

```c
/*============================================================
This process calculates normal powertrain TC torque request.
============================================================*/

if(Tcs_axle[].homogenous_once == 1
 ||Tcs_axle[].homogenous == 1
 ||Tcs_axle[].split_mu_conf < Cal.split_mu_upper_lim) //1024
{ 
    brake_torque_compensation = 0;
}
else
{
    brake_torque_compensation = ABS(Tcs_pin[].pid_term);
}

Tcs_axle[].brake_torque_compensation = FirstOrderFilter(Tcs_axle[].brake_torque_compensation, brake_torque_compensation, Cal.split_brake_filter_gain); //128
/*
FirstOrderFilter do it.
Tcs_axle[].brake_torque_compensation = (brake_torque_compensation - Tcs_axle[].brake_torque_compensation) * 										Cal.split_brake_filter_gain /128 + Tcs_axle[].brake_torque_compensation;
*/
Tcs_axle[].brake_torque_comp_to_pt = Tcs_axle[].brake_torque_compensation * Cal.split_brake_torque_gain[]; //1024
Tcs_axle[].brake_torque_comp_to_pt = Limit(Tcs_axle[].brake_torque_comp_to_pt, 0, Cal.max_pt_brktorq_comp[]); //1

//Calculate PT torque request
Tcs_axle[].pt_torque_request = Tcs_axle[].pt_integral_term /8 
    						- Tcs_axle[].pt_proportional_term
    						- Tcs_axle[].pt_derivation_term
    						+ Tcs_axle[].brake_torque_comp_to_pt;

temp_min_pt_torq = Max(Tcs_axle[].pt_torque_limit, Tcs_input.axle_driving_torq_min[]);
Tcs_axle[].pt_torque_request = Limit(Tcs_axle[].pt_torque_request, temp_min_pt_torq, Tcs_input.driver_req_axle_torq[]);
```

## Calculate `Tcs_axle[].pt_prop_error`

```C
/*==========================================================
This process determines powertrain TC PID control variables.
===========================================================*/
Tcs_whl[].delta_spd_error = Max(Tcs_input.norm_whl_spd[], Tcs_input.whl_ref_spd[]) - Tcs_whl[].engine_target_spd;
whl_vel_err_avg = (Tcs_whl[left].delta_spd_error + Tcs_whl[right].delta_spd_error)/2;
whl_vel_err_high = Max(Tcs_whl[left].delta_spd_error, Tcs_whl[right].delta_spd_error);
Tcs_axle[].pt_prop_error = (whl_vel_err_avg * Tcs_veh.slip_avg_bias + whl_vel_err_high * (1024 - Tcs_veh.slip_avg_bias))/1024;
```