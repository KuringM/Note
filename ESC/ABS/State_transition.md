## CASE in ACTION_PULSED_RELEASE

```c
if (ABS_veh.moving == 0) { ABS_whl[].control_state[0] = ACTION_EOS_APPLY;}
#if (ABS_CPC_CONTROL == on)
else if 
  ( cpc_action == 1
    && ( ABS_whl[].number_of_cycle > 1
      || ABS_whl[].sc_dump_pulse_state_u8 == DUMP_PULSE_FINISHED
      || ABS_veh.brake_performance_test_detected == 1
    )
  )
{
  ABS_whl[].control_state[0] = ACTION_CPC_CONTROL;
}
#endif
else
{
  if(ABS_whl[].slip_phase != SLIP_UNDER_THR) { ABS_whl[].control_state[0] = ACTION_WHEEL_ACCELERATING; }
  else {
    if ( TransToRecovapp() == 1) { ABS_whl[].control_state[0] = ACTION_RECOV_APPLY; }
    else { 
      if(ABS_whl[].sc_dump_pulse_state_u8 == DUMP_PULSE_FINISHED) {ABS_whl[].control_state[0] = ACTION_FULL_RELEASE;}
    }
  }
}
```

## CASE in ACTION_RECOV_APPLY

```c
// whl = WHL INDEX SLCT LOW HIGH DECEL in rear wheels
// Abs_input.WabsFiltWhlAx[whl]
// Abs_input.filt_wheel_jeck[whl]
// Abs_input.WabsFiltNormalWhlSpd[whl]
if(
    Abs_input.WabsFiltWhlAx[whl] < 0
  &&ABS_whl[].slip_phase == SLIP_UNDER_THR
  )
{
  ABS_whl[].control_state[0] = ACTION_PULSED_RELEASE;
}
else
{
  if (ABS_whl[].slip_phase == SLIP_OVER_THR) { ABS_whl[].control_state[0] = ACTION_FULL_APPLY; }
  else{
    if ( 
      Abs_input.WabsFiltWhlAx[whl] <= ABS_whl[].athr_aclfb_s16
      || (  Abs_input.filt_wheel_jeck[whl] <= Cal.af_jrk_act_thr //1
          &&Abs_input.WabsFiltNormalWhlSpd[whl]< Abs_input.VabsWhlReferSpd[]
        )
      || ( ABS_in_whl[].wheel_torque >= ABS_whl[].recover_app_target_torq; )
    )
    {
      if( ABS_whl[].split_adjusted_veh_decel < Cal.srg_vacl_let_hidecel_ctrl ) //256
      ||( Abs_input.WabsFiltWhlAx[whl] > Cal.af_wacl_trig_primary) //32
      ||( ABS_in_whl[].bump_scale > Cal.af_rough_trig_primary) //1024
      ||( ABS_in_whl[].vibration > Cal.af_rough_trig_primary)
      {
        ABS_whl[].control_state[0] = ACTION_FULL_APPLY;
        ABS_whl[].recovered = 1;
        ABS_whl[].slip_phase = SLIP_ABOVE_THR;
        ASB_whl[].aclfb_stab_kommend = 1;
        ABS_whl[].torq_change_recovered = 1;
      }
      else { ABS_whl[].control_state[0] = ACTION_WHEEL_ACCELERATING;}
    }
    else { if ABS_veh.moving == 0 { ABS_whl[].control_state[0] = ACTION_EOS_APPLY;}}
  }
}
```

## CASE in Action_Splt_Release

```c
if (ABS_veh.moving == 0)
{
  ABS_whl[].control_state[0] = ACTION_EOS_APPLY
}
else{
  // Calculate Split Release hold time
  if (ABS_VSC_INERFACE == 0 || ABS_veh.scv_enable == 0)
  {
    temp_hold_tm_trig_aply = ABS_whl[oppo].accumulate_slip - ABS_whl[].accumulate_slip;
    temp_hold_tm_trig_aply = LookUp(temp_hold_tm_trig_aply,3, cal.yc_tm_trig_aply_tbl) //1
  }
  else
  {
    temp_hold_tm_trig_aply = 0
  }

  // Manage transitions from the Dump Copy state
  if (ABS_whl.t_yc_dump_copy_intrrpt_tim_s16 > 0 || surface_condition == SURFACE_HOMOGENEOUS)
  else if (
       ABS_whl.t_yc_dump_copy_intrrpt_tim_s16 >= temp_hold_tm_trig_aply 
    || oppwhl.slip_phase == SLIP_PHASE_TRANS
    || VabsFiltVehSpd <= Cal.splt_copyrel_vs_thr)  //256/3.6
  {
    control_state = ACTION_SPLT_APPLY
  }
}
```
