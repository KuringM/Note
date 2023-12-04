## TransToRecovApp
```C
wheel_speed = Abs_input.WabsFiltNormalWhl[SLC];
wheel_accel = Abs_input.WabsFiltWhlAx[SLC];
wheel_jerk = Abs_input.filt_wheel_jerk[SLC])

if (GetDrivetrainVibFlag(whl) == 1){
  // load temp variable with trim for 'in-gear' situation
  ABS_whl[].athr_aclfb_s16 = Cal.af_base_toscl_wacl_let_aply; //32
}
else{
  ABS_whl[].athr_aclfb_s16 = LookUp(ABS_whl[].whl_slip_pct,2,Cal.af_base_wacl_let_aply_tbl[]); //32
  if (
    Abs_input.drvtrn_low_range == 1
  ||ABS_in_whl[].bump_scale > Cal.af_rough_trig_primary //1024
  ||ABS_in_whl[].vibration_scale > Cal.af_rough_trig_primary
  )
  {
    offroad_conditions = 1;
  }
  if(
    wheel_accel > ABS_whl[].athr_aclfb_s16
    &&(
      ABS_whl[].split_adjusted_veh_decel < cal.af_vacl_let_aply //256
      ||offroad_conditions = 1
    )
    &&Abs_input.Awd_Cntrl_Active == 0
    &&ABS_whl[].apply_deltap_torq_cmnd == 0
    &&(
        wheel_jeck > Cal.af_jrk_act_thr //1
      ||wheel_speed > Abs_input.VabsWhlReferSpd[]
    )
    &&(
      ABS_whl[].accumulate_slip < Cal.af_slipint_let_aply //1
      ||(
        Abs_input.uf_az_unsprung_mass_validp[] == 1
        &&Abs_input.rough_road_value_prcnt_s17[] > Cal.af_force_on_icc_prcnt_rough //1024
      )
      ||offroad_conditions == 1
    )
  ){
    result = 1;
  }
  else{
    result = 0;
  }
}
```