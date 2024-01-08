## himu Slip threshold

```c
// In high mu
if (
  ABS_veh.circuit_failure_status == CIRCUIT_FLRR_FAILURE
  ||ABS_veh.circuit_failure_status == CIRCUIT_FRRL_FAILURE
  ||(
    ABS_veh.ab_di_desense == ABS_NO_DESENS
    &&Abs_input.vabs_fil_ax < cal.veh_ax_hi_mu_thr //256
  )
)
{
  ABS_whl[].sthr_prcnt_learned = cal.st_init_low_mid_mu_psthr_f[]; //1024
  slip slot = 1;
  tmp_st_psthr = Lookup(ABS_whl[].sthr_ax_whl_veh_diff, 2, st_himu_wacl_to_psthr_tbl_f);

  slip slot = 2;
  sthr_base_prcnt = st_fcycl_wacl_to_psthr_tbl_f;

  slip slot = 5
  sthr_base_prcnt = st_himu_wacl_to_psthr_tbl_r

  slip slot = 6
  sthr_base_prcnt = st_fcycl_wacl_to_psthr_tbl_r    //1024

  tmp_st_abslt_min = st_himu_asthr_min_f/r  //256/3.6

  ABS_whl[].sthr_base_prcnt = tmp_st_psthr;
  ABS_whl[].sthr_abslt_min = tmp_st_abslt_min;

  // rear whl sthr_base_prcnt modiify
  // Adjust slip threshold recording to VehSpd
  tmp_st_high_spd_red = Lookup(Abs_input.VabsFiltVehSpd,2, Cal.st_ra_hi_vspd_redc_tbl); //1024/100
  ABS_whl[].sthr_base_prcnt = ABS_whl[].sthr_base_prcnt * tmp_st_high_spd_red
}
```

## Pre ABS && Low mu
```C 
if (
  (
    ABS_whl[].esc_control == 0
    || ABS_in_veh.driver_intent == DI_POSSIBLE_ACCEL
    || ABS_in_veh.driver_intent == DI_CONFIRMED_ACCEL
    || ABS_in_veh.driver_intent == DI_IDLE
  )
  && ABS_whl[].whl_cycle_control == 0
  && ABS_whl[].splt_control == 0
)
```

### loMu Slip threshold in FRONT_AXLE

```c
sthr_prcnt_learned = st_init_low_mid_mu_psthr_f/r

// case in ABS_veh.ab_di_desense
ABS_HEAVY_DESENS
slip slot = 7
sthr_abslt_min = st_pre_abs_asthr_min_l2_f
sthr_base_prcnt = st_pre_abs_psthr_min_l2_f

ABS_LIGHT_DESENS
slip slot = 8
sthr_abslt_min = st_pre_abs_asthr_min_l1_f
sthr_base_prcnt = st_pre_abs_psthr_min_l1_f

default
slip slot = 9
tmp_st_pre_abs_abslt_min = st_pre_abs_asthr_min_f
tmp_st_abs_prcnt = st_pre_abs_psthr_min_f

if ABS_veh.flag_sthr_low_speed == 1
{
  min_thresh = min(tmp_st_pre_abs_abslt_min, cal.st_lowspd-asthr_min[FRONT_AXLE]);
}
``` 

### loMu Slip threshold in REAR_AXLE
``` c
ABS_HEAVY_DESENS
slip slot = 10
sthr_abslt_min = st_pre_abs_asthr_min_l2_r
sthr_base_prcnt = st_pre_abs_psthr_min_l2_r

ABS_LIGHT_DESENS
slip slot = 11
sthr_abslt_min =  st_pre_abs_asthr_min_l1_r
sthr_base_prcnt = st_pre_abs_psthr_min_l1_r

default
sthr_abslt_min = st_pre_abs_asthr_min_r
sthr_base_prcnt = st_pre_abs_psthr_min_r
if ABS_veh.flag_sthr_low_speed == 1
{
  min_thresh = min(tmp_st_pre_abs_abslt_min, cal.st_lowspd-asthr_min[REAR_AXLE]);
}
slip slot = 12
```

### Abs_input.EscWhlCtrlEffective[] == 1

``` C
slip slot = 13
sthr_abslt_min = st_pre_abs_asthr_min_l2_f
sthr_base_prcnt = st_pre_abs_psthr_min_l2_f

slip slot = 14
sthr_abslt_min =  st_pre_abs_asthr_min_l2_r
sthr_base_prcnt = st_pre_abs_psthr_min_l2_r
```

### high_mu_split
``` c
sthr_prcnt_learned = ABS_whl[].sthr_prcnt_learned;

// ABS_veh.surface_condition = 4 || 5
slip slot =15
sthr_prcnt_learned = st_splt_psthr_f
sthr_abslt_min = st_splt_asthr_min_f

cpc control = on 
sthr_prcnt_learned *= cpc_himu_sthr_gain_f/r  \1024/100\
sthr_abslt_min= cpc_himu_sthr_gain_f/r
```

### Low mu slip learning band
```C
if (
  GetDrivetrainVibFlag(whl_index) == 0
  && ABS_whl[].recovered == 1
  && ABS_whl.number_of_cycle > 1
){
  sthr_learn_band_max = Lookup(ABS_whl[].rel_time_sum, 3, cal.stl_reltm_to_lrn_bran_max[f/r]);
  sthr_learn_band_min = Lookup(ABS_whl[].rel_time_sum, 3, cal.stl_reltm_to_lrn_bran_min[f/r]);
  asthr_learn_band_max = Lookup(ABS_whl[].rel_time_sum, 3, cal.stl_reltm_to_lrn_absol_max[f/r]);
  asthr_learn_band_min = Lookup(ABS_whl[].rel_time_sum, 3, cal.stl_reltm_to_lrn_absol_min[f/r]);

  ABS_whl[].sthr_learn_band[max] = ABSMinThresholdCalc(whl_index, sthr_learn_band_max, asthr_learn_band_max);
  ABS_whl[].sthr_learn_band[min] = ABSMinThresholdCalc(whl_index, sthr_learn_band_min, asthr_learn_band_min);

// slip_prcnt_peak > maximum learn band, subtract step percentage lower limited by the absolute slip adjustent value.
slot = 16
// slip_prcnt_peak < minimum learn band, subtract step percentage lower limited by the absolute slip adjustent value.
slot = 17

// slip is wthin target band so do not modify the % base slip threshold
slot = 18
}
slip slot =19 (ABS out)
```