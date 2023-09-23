## Calibrate Front Axle Pluse Base Release

### Calibrate "dump size" in First Cycle && High mu Whl on Split

```c
ABS_whl[].sc_dump_pulse_deltap_s16 = Cal.dup_splt_hs_psize_f //16
```

### Calibrate "dump size" in First Cycle && quick apply

```c
ABS_whl[].sc_dump_pulse_deltap_s16 = Cal.dup_frst_cycl_psize_f //16
```

### Calibrate "dump percent" in Other Cycle

```c
dump_pulse_percent = Lookup(ABS_whl[].split_adjusted_veh_decel,4,Cal.dup_vacl_to_base_percent_tbl_f); //1024
temp_dump_pulse_deltap = ABS_whl[].wheel_lock_torque * dump_pulse_percent;
ABS_whl[].sc_dump_pulse_deltap_s16 = CBTTP(whl, temp_dump_pulse_deltap);
ABS_whl[].sc_dump_pulse_deltap_s16 = MAX(ABS_whl[].sc_dump_pulse_deltap_s16, Cal.dup_vacl_deltap_min_f); //16
```
## Calibrate Rear Axle Pluse Base Release

### Circuit failure

```c
ABS_whl[].sc_dump_pulse_deltap_s16 = Cal.dup_half_sys_psize_r //16
```

### First Cycle 

```c
ABS_whl[].sc_dump_pulse_deltap_s16 = Cal.dup_frst_cycl_psize_r //16
```

### Other Cycle

```c
dump_pulse_percent = Lookup(ABS_whl[].split_adjusted_veh_decel,4,Cal.dup_vacl_to_base_percent_tbl_r); //1024
temp_dump_pulse_deltap = ABS_whl[].wheel_lock_torque * dump_pulse_percent;
ABS_whl[].sc_dump_pulse_deltap_s16 = CBTTP(whl, temp_dump_pulse_deltap);
ABS_whl[].sc_dump_pulse_deltap_s16 = MAX(ABS_whl[].sc_dump_pulse_deltap_s16, Cal.dup_vacl_deltap_min_r); //16
```
### Compensate pressure dump size when changing from IRC to SLC

```c
if (ABS_veh.ra_irc_to_slc == 1 && Abs_input.WhlPresEst[] > Abs_input.WhlPresEst[oppo])
{
	ra_irc_to_slc_press = (Abs_input.WhlPresEst[] - Abs_input.WhlPresEst[oppo]) / ABS_veh.ra_irc_to_slc_cnt_u8;
    ABS_whl[].sc_dump_pulse_deltap_s16 += ra_irc_to_slc_press;
    ABS_veh.ra_irc_to_slc_cnt--;
	if (ABS_veh.ra_irc_to_slc_cnt<=0){ABS_veh.ra_irc_to_slc=0}
}
```

##  Calibrate Ext pulse dump

> The front alxe wheel is selected normally, but the rear axle whl is selected according to IRC or SLC 

```c
temp_dump_ext_pulse = Lookup(Abs_input.WabsFiltWhlAx[IRC or SLC], 3,Cal.dup_wacl_to_psize_ext_tbl); //16
if (Abs_input.Ref_Cascade_possible == 1)
{
    temp_dump_ext_pulse += Cal.dup_ext_casc_inc[]; //16
}
ABS_whl[].sc_dump_pulse_deltap_s16 += temp_dump_ext_pulse
```

## Increase pressure dump size in "Other Cycle && high mu whl on split"

```c
dump_pulse_reduce_gain_on_split_himu_whl = Lookup(ABS_whl[].split_adjusted_veh_decel,4,Cal.dup_reduce_on_split_himu_whi); //1024
ABS_whl[].sc_dump_pulse_deltap_s16 += ABS_whl[].sc_dump_pulse_deltap_s16 * dump_pulse_reduce_gain_on_split_himu_whl;
ABS_whl[].sc_dump_pulse_deltap_s16 = MAX(ABS_whl[].sc_dump_pulse_deltap_s16, cal.dup_deltap_min_split_himu) //6
```

## Increase pressure dump size in "VSC interface"

```c
if(ABS_VSC_INTERFACE == 1
  && (ABS_in_veh.fil_ax_ay_magnitude_s16 > Cal.srg_vacl_let_abs_os_us_inf
     || WHL_TO_AXLE[] == REAR_AXLE))
{
    temp_yaw_stab_pulse_inc = ABS(MIN(ABS_whl[].slp_reg_yaw_stab_cntrl_gain_s16,0));
    temp_yaw_stab_pulse_inc = temp_yaw_stab_pulse_inc * Cal.dup_os_pulse_ext_gain_r);// 16*100
    ABS_whl[].sc_dump_pulse_deltap_s16 += temp_yaw_stab_pulse_inc;
}
```

## ABS Low speed dump pulse control

```c
#if(ABS_LOW_SPD_DUMP_PULSE_CONTROL == 1)
if Abs_input.VabsFilfVehSpd < Cal.dup_lowsp_dmp_adjust_thr // 256/3.6
{
    ABS_whl[].sc_dump_pulse_deltap_s16 =  ABS_whl[].sc_dump_pulse_deltap_s16 * Cal.low_spd_adjust_gain); //1024
}
#endif

ABS_whl[].state_pulse_size_s16 = ABS_whl[].sc_dump_pulse_deltap_s16
```