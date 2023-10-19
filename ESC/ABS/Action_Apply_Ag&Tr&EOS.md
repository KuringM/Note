## Calibrat Aggressive apply

```c
ABS_whl[].pulse_app_rate = Cal.appa_rate_f/r; //16
ABS_whl[].app_timeout_target = Cal.appa_timeout_target_f/r; //1
```

## Calibrate Transition Apply
```c
// Action of the opposite side wheel is in Transition action or Aggressive action , or opposite side wheel not in ABS cycle
ABS_whl[].pulse_app_rate = Cal.appt_rate_f/r; //16
// Action of the opposite side wheel is neither in Transition action not Aggressive action , and opposite side wheel in ABS cycle
ABS_whl[].pulse_app_rate = Cal.appt_rate_single_f; //16
ABS_whl[].app_timeout_target = Cal.appt_timeout_target_f/r; //1
```

### Rough road

```c
if( ABS_whl[].rough_false_activation_event == 1)
{
    ABS_whl[].pulse_app_rate = Cal.appt_rate_sd_f/r; //16
}
```

## Calibrate EOS apply

```c
ABS_whl[].pulse_app_rate = Cal.appe_rate_f/r; //16
ABS_whl[].app_timeout_target = Cal.appe_timeout_target_f/r; //1

// Apply rate adjust
temp_eos_aply_rate_gain = Lookup(ABS_whl[].split_adjusted_veh_decel,3,Cal.eos_app_rate_adj_gain);//128
// In homogeneous surface
ABS_whl[].pulse_app_rate = ABS_whl[].pulse_app_rate * temp_eos_aply_rate_gain /128;

temp_eos_aply_rate_gain = Limit(ABS_whl[].pulse_app_rate,2 *16, 30 *16);
```

## Calibrate the shutdown speed of EOS 

```c
temp_shutdown_speed = Lookup(Abs_input.filt_ax_general,3,Cal.eos_app_thr); //256/3.6
```
