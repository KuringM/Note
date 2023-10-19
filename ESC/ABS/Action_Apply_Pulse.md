## Initial calculate ''desired cycle time'' for Front  & Rear Axle

```c
// For a front wheel or select_low == 0, take "wheel" as index to select the proper value
// For a reas wheel in select low. choose the highest of either rear wheel control desensitization index
tmp_rough = MAX((ABS_in_whl[wheel].vibration_scale - Cal.desire_cyc_tm_rough_hyst_f/r),0); //1024/100
tmp_stable_interval = Lookup(Abs_input.filt_ax_general,3,Cal.desire_cycle_tm_f/r);//1
//右移n位相当于除以 2 的 n 次方
tmp_stable_interval = tmp_stable_interval - ((tmp_rough * Cal.desired_cyc_tm_rough_gain_f/r) >> 12); //1024/100

ABS_whl[].desired_cycle_tim = MAX(tmp_stable_interval, Cal.appp_cycle_tim_min_f/r); //1
```

## Offset ''desired cycle time'' in "Homogeneous Surface"

```c
// In homogeneous surface, currently wheel and opposite side wheel are in same number of cycle and control state of ACTION_FULSE_APPLY, offset desired cycle time
ABS_whl[].desired_cycle_tim += Cal.desired_cycle_tim_extension //1
```

## Calibrate apply rate

```c
// HiMu, MidMu, LowMu
tmp_min_pulse_app_rate = Cal.appp_min_torq_rate_hi_mu_f/r
  				     or Cal.appp_min_torq_rate_mid_mu_f/r
  				     or Cal.appp_min_torq_rate_low_mu_f/r;// 16

tmp_min_pulse_app_rate = MAX(tmp_min_pulse_app_rate, Cal.min_app_torque_rate_f/r); //16
```

## Limit ''desired cycle time''

```c
tmp_pulse_app_torq = MAX(ABS_whl[].wheel_lock_torque_0 - ABS_in_whl[].wheel_torque, 0);
tmp_min_rate_cycle_time = tmp_pulse_app_torq * 16 / tmp_min_pulse_app_rate / 1;

// limit desired cycle time
ABS_whl[].limited_desired_cycle_tim = Min(tmp_min_rate_cycle_time, ABS_whl[].desired_cycle_tim)
```

## Update Apply rate & timeout recording to Limit desired cycle time

```c
ABS_whl[].pulse_app_rate = tmp_pulse_app_torq * 16/ ABS_whl[].limited_desired_cycle_tim /1;
ABS_whl[].app_timeout_target = ABS_whl[].limited_desired_cycle_tim
```

## Calculate Apply timeout

```c
tmp_over_cycle_time_offset = Cal.over_cycle_time_limit_f/r; //1
if ABS_whl[].split_adjusted_veh_decel > Cal.veh.ax_select_more_appp_time //256
{
   tmp_over_cycle_time_offset = Cal.over_cycle_time_limit_r_requested_more; //1
}

ABS_whl[].app_timeout_target = ABS_whl[].limited_desired_cycle_tim + tmp_over_cycle_time_offset;
```

