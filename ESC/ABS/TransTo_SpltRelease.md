## Calc hold time

```c
if ABS_VSC_INERFACE == 0 || ABS_veh.scv_enable == 0
{
    temp_hold_tm_trig_aply = [oppwhl].accumulate_slip - whl.accumulate_slip;
    temp_hold_tm_trig_aply = LookUp(temp_hold_tm_trig_aply,3, cal.yc_tm_trig_aply_tbl) //1
}
else
{
    temp_hold_tm_trig_aply = 0
}
```

### Tran to Splt Apply

```c
if (whl.t_yc_dump_copy_intrrpt_tim_s16 > 0 
 || surface_condition == SURFACE_HOMOGENEOUS)
    else if (whl.t_yc_dump_copy_intrrpt_tim_s16 >= temp_hold_tm_trig_aply 
          || oppwhl.slip_phase == SLIP_PHASE_TRANS
          || VabsFiltVehSpd <= Cal.splt_copyrel_vs_thr)  //256/3.6
    {
        control_state = ACTION_SPLT_APPLY
    }
```

#### Calc whl.t_yc_dump_copy_intrrpt_tim_s16

```c
if	((dump_torq change percent < yc_dump_perc_copied_S16 && WhiPresEstb> AC PESTIM DB)//1 
   ||(rel_time_sum < yc_dumptim_copied_s16) 
   || control_state[CURRENT] != control_state [BEFORE]) 
   &&(oppwhl.slip_phase = SLIP_UNDER_THR
      || oppwhl.control_state [CURRENT] == ACTION ESC HOLD
      || oppwhl.control_state [CURRENT] == ACTION_ESC_APPLY)
      || h2s_caused_by_u8 == H2S_BY_FAST_YAW\4\))
    else if whl.t_yc_dump_copy_intrrpt_tim_s16 <= S16_MAX_ABS_LOOPTIME
    {
        whl.t_yc_dump_copy_intrrpt_tim_s16 = ABS_LOOPTIME //5
    }
```



