## Constant Mu: Low to High Jump

```c
low_to_high_flag = LowToHighDetect();

if (ABS_whl[].whl_cycle_control == 1) && (ABS_whl[].split_adjusted_veh_decel >= Cal.srf_vacl_let_l2h_detct) //256
 // L2H detected by whl accl peak 
    && (low_to_high_flag == 1)
    || (
 // L2H detected by slip integral
 (Abs_input.PlgPresVld == 0||(Abs_input.PlgPresVld == 1 && Abs_input.PlgCldPress > Cal.srf_mcp_let_l2h_detct)) //16
&&(
	(temp_l2h_from_slip_integral_flag == 1 && Abs_input.SupplementActive == 0) 
 // L2H detected by torq overshoot
   ||(
   		ABS_whl.slip_phase == SLIP_ABOVE_THR 
    &&(
        (ABS_whl.number_of_cycle >1 
     && ABS_whl.wheel_lock_torq_overshoot_pct >= Cal.srf_delp_perr_let_12h_detct) //1024
     || ABS_whl.wheel_lock_torq_overshoot_pct >= Cal.srf_delp_perr_let_12h_detct2 //1024
      ) 
    && (ABS_whl[].wheel_lock_torq_overshoot >= temp_l2h_whl_overshoot_thr)
     )
   )
       )
{
    ABS_whl[].whl_surf_jump_state = 1; // WHL_L2H_TRANSITION
}
```

###  L2H detected by whl accl peak 

```c
BOOLEAN LowToHighDetect(const U8 whl_index)
{
    BOOLEAN result;
    S16 temp_srf_wacl_let_l2h_detct_s16;
    if (ABS_whl[oppo].l2h_detct_by_wacl == 1)
    {
        // reduce WACL threshold if the opposite wheel has detected a low to high transition
        temp_srf_wacl_let_l2h_detct_s16 = Cal.srf_wacl_let_l2h_detct_dsens; //32
    }
    else
    {
       temp_srf_wacl_let_l2h_detct_s16 = Cal.srf_wacl_let_l2h_detct; //32
    }
    
    if( ABS_in_whl[].drivetrain_oscill == 0
     && ABS_whl.silp_phase != SLIP_ABOVE_THR
     && ABS_whl[].whl_peak_accel >= temp_srf_wacl_let_l2h_detct_s16
     && Abs_input.VabsFiltVehSpd > Cal.srf_vspd_let_12h_detct //256/3.6
     && ( ABS_whl[].slip_duration > Cal.srf_slptim_let_l2h_detct //1
       || ABS_whl[].dump_torq_change_percent > Cal.srf_dmp_prcnt_let_l2h_detect //1024
     )
    )
    {
        result = 1;
    }
    else
    {
        result = 0;
    }
    ABS_whl[].l2h_detct_by_wacl = result;
}
```

### L2H detected by slip integral

```c
ABS_veh.l2h_slip_error_integral_sum_s16 = 0;
if( ABS_input.vabs_fil_ax >= Cal.veh_ax_hi_mu_thr //256
&& (ABS_whl[0].slip_duration <= Cal.srf_slptim_reset_sint_sum //1
  ||ABS_whl[0].slip_phase != SLIP_UNDER_THR)
&& (ABS_whl[1].slip_duration <= Cal.srf_slptim_reset_sint_sum //1
  ||ABS_whl[1].slip_phase != SLIP_UNDER_THR) )
{
    if (  ABS_whl[0].slip_phase == SLIP_ABOVE_THR
       && ABS_whl[1].slip_phase == SLIP_ABOVE_THR
       &&(ABS_whl[2].slip_phase == SLIP_ABOVE_THR || ABS_whl[3].slip_phase == SLIP_ABOVE_THR)
       && ABS_veh.surface_condition == SURFACE_HOMOGENEOUS|1
       && ABS_whl[0].slip_error_prcnt_integral_s16 > Cal.srf_sint_err_let_l2h_detct /2 //1024
       && ABS_whl[1].slip_error_prcnt_integral_s16 > Cal.srf_sint_err_let_l2h_detct /2
       &&(ABS_whl[2].slip_error_prcnt_integral_s16 > Cal.srf_sint_err_let_l2h_detct /4 
        ||ABS_whl[3].slip_error_prcnt_integral_s16 > Cal.srf_sint_err_let_l2h_detct /4) )
    {
        // Compute slip error integral sum
        temp_l2h_slip_error_int_sum_s32 = 0;
        for(whl = 0; whl < 4; whl++)
        {
            temp_l2h_slip_error_int_sum_s32 += ABS_whl[whl].slip_error_prcnt_integral_s16;
        }
        temp_l2h_slip_error_int_sum_s32 = Min(temp_l2h_slip_error_int_sum_s32, 2^16);
        ABS_veh.l2h_slip_error_integral_sum_s16 = Max(ABS_veh.l2h_slip_error_integral_sum_s16, temp_l2h_slip_error_int_sum_s32);
        
        // Based on slip error integral sum, determine possible low to high condition
        if ABS_veh.l2h_slip_error_integral_sum_s16 > Cal.srf_sint_err_let_l2h_detct //1024
        {
            temp_l2h_from_slip_integral_flag = 1;
        }
    }
}
```

### L2H detected by torq overshoot

```c
// compute l2h whl torq overshoot thr
temp_l2h_whl_overshoot_thr = CPTTP(whl, Cal.srf_delp_aerr_let_l2h_detct); //16
/*
	Converts pressure into torque
	temp_l2h_whl_overshoot_thr = Cal.srf_delp_aerr_let_l2h_detct * APP_VEH_INFO.WHL_BRK_FACTOR_f/r / (512*16)
*/

// compute ABS_whl[].wheel_lock_torq_overshoot and ABS_whl[].wheel_lock_torq_overshoot_pct
if ABS_whl[].recovered == 0 && ABS_whl[].whl_cycle_control == 1
{
    if ABS_whl.slip_phase == SLIP_ABOVE_THR && ABS_whl[].wheel_torque_band > 0
    {
        temp = ABS_in_whl[].wheel_torque - ABS_whl[].wheel_lock_torque_0;
        temp = Limit(temp, -2^16, 2^16);
        ABS_whl[].wheel_lock_torq_overshoot = temp;
        
        temp = ABS_whl[].wheel_lock_torq_overshoot / ABS_whl[].wheel_torque_band;
        temp = Limit(temp, -2^16, 2^16);
        ABS_whl[].wheel_lock_torq_overshoot_pct = temp;
    }
}
```
