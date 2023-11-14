## Transtion in ACTION_RECOV_APPLY
```c
// whl = WHL INDEX SLCT LOW HIGH DECEL in rear wheels
// Abs_input.WabsFiltWhlAx[whl]
// Abs_input.filt_wheel_jeck[whl]
// Abs_input.WabsFiltNormalWhlSpd[whl]
if(Abs_input.WabsFiltWhlAx[whl] < 0
&& ABS_whl[].slip_phase == SLIP_UNDER_THR)
{
    ABS_whl[].control_state[0] = ACTION_PULSED_RELEASE;
}
else
{
    if (ABS_whl[].slip_phase == SLIP_OVER_THR)
    {
        ABS_whl[].control_state[0] = ACTION_FULL_APPLY;
    }
    else
    {
        if(Abs_input.WabsFiltWhlAx[whl] <= ABS_whl[].athr_aclfb_s16
        ||(Abs_input.filt_wheel_jeck[whl] <= Cal.af_jrk_act_thr //1
         &&Abs_input.WabsFiltNormalWhlSpd[whl]< Abs_input.VabsWhlReferSpd[])
        ||(ABS_in_whl[].wheel_torque >= ABS_whl[].recover_app_target_torq))
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
            else
            {
                ABS_whl[].control_state[0] = ACTION_WHEEL_ACCELERATING;
            }
        }
        else
        {
            if ABS_vel.moving == 0 { ABS_whl[].control_state[0] = ACTION_EOS_APPLY}
        }
    }

}

```