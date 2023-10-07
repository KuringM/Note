## Calculate Torque lost sum

```c
// dominant wheel is the one with large whl ax (Tcs_input.whl_ax[]);
delta_wheel_ax = max_wheel_ax - min_whl_ax;
wheel_ax_sum = max_whl_ax + min_whl_ax;

// Calculate weight ratio in low slip 
if(delta_wheel_ax > Cal.delta_wheel_ax_min && wheel_ax_sum != 0 )
{
    // In other cases: weight_ratio_low_slip = 0.5
    weight_ratio_low_slip = delta_wheel_ax * Cal.weight_ratio_avg / wheel_ax_sum; //1024
}
wheel_ax_avg = weight_ratio_low_slip * min_wheel_ax + (1 - weight_ratio_low_slip) * max_wheel_ax;

torque_lost = wheel_ax_avg * Cal.torque_lost_gain_f/r_[gear]; //1

if (Cal.allow_pt_torq_mod_by_spd == 1) //
{
	torque_lost_spd_gain = Lookup(Tcs_input.veh_spd, 5, Cal.torque_lost_factor_tbl) //1024
}

torque_lost = torque_lost * torque_lost_spd_gain;
if (ATS_mode == 1)
{
    torque_lost_ats_factor = Cal.torque_lost_factor_ats; //1024
}
torque_lost = torque_lost * torque_lost_ats_factor;
```

## CalcInitialTorqueRequest

```c
/*==========================================================
This process calculates the powertrain torque request
immeditely upon TCS entrance or if a surface transision
occurs, as determined by wheel delta velocity.
==========================================================*/
torque_lost_sum = torque_lost;
// In avh or hhc case
if( TCS_input_process.ah_or_hh_delay > 0
  &&TCS_input.axle_driving_torq[] > Cal.init_hh_axle_torque_thr[] //1
  &&TCS_input.veh_ax < Cal.init_hh_veh_ax_thr //256
  &&(TCS_input.whl_ax[left] > Cal.init_hh_whl_ax_thr[axle] //256
   ||TCS_input.whl_ax[right] > Cal.init_hh_whl_ax_thr[axle]))
{
    torque_lost_brake = TCS_input.axle_driving_torq[] * Cal.init_hh_brk_torque_gain[axle]; //1024
}

torque_lost_sum += torque_lost_brake;

if(Tcs_input.bend_detect_estimate > Cal.torq_loss_low_mu_bend_thr //1024
 &&ABS(Tcs_input.veh_ay) < Cal.torq_loss_ay_thr) //256
{
    torque_lost_lowmu_bend_adjust = Cal.initial_turning_adjust[axle]; //1024
}

torque_lost_sum *= torque_lost_lowmu_bend_adjust;
temp_min_lost_torque = torque_lost_lowmu_bend_adjust * Cal.torque_lost_min_f/r; //1
torque_lost_sum = Limit(torque_lost_sum, temp_min_lost_torque, Cal.torque_lost_max_f/r); //1
temp_min_torque = Max(Tcs_input.axle_drivering_torq_min_f/r, Cal.min_init_torq_req_f/r); //1
Tcs_axle[].pt_torque_request = Max(Tcs_input.axle_driving_torq_[]-torque_lost_sum, temp_min_torque);
Tcs_axle[].pt_integral_term = Tcs_axle.pt_torque_request * 256;
```

