## himu Slip threshold

```c
slip slot = 1;
sthr_base_prcnt = st_himu_wacl_to_psthr_tbl_f;

slip slot = 2;
sthr_base_prcnt = st_fcycl_wacl_to_psthr_tbl_f;

slip slot = 5
sthr_base_prcnt = st_himu_wacl_to_psthr_tbl_r

slip slot = 6
sthr_base_prcnt = st_fcycl_wacl_to_psthr_tbl_r    //1024
sthr_abslt_min = st_himu_asthr_min_f/r  //256/3.6
```
###  Adjust slip threshold recording to VehSpd
```c
 tmp_st_high_spd_red = Lookup(Abs_input.VabsFiltVehSpd,2, Cal.st_ra_hi_vspd_redc_tbl); //1024/100
ABS_whl[].sthr_base_prcnt = ABS_whl[].sthr_base_prcnt * tmp_st_high_spd_red
```

## loMu Slip threshold

```c
sthr_prcnt_learned = st_init_low_mid_mu_psthr_f/r

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
sthr_abslt_min = st_pre_abs_asthr_min_f
sthr_base_prcnt = st_pre_abs_psthr_min_f

ABS_HEAVY_DESENS
slip slot = 10
sthr_abslt_min = st_pre_abs_asthr_min_l2_r
sthr_base_prcnt = st_pre_abs_psthr_min_l2_r

ABS_LIGHT_DESENS
slip slot = 11
sthr_abslt_min =  st_pre_abs_asthr_min_l1_r
sthr_base_prcnt = st_pre_abs_psthr_min_l1_r

default
slip slot = 12
sthr_abslt_min = st_pre_abs_asthr_min_r
sthr_base_prcnt = st_pre_abs_psthr_min_r

slip slot = 13
sthr_abslt_min = st_pre_abs_asthr_min_l2_f
sthr_base_prcnt = st_pre_abs_psthr_min_l2_f

slip slot = 14
sthr_abslt_min =  st_pre_abs_asthr_min_l2_r
sthr_base_prcnt = st_pre_abs_psthr_min_l2_r

high_mu_split
slip slot =15
sthr_prcnt_learned = st_splt_psthr_f
sthr_abslt_min = st_splt_asthr_min_f

cpc control = on 
sthr_prcnt_learned *= cpc_himu_sthr_gain_f/r  \1024/100\
sthr_abslt_min= cpc_himu_sthr_gain_f/r

slip slot =19 (ABS out)
```