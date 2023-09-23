- Apply Rate
- Apply Target torque
- Apply timeout

##  Calibrate Apply  rate &  torque percent

```c
// limit full apply rate
tmp_max_gradient = Cal.max_app_torque_rate_f/r; //16
tmp_min_gradient = Cal.min_app_torque_rate_f/r; //16

// HiMu, MidMu, LowMu
tmp_full_app_torq_inc_pct = Cal.appf_torq_inc_pct_hi_mu_f/r
  					     or Cal.appf_torq_inc_pct_mid_mu_f/r
  					     or Cal.appf_torq_inc_pct_low_mu_f/r; //1024

tmp_app_gradient = Cal.appf_gradient_hi_mu_f/r_1sf
  			    or Cal.appf_gradient_hi_mu_f/r
  			    or Cal.appf_gradient_hi_mu_f/r_1sf // MidMu first cycle use HiMu's Caliburairion
  			    or Cal.appf_gradient_mid_mu_f/r
  			    or Cal.appf_gradient_low_mu_f/r_1sf
  			    or Cal.appf_gradient_low_mu_f/r; //16

ABS_whl[].app_timeout_target = Cal.appf_timeout_target_f/r; // 1
```

### Adjusted Rear Axle apply torque rate In Failure

```c
// rear wheel 
if(ABS_in_whl[].ftd_status == ABS_RWAL_ONLY)
{
	tmp_full_app_torq_inc_pct = Cal.appf_rwal_torq_inc_pct_min //1024
}
else if(ABS_veh.circuit_failure_status == CIRCUIT_FRONT_FAILURE
	  ||ABS_veh.circuit_failure_status == CIRCUIT_REAR_FAILURE)
{
	tmp_full_app_torq_inc_pct = Cal.appf_cf_torq_inc_pct_min; //1024
	ABS_whl[].desired_cycle_tim = Cal.appp_cf_torq_inc_stable_tm; //1
}
```

## Calculate Apply rate & Target torque

```c
tmp_torq_band_aclfb = ABS_whl[].wheel_lock_torque_0 - ABS_in_whl[].wheel_torque;

if ABS_whl[].aclfb_stab_kommend == 1
{
    tmp_app_torque_delta = tmp_torq_band_aclfb * tmp_full_app_torq_inc_pct
}
else
{
    tmp_app_torque_delta = ABS_whl[].wheel_torque_band * tmp_full_app_torq_inc_pct
}

ABS_whl[].pulse_app_rate = LIMIT(tmp_app_gradient,tmp_min_gradient,tmp_max_gradient);

ABS_whl[].full_app_target_torq =  MAX((ABS_in_whl[].wheel_torque + tmp_app_torque_delta),0);
```

