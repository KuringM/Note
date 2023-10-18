## `CalcPowertrainTcsIntegralTerm()`

```c
Tcs_CalcDeltaIntegralTermStateStable();
Tcs_CalcDeltaIntegralTermStateHomo();
Tcs_CalcDeltaIntegralTermStateSplit();

Tcs_axle[].himu_slip_reduce_torque = 0;

if( Tcs_axle[].split_slip_on_old == 0 && Tcs_axle[].split_slip_on_high ==1)
{
    temp_himu_reduce_gain = Cal.axle_int_high_mu_red_f/r * Limit(Tcs_axle[].pt_proportional_term, Cal.axle_in_high_p_min[], Cal.axle_in_high_p_max) / Cal.axle_in_high_p_min[]; //1024 1 1
    Tcs_axle[].himu_slip_reduce_torque = Tcs_axle[].pt_torque_requst * temp_himu_reduce_gain /1024;
    Tcs_axle[].himu_slip_reduce_torque = Max(Tcs_axle[].himu_slip_reduce_torque , Cal.axle_int_high_mu_min[]); //1

    if( Tcs_input.veh_ax > Cal.axle_int_high_mu_ax_thr)
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
}



```