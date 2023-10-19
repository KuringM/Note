## Calculate the Dump Copy Limit

> dumpcopy limit is a proportional for pressure dump size

#### yaw_dumpcopy_limit
```c
/* 
PD dump copy limit as a function of yaw rate and yaw rate derivative for cornering
situations of highly unstable initial conditions. This runs for the narmal YC INITIAl DUMP
state as well as for a h2s Dump copy.
*/
if( ABS_VSC_INTERFACE == 1 && ABS_in_veh.yib_sensors_valid == 1)
{
    if (whl_index == Front_LEFT && (ABS_in_veh.yaw_rate_filt_S16 > cal.yc_ducopy_lim_yaw_dbnd)) //128
     ||(whl_index == Front_Right && (ABS_in_veh.yaw_rate_filt_S16 < - cal.yc_ducopy_lim_yaw_dbnd))
    { 
        yaw_dumpcopy_limit = ABS(ABS_in_veh.yaw_rate_filt - cal.yc_ducopy_lim_yaw_bdnd) * cal.yc_ducopy_lim_yaw_gain * 1024/1024/128; //128 //1024
    }

// Now add the "D" term if the yaw acceleration is toward the high ?side.
    if (whl_index == Front_LEFT && yaw_rate_deriv_filt_S16> 0) 
    ||(whl_index == Front_Right && yaw_rate_deriv_filt_S16< 0)
    {
        yaw_dumpcopy_limit += ABS(ABS_in_veh.yaw_rate_deriv) * cal.yc_ducopy_lim_yawdt_gain ;//1024
    } 
}

```

#### spd_dumpcopy_limit & pestim_dumpcopy_limit
> 
```c
if(Control state == ACTION_SPIL_RELEASE)
{
    // load base dump copy limit as a function of VSPD
    spd_dumpcopy_limit= LookUpTable (ABS_input.VabsFiltVehSpd,3, cal_abs.yc_vspd_to_ducope_perc_tbl); //1024
    
    // increase the dump copy limit to stabilize the vehicle fos a split-?situation in a curve
    if (ABS_veh.yc_curve_trims == 1) 
    {
        spd_dumpcopy_limit += cal.yc_ducopy_lim_curve_inc; //1024
    }

    // high wheel hold pressure to copy dump time
    if (ABS_SCV_CONTROL == ON 
    && ABS_veh.scv_enable == True
    && ABS_input.PlgPresVld == True)
    {
        // the Target pressure is greater, the Proportional for pressure dump size is smaller
        pestim_dumpcopy_limit = (ABS_whl[].last_departure_press_s16 - cal.yc_ducopy_targ_press) / 1024 //16 
                            /ABS_whl[].last_departure_press_s16;
        pestim_dumpcopy_limit = Max(pestim_dumpcopy_limit, 0);
    }
    else 
    {
        pestim_dumpcopy_limit = cal.yc_ducopy_perc_no_scv; //1024
    }

    // Calc final dumpcopy limit
    // final_dumpcopy_limit is the MAX dump torq change percent
    final_dumpcopy_limit = MAX(spd_dumpcopy_limit, pestim_dumpcopy_limit,yaw_dumpcopy_limit);

    // 计算泄压时间  ABS_whl[].yc_dumptim_copied_s16
    if( Abs_input.PlgPresVld != 0)
    {
        dump_time_limit_s16 = LookUpTable(Abs_input.VabsFiltVehSpd,3, cal.yc_vspd_to_ducopy_tm_tbl) //4
    }
    else
    {
        dump_time_limit_s16 = 0;
    }
}
else
{
    // Calibate the dump torq change percent for State yc high to split dump
    final_dumpcopy_limit = Max(yaw_dumpcopy_limit, Cal.yc_h2s_ducopy_lim); //1024
    dump_time_limit_s16 = 0;
}
final_dumpcopy_limit = min(final_dumpcopy_limit, 1024);

// assign & upper limit yc_dumptim_copied_s16
ABS_whl[].yc_dumptim_copied_s16 = min(ABS_whl[oppo].rel_time_sum, dump_time_limit_s16)

 /* Start determination of dump copy time*/
if ( ABS_whl[].[opp_whl].dump_torq_change_percent > ABS_whl[].yc_dump_perc_copied_s16)
{
    // assign & upper limit yc_dump_perc_copied_s16 
    ABS_whl[].yc_dump_perc_copied_s16 = MIN(ABS_whl[opp_whl].dump_torq_change_percent, final_dumpcopy_limit)
}
else if ( /*Todo*/)
{
    
}
```