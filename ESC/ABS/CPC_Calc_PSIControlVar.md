## Calc `ABS_veh.PSI_ControlVar_S16`

```c
ABS_veh.PSI_ControlVar_S16
  = ABS_in_veh.yaw_rate_filt_s16 * temp_gain_kp_s16  / (128 * 128)  //128
  + temp_s_PSI_int_s16 * temp_gain_ki_s16 /128 //128
  + ABS_in_veh.yaw_rate_deriv_s16 * Cal.yc_cv_gain_kd /(64 *128); // 128
```

### Calibration temp_s_PSI_int_s16
```c
if ( Abs_input.VabsFiltVehSpd > Cal.yc_cv_min_spd && ABS_veh.scv_enable == 1) //256*3.6
{
	lateral_accel = Abs_input.VehAy;
	departure pressure = ABS_veh.front_axle_departure_press_diff;
	temp_yc_cv_deadband_ki_s16 = Cal_abs.yc_cv_dbnd_ki; // <1> *128

	if(surface_state = SURFACE SPLIT_LEFT_HIGH_CONFIRMED)
  {
		temp_s_PSI_int_s16 = ABS_veh.PSI_int_s16 - Cal_abs.yc_cv_offset_ki; // <0> *128
  }
	else
	{
		temp_s_PSI_int_s16 = ABS_veh.PSI_int_s16 + Cal_abs.ye_cv_offset_ki;
	}
    
  if (temp_s_PSI_int_s16 > 0) I
  {
    temp_s_PSI_int_s16 = MAX((temp_s_PSI_int_s16 - temp_yc_cv_deadband_ki_s16),0);
    temp_s_PSI_int_s16 = MIN (temp_s_PSI_int_s16, cal.yc_cv_ki_input_lim) ; //<3> *128
  }
	else
  {
    temp_s_PSI_int_s16 = MAX((temp_s_PSI_int_s16 + temp_yc_cv_deadband_ki_s16),0)
    temp_s_PSI_int_s16 = MIN (temp_s_PSI_int_s16, -cal.yc_cv_ki_input_lim);
	}
}
```

### Calibration `temp_gain_kp_s16` & `temp_gain_ki_s16`
```c
// Todo
temp_gain_kp_s16 = Cal.yc_cv_gain_kp;
temp_gain_ki_s16 = 0; //128

//
temp_gain_kp_s16 = Cal.yc_cv_gain_kp_curve;
temp_gain_ki_s16 = Cal.yc_cv_gain_ki_curve;

//
temp_gain_kp_s16 = Cal.yc_cv_gain_kp;
temp_gain_ki_s16 = Cal.yc_cv_gain_ki;
```