## Calculate the Dump Copy Limit

> dumpcopy limit is a proportional for pressure dump size

#### yaw_dumpcopy_limit

```c
if (whl_index == Front_LEFT && (ABS_in_veh.yaw_rate_filt_S16 > cal.yc_ducopy_lim_yaw_dbnd)) //128
 ||(whl_index == Front_Right && (ABS_in_veh.yaw_rate_filt_S16 < - cal.yc_ducopy_lim_yaw_dbnd))
{ 
    yaw_dumpcopy_limit = ABS(ABS_in_veh.yaw_rate_filt - cal.yc_ducopy_lim_yaw_bdnd) * cal.yc_ducopy_lim_yaw_gain //128 //1024
}
if (whl_index == Front_LEFT && yaw_rate_deriv_filt_S16> 0) 
 ||(whl_index == Front_Right && yaw_rate_deriv_filt_S16< 0)
{
    yaw_dumpcopy_limit += ABS(ABS_in_veh.yaw_rate_deriv) * cal.yc_ducopy_lim_yawdt_gain } //1024
}
```

#### spd_dumpcopy_limit

```c
// load base dump copy limit as a function of VSPD
spd_dumpcopy_limit= LookUpTable (ABS_input.VabsFiltVehSpd,3, cal_abs.yc_vspd_to_ducope_perc_tbl) //1024
    
// increase the dump copy limit to stabilize the vehicle fos a split-?situation in a curve
if (ABS_veh.yc_curve_trims=1) 
{
    spd_dumpcopy_limit += cal.yc_ducopy_lim_curve_inc //1024
}
```

#### pestim_dumpcopy_limit
```c
// high wheel hold pressure to copy dump time
if (ABS_SCV_CONTROL == ON 
 && ABS_veh.scv_enable == True
 && ABS_input.PlgPresVld == True)
{
    // the Target pressure is greater, the Proportional for pressure dump size is smaller
    pestim_dumpcopy_limit = (ABS_whl[].last_departure_press_s16 - cal.yc_ducopy_targ_press) //16 
        				   /ABS_whl[].last_departure_press_s16
}
else 
{
    pestim_dumpcopy_limit = cal.yc_ducopy_perc_no_scv //1024
}
```

### Calc final dumpcopy limit

```c 
// final_dumpcopy_limit is the MAX dump torq change percent
ABS_whl[].yc_dump_perc_copied_s16 = final_dumpcopy_limit = MAX(spd_dumpcopy_limit, pestim_dumpcopy_limit,yaw_dumpcopy_limit}
```
####  Calibate the dump torq change percent for State yc high to split dump

```c
final_dumpcopy_limit = MAX(spd_dumpcopy_limit, Cal.yc_h2s_ducopy_lim) //1024
```
##### assign & upper limit yc_dump_perc_copied_s16

```c     
if ( ABS_whl[].[opp_whl].dump_torq_change_percent > ABS_whl[].yc_dump_perc_copied_s16)
{
    ABS_whl[].yc_dump_perc_copied_s16 = MIN(ABS_whl[opp_whl].dump_torq_change_percent, final_dumpcopy_limit)
}
```
# 计算泄压时间

```c
dump_time_limit= LookUpTable(Abs_input.VabsFiltVehSpd,3, cal.yc_vspd_to_ducopy_tm_tbl) //4

// assign & upper limit yc_dumptim_copied_s16
ABS_whl[].yc_dumptim_copied_s16 = MIN(ABS_whl[oppo].rel_time_sum, dump_time_limit)
```
