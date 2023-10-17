## `CalcPowertraionTcsControlVars()`

>  Calculate `Tcs_axle[].pt_prop_error`

```C
/*==========================================================
This process determines powertrain TC PID control variables.
===========================================================*/
Tcs_whl[].delta_spd_error = Max(Tcs_input.norm_whl_spd[], Tcs_input.whl_ref_spd[]) - Tcs_whl[].engine_target_spd;
whl_vel_err_avg = (Tcs_whl[left].delta_spd_error + Tcs_whl[right].delta_spd_error)/2;
whl_vel_err_high = Max(Tcs_whl[left].delta_spd_error, Tcs_whl[right].delta_spd_error);
Tcs_axle[].pt_prop_error = (whl_vel_err_avg * Tcs_veh.slip_avg_bias + whl_vel_err_high * (1024 - Tcs_veh.slip_avg_bias))/1024;
```