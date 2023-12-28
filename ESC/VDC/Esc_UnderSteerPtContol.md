``` c
Esc_CalcUpcError();
if (ABS(Esc_input.yr_dot) > cal.us_delay_yd_thr //64
&&  SIGN(Esc_input.yr_dot) == SIGN(Esc_input.filt_yr)){
  Esc_upc.us_delay_timer = cal.us_delay_timer_thr; //1
}
else{
  Esc_upc.us_delay_timer = max(Esc_upc.us_delay_timer - ESC_CONTROL_LOOPTIME, 0)
}

Esc_upc.upc_ramp_rate = Esc_CalTorqueChangeStep();

if( 
  (Esc_input_process.veh_ spd > Esc_upc.us_entry_spd_thr
  ||Esc_upc.control_active == 1)
&& Esc_input.gas_pedal_posn > cal.us_pt_throttle_thr //1024
&& Esc_cst.act_mode == FULL_CONTROL)
{
  if( Esc_upc.control_state != S_UPC_ACTIVE)
  {
    if(
    ( Esc_input.sign_ay > 0 && Esc_input_process.sa_at_wheel > cal.us_enable_sa_at_wheel_thr //128
    || Esc_input.sign_ay < 0 && Esc_input_process.sa_at_wheel < - cal.us_enable_sa_at_wheel_thr
    )
    && Esc_upc.us_delay_timer <= 0
    && Esc_upc.upc_prop_error > Esc_upc.us_entry_error_thr 
    ){
      Esc_upc.us_pt_enter_timer = max(Esc_upc.us_pt_enter_timer - ESC_CONTROL_LOOPTIME, 0);
      if Esc_upc.us_pt_enter_timer  <= 0
      {
        Esc_UpcActive();
      }
    }
    else{ Esc_UpcRampOut();}
  }
  else if(
    Esc_upc.upc_prop_error <= Esc_upc.us_exit_thr 
  || ( Esc_input.sign_ay > 0 && Esc_input_process.sa_at_wheel > cal.us_enable_sa_at_wheel_thr //128
  || Esc_input.sign_ay < 0 && Esc_input_process.sa_at_wheel < - cal.us_enable_sa_at_wheel_thr)
  ){
    Esc_UpcRampOut();
  }
  else{Esc_UpcActive();}
}
else{
  if Esc_input.geaf_mode != GEAF_ESC_INHIBIT{
    if Esc_upc.control_active == 1{ Esc_UpcRampOut();}
    else{ ESC_UpcDisable();}
  }
  else{ ESC_UpcDisable();}
}

Esc_upc.control_active_old = Esc_upc.control_active;
```