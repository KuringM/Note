##  Activation conditions for EH

```c
ABS_whl[].dbi_pd_cntrl_var_s16 < 0 ;// And opposite wheel as so 
ABS_whl[].dbi_slip_err_prcnt_s16 < ABS_whl[].dbi_slip_targ_prcnt_s16 / 2;; //And opposite wheel as so
ABS_whl[].dbi_slip_targ_prcnt_s16 < 2 * whl_slip_pct;
Abs_input.veh_spd_from_ramps < Cal_abs.dbi_veh_spd_max_f/r; //256/3.6
Abs_input.veh_spd_from_ramps > Cal_abs.dbi_veh_spd_min_f/r; //256/3.6
```

## Calculate `ABS_whl[].dbi_slip_targ_prcnt_s16`

- `Cal.dbi_whl_starg_base` is  Proportional term

```c
// initial calibrate dbi slip percent
ABS_whl[].dbi_slip_targ_prcnt_s16 = Cal.dbi_whl_starg_base + (Abs_input.WhlPressEst[] - Cal.dbi_whl_pest_starg_dbnd) * cal.dbi_whl_pest_starg_gain; //1024 //16 //(1024*256/100)/16=163.84 
// limit dbi slip percent if current wheel has entered EH 
if (ABS_whl[].en_control == 1)
{
    ABS_whl[].dbi_slip_targ_prcnt_s16 = Min(ABS_whl[].dbi_slip_targ_prcnt_s16, Cal.dbi_whl_starg_base)
}

// Limit min value of target to zero (never set a negative target!)
ABS_whl[].dbi_slip_targ_prcnt_s16 = Max(ABS_whl[].dbi_slip_targ_prcnt_s16, Cal.dbi_starg_min); //1024/100
```

## Calculation of `ABS_whl[].dbi_slip_err_prcnt_s16`

```c
ABS_whl[].dbi_slip_err_prcnt_s16 = ABS_whl[].dbi_slip_targ_prcnt_s16 - ABS_whl[].slip_prcnt_low_spd_desense_s16;

if Abs_input.VabsFiltVehSpd < Cal.sreg_vspd_desens_slp_calc // 256/3.6
{
    // Desensitize wheel slip at lower speeds
    ABS_whl[].slip_prcnt_low_spd_desense_s16 = ABS_whl[].whl_slip_pct *Abs_input.VabsFiltVehSpd / Cal.sreg_vspd_desens_slp_calc
}
else
{
    // wheel slip is not desensitized for higher speeds
    ABS_whl[].slip_prcnt_low_spd_desense_s16 = ABS_whl[].whl_slip_pct;
}
```

