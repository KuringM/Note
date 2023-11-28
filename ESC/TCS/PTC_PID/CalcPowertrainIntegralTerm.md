## `CalcPowertrainTcsIntegralTerm()`

```c
Tcs_CalcDeltaIntegralTermStateStable();
Tcs_CalcDeltaIntegralTermStateHomo();
Tcs_CalcDeltaIntegralTermStateSplit();

Tcs_axle[].himu_slip_reduce_torque = 0;

if( Tcs_axle[].split_slip_on_old == 0 && Tcs_axle[].split_slip_on_high ==1)
{
  temp_himu_reduce_gain = Cal.axle_int_high_mu_red_f/r 
                        * Limit(Tcs_axle[].pt_proportional_term, Cal.axle_in_high_p_min[], Cal.axle_in_high_p_max) 
                        / Cal.axle_in_high_p_min[]; //1024 1 1
  Tcs_axle[].himu_slip_reduce_torque = Tcs_axle[].pt_torque_requst * temp_himu_reduce_gain /1024;
  Tcs_axle[].himu_slip_reduce_torque = Max(Tcs_axle[].himu_slip_reduce_torque , Cal.axle_int_high_mu_min[]); //1

  if( Tcs_input.veh_ax > Cal.axle_int_high_mu_ax_thr) //256
  {
    Tcs_axle[].himu_slip_reduce_torque = Tcs_axle[].himu_slip_reduce_torque /2;
  }

  if( Cal.allow_int_reset_hi_mu_slip[] == 1) //bool
  {
    temp_torque_delta = Tcs_axle[].pt_torque_requst - Tcs_input.axle_driving_torq[];
    if( temp_torque_delta > 0)
    {
      Tcs_axle[].himu_slip_reduce_torque = Tcs_axle[].himu_slip_reduce_torque + temp_torque_delta;
    }
  }
}

if( Tcs_input_process.ycs_intervent_torque_ratio[axle] != 0)
{
  temp_delta_iterm_ysc_intervent = Tcs_input_process.ycs_intervent_torque_ratio[axle] * Cal.axle_initial_ysc[] /1024; //256

  if( Tcs_input_process.ycs_intervent_torque_ratio[axle] < 0)
  {
    if(Tcs_input.engine_speed[] > 1000)
    {
      Tcs_axle[].pt_delta_integral_term = Min(temp_delta_iterm_ysc_intervent, Tcs_axle[].pt_delta_integral_term);
      Tcs_axle[].pt_delta_integral_term = Min(Tcs_axle[].pt_delta_integral_term, -256)
    }
    else{
      Tcs_axle[].pt_delta_integral_term = Min(Tcs_axle[].pt_delta_integral_term, 0);
    }
  }
    /*
    FWD
    AWD
    NEUTRAL
    HIGH_RANGE_4x4
    LOW_RANGE_4x4
    AWD
    AWD_RANGE
    */
  else if( Tcs_axle[].pt_prop_error < Cal.two_whl_spd_error_recovery_thr[]) //256
        && ( Tcs_input.drivetrain != AWD
          || axle == front && Tcs_input.os_us_metric > -Cal.os_us_adjust_us_thr  //1024
          || axle == rear && Tcs_input.os_us_metric < Cal.os_us_adjust_os_thr) //1024
  {
    Tcs_axle[].pt_delta_integral_term = Max(temp_delta_iterm_ysc_intervent, Tcs_axle[].pt_delta_integral_term);
    Tcs_axle[].pt_delta_integral_term = Max(Tcs_axle[].pt_delta_integral_term, 256)
  }
}

Tcs_axle[].pt_integral_term = Tcs_axle[].pt_integral_term
                            + Tcs_axle[].pt_delta_integral_term 
                            - Tcs_axle[].hilo_reduce_torque * 256
                            - Tcs_axle[].himu_slip_reduce_torque * 256;

temp_pt_int_term = Max(Cal.min_int_term_bend_thr, Tcs_input.bend_detect_estimate); //1024
temp_pt_int_term = Cal.min_int_term_bend_thr * 1024 / temp_pt_int_term;
temp_pt_int_term = temp_pt_int_term * Cal.min_pt_int_term /1024; //1

Tcs_axle[].pt_integral_term = limit(Tcs_axle[].pt_integral_term, temp_pt_int_term * 256, Tcs_input.driver_req_axle_torq[] *256);
```