## Calc gradient_request

####  Initialze gradient request

```c
old_gradient_requset = ABS_whl[].gradient_request_s16
gradient_request = LookUp(ABS_whl[].ContinuousPresControlErr_s16, 6, cal.crc_err_to_grad);

if ( gradient_request >= 0
	&& axle == REAR_AXLE
	&& ABS.SAME_WHL_OPP_AXL.splt_control == 1
	&& ABS_input.WhlPresEst[whl] > ABS_veh.CPC_max_press_RA_calc_s16 )
{	
    gradient_request = Cal.cpc_press_lim_dump_grad ; //-120*1
} 
```
##### `LookUp(ABS_whl[].ContinuousPresControlErr_s16, 6, cal.crc_err_to_grad)`

| X | Y |
| :--- | :------: |
| -1200  |   80   |
| -800 // -51 |   20    |
| -50 // Threshold to applying |   0   |
| 50  // Threshold to dumping |   0    |
|   800 // 51  |     -20     |
|   2000   |    -200      |

#### Update gradient request

```c 
if(gradient_request>0)
{
    // Todo gradient_request_old
    if (ABS_SCV_CONTROL == ON)
    {
        yaw_ControlVar=ABS_veh.PSI_ControlVar_s16;
    }
    else
    {
        yaw_ControlVar=ABS_in_veh.yaw_rate_deriv_s16;
    }
    
    // According to yaw control, limit Real alxe apply 
    if(axle=REAL_AXLE
      &&(ABS_input.WhlPresEst[] > ABS_veh.CPC_max_press_RA_calc_s16 
        ||(ABS_whl[SAME_WHL_OPP_AXL].splt_control == 1
           &&(  (surcface_condition= SURFACE_SPLIT_LEFT_HIGH_CONFIRMED && yaw_Control>0)
              ||(surcface_condition= SURFACE_SPLIT_RIGHT_HIGH_CONFIRMED && yaw_Control<0)))))
    {
        gradient_request = 0
    }
    else if 
        ( (whl_index == Front_LEFT||whl_index == Rear_LEFT) && (ABS_in_veh.yaw_rate_deriv_s16<0)
        ||(whl_index == Front_Right||whl_index == Rear_right) && (ABS_in_veh.yaw_rate_deriv_s16>0))
    {
        gradient_request = MIN(gradient_request,LookUP(ABS(ABS_in_veh.yaw_rate_deriv_s16), 2, Cal.cpc_yawdt_to_max_grad)); //CPC_ERR_TO_GRED_Y0 = <80> *16
    }
}
// CPC Dump
else if (gradient_request<0)
{
    if (old_gradient_request >= 0)
    {
        ABS_whl[].lineup_frame_var=True;
    }

    if axle == REAR_AXLE
     ||(whl_index=Front_LEFT && ABS_in_veh.yaw_rate_filt_s16 > Cal.cpc_minyawr_dumplim_overwrite_fa) //128
     ||(whl_index=Front_RIGHT && ABS_in_veh.yaw_rate_filt_s16 < -Cal.cpc_minyawr_dumplim_overwrite_fa)
    { 
        lower_press_limit_s16=0;
    }
    else
    { 
        lower_press_limit_s16 = cal.cpc_min_act_press_fa; //16
    }
    
    if(Abs_input.WhlPresEst[]< low_press_limit_s16)
    { 
        gradient_request=0 ;
    }
    else if (ABS_whl.CPC_dump_by_whl_slp == 1)
    { 
        ABS_whl[].state_pulse_size_s16= cal.cpc_dump_whl_slip_psize; //16
    }
}
else
{
    if (old_gradient_request < 0)
    {
        ABS_whl[].lineup_frame_var=True;
    }
}

```

### CPC apply or rel

```c
ABS_whl[].gradient_request_s16= gradient_request;
if(gradient_request>0)
{
    if(old_gradient_request<=0)
    {
        ABS_whl[].need_pulse_apply = 1;
    }
    CommandApply(); // CPC apply
}
else
{
    ABS_whl[].need_pulse_apply = 0;
    WhlStateControlCommand(); // CPC rel
}
```

