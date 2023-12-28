## Esc_yrc.yrc_active

```c
Esc_yrc.yrc_active = Esc_yrc.ydc_active || Esc_yrc.yrc_yaw_active
```
## Esc_yrc.yaw_active

```C
if (Esc_yrc.yrc_yaw_active == 0){
  if ( SIGN(Esc_yrc.ay_yaw) == Esc_input.sign_yr
  &&  Esc_input.process.veh_spd >= Cal.yrc_vs_entrance_thr //256
  &&  Esc.cst.act_mode == FULL_CONTROL
  &&  ABS(Esc_input.filt_ay) > Cal.yrc_ay_entrance_thr //256
  &&  ABS(Esc_input.filt_yr) > Cal.yrc_yr_entrance_thr) //128
  {
    if (Esc_yrc.error_present == 1){
      Esc_yrc.yrc_yaw_active = 1;
    }
  }
}
else{
  if (Esc_yrc.error_present == 0
  ||  SIGN(Esc_yrc.ay_yaw) != Esc_input.sign_yr
  ||  Esc_cst.act_mode == NO_CONTROL){
    Esc_yrc.yrc_yaw_active = 0
  }
}
```