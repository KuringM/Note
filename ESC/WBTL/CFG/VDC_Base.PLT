Esc_cst.act_mode  nobit 1 unit=Bar scmin=-389.329 scmax=138.628
//Active signals
Esc_yrc.error_present  bit 2 unit= scmin=0 scmax=255
Esc_yrc.yrc_yaw_active  bit 3 unit= scmin=0 scmax=255
Esc_yrc.yrc_active  bit 4 unit=bar scmin=0 scmax=255
Esc_yrc.ydc_active  bit 1 unit=bar scmin=0 scmax=255
Tcs_veh.vehicle_active  bit 2 unit= scmin=0 scmax=255
~ Tcs_axle._0_.powertrain_active  bit 2 unit= scmin=0 scmax=255
~ Tcs_axle._1_.powertrain_active  bit 3 unit= scmin=0 scmax=255
Tcs_veh.veh_brk_active  bit 3 unit= scmin=0 scmax=255
Esc_ptc.ptc_active  bit 4 unit= scmin=0 scmax=255
Esc_upc.control_active  bit 1 unit=Bar scmin=0 scmax=255
~ Esc_ptc.ptc_axle_active._0_  bit 4 unit= scmin=0 scmax=255
~ Esc_ptc.ptc_axle_active._1_  bit 1 unit= scmin=0 scmax=255
Esc_sac.us_brk_active  bit 2 unit=Bar scmin=0 scmax=255
~ Arm_control.active  bit 4 unit=Bar scmin=0 scmax=255
BrkPedlSwt  bit 3 unit= scmin=0 scmax=1
Esc_input.gas_pedal_posn  nobit 4 unit=Bar scmin=-20.8826 scmax=1.33894
+ exp=x/1024
//BEGIN_GROUP "Trace Torq" DISABLED
~ TcsActv  bit 4 unit= scmin=0 scmax=1
~ WCBS_F_FrntAxleFastReductionTrqReqVld  bit 1 unit= scmin=0 scmax=1
~ WCBS_F_ReAxleFastReductionTrqReqVld  bit 2 unit= scmin=0 scmax=1
~ PdcuFrntAxleTrqReq  nobit 3 unit=Nm scmin=-11456.9 scmax=2909.1
~ WCBS_N_FrntAxleFastReductionTrqReq  nobit 4 unit=Nm scmin=-11456.9 scmax=2909.1
~ PdcuFrntAxleTrqAct  nobit 1 unit=Nm scmin=-11456.9 scmax=2909.1
~ PdcuReAxleTrqReq  nobit 2 unit=Nm scmin=-10009.2 scmax=4356.84
~ WCBS_N_ReAxleFastReductionTrqReq  nobit 3 unit=Nm scmin=-10009.2 scmax=4356.84
~ PdcuReAxleTrqAct  nobit 4 unit=Nm scmin=-10009.2 scmax=4356.84
//END_GROUP
Esc_input_process.veh_spd  nobit 1 unit=km/s scmin=-154.699 scmax=187.301
+ exp=x/256*3.6
Esc_input_process.veh_spd  nobit 2 unit=m/s scmin=-42.9719 scmax=52.0281
+ exp=x/256
~ Esc_input.vabs_whl_refer_spd._0_  nobit 4 unit=bar scmin=-60.2781 scmax=34.7219
~ + exp=x/256
~ Esc_input.vabs_whl_refer_spd._1_  nobit 4 unit=bar scmin=-60.2781 scmax=34.7219
~ + exp=x/256
~ Esc_input.vabs_whl_refer_spd._2_  nobit 4 unit=bar scmin=-60.2781 scmax=34.7219
~ + exp=x/256
~ Esc_input.vabs_whl_refer_spd._3_  nobit 4 unit=bar scmin=-60.2781 scmax=34.7219
~ + exp=x/256
~ Esc_input.wabs_filt_norm_whl_spd._0_  nobit 1 unit=bar scmin=-42.9719 scmax=52.0281
~ + exp=x/256
~ Esc_input.wabs_filt_norm_whl_spd._1_  nobit 2 unit=bar scmin=-42.9719 scmax=52.0281
~ + exp=x/256
~ Esc_input.wabs_filt_norm_whl_spd._2_  nobit 3 unit=bar scmin=-42.9719 scmax=52.0281
~ + exp=x/256
~ Esc_input.wabs_filt_norm_whl_spd._3_  nobit 4 unit=bar scmin=-42.9719 scmax=52.0281
~ + exp=x/256
~ Esc_brk.whl_spd_target._0_  nobit 4 unit=bar scmin=-60.2781 scmax=34.7219
~ + exp=x/256
~ Esc_brk.whl_spd_target._1_  nobit 4 unit=bar scmin=-60.2781 scmax=34.7219
~ + exp=x/256
~ Esc_brk.whl_spd_target._2_  nobit 4 unit=bar scmin=-60.2781 scmax=34.7219
~ + exp=x/256
~ Esc_brk.whl_spd_target._3_  nobit 4 unit=bar scmin=-60.2781 scmax=34.7219
~ + exp=x/256
//whl pre est
~ Esc_input.whl_pres_est._0_  nobit 2 unit=bar scmin=-3.45224 scmax=401.548
~ + exp=x/16
~ Esc_input.whl_pres_est._1_  nobit 3 unit=bar scmin=-3.45224 scmax=401.548
~ + exp=x/16
~ Esc_input.whl_pres_est._2_  nobit 4 unit=bar scmin=-3.45224 scmax=401.548
~ + exp=x/16
~ Esc_input.whl_pres_est._3_  nobit 1 unit=bar scmin=-3.45224 scmax=401.548
~ + exp=x/16
//BEGIN_GROUP "ESC Pressure" ENABLED
Esc_brk.pressure_request._0_  nobit 3 unit=bar scmin=-3.45224 scmax=401.548
+ exp=x/16
Esc_brk.pressure_request._1_  nobit 4 unit=bar scmin=-3.45224 scmax=401.548
+ exp=x/16
Esc_brk.pressure_request._2_  nobit 1 unit=bar scmin=-3.45224 scmax=401.548
+ exp=x/16
Esc_brk.pressure_request._3_  nobit 2 unit=bar scmin=-3.45224 scmax=401.548
+ exp=x/16
//END_GROUP
//BEGIN_GROUP "DAQ" DISABLED
~ DAQ4_pWheelLF  nobit 3 unit=bar scmin=-3.45224 scmax=401.548
~ DAQ4_pWheelRF  nobit 4 unit=bar scmin=-3.45224 scmax=401.548
~ DAQ4_pWheelLR  nobit 1 unit=bar scmin=-3.45224 scmax=401.548
~ DAQ4_pWheelRR  nobit 2 unit=bar scmin=-3.45224 scmax=401.548
//END_GROUP
Mue.mu_act_y_s16  nobit 3 unit=Bar scmin=-27.0919 scmax=12.9081
+ exp=x/256
Esc_yrc.driver_steering_intent  nobit 4 unit=Bar scmin=-389.329 scmax=138.628
~ Esc_input.ay_dot  nobit 2 unit=A scmin=-50 scmax=50
~ + exp=x/256
Esc_input.filt_ax  nobit 1 unit=Nm scmin=-67.1351 scmax=8.46918
+ exp=x/256
Esc_input.filt_ay  nobit 2 unit=Nm scmin=-67.1351 scmax=8.46918
+ exp=x/256
Esc_input.filt_swa  nobit 3 unit=Bar scmin=-893.924 scmax=338.783
+ exp=x/8
Esc_input.filt_yr  nobit 4 unit=Bar scmin=-389.329 scmax=138.628
+ exp=x/128
Esc_yrc.swa_yaw  nobit 1 unit=Bar scmin=-389.329 scmax=138.628
+ exp=x/128
Esc_yrc.ay_yaw  nobit 2 unit=Bar scmin=-389.329 scmax=138.628
+ exp=x/128
~ Esc_yrc.peak_yaw  nobit 1 unit=Bar scmin=-389.329 scmax=138.628
~ + exp=x/128/2
~ Esc_yrc.swa_yaw_dot  nobit 2 unit=bar scmin=-800 scmax=800
~ + exp=x/64
~ Esc_input.swa_dot  nobit 2 unit=Bar scmin=-2703.7 scmax=971.171
~ + exp=x/16
~ Esc_input.yr_dot  nobit 3 unit=Bar scmin=-389.329 scmax=138.628
~ + exp=x/64
~ Esc_input.swa_dot_fast  nobit 6 unit=% scansc
~ + exp=x/16
~ Esc_input.yr_dot_fast  nobit 1 unit=bar scmin=-300 scmax=300
~ + exp=x/64
~ Esc_input.sign_ay  nobit 3 unit= scmin=-30 scmax=30
~ Esc_input.sign_yr  nobit 4 unit= scmin=-49.6905 scmax=31.2152
~ Esc_input_process.sa_at_wheel  nobit 3 unit=Bar scmin=-389.329 scmax=138.628
~ + exp=x/128
//YRC Active Thresholds
Esc_yrc.target_yaw_rate_filt  nobit 3 unit=Bar scmin=-389.329 scmax=138.628
+ exp=x/128
Esc_yrc.yaw_plus_active_thr  nobit 4 unit=Bar scmin=-389.329 scmax=138.628
+ exp=x/128
~ Esc_yrc.r_ref  nobit 3 unit=Bar scmin=-389.329 scmax=138.628
~ + exp=x/128
//YRC R_REF Calc
~ Esc_yrc.ay_yaw_coeff  nobit 3 unit=Bar scmin=-389.329 scmax=138.628
~ Esc_yrc.swa_yaw_coeff  nobit 3 unit=Bar scmin=-389.329 scmax=138.628
~ Esc_yrc.raw_drv_req_friction_usage_coeff  nobit 4 unit= scmin=-32768 scmax=32767
~ Esc_yrc.raw_red_friction_usage_coeff  nobit 1 unit= scmin=-32768 scmax=32767
~ Esc_yrc.friction_usage_coeff  nobit 2 unit= scmin=-32768 scmax=32767
~ Esc_yrc.drv_steer_inp_coeff  nobit 3 unit= scmin=-32768 scmax=32767
~ Esc_yrc.drv_req_friction_usage_coeff  nobit 4 unit= scmin=-32768 scmax=32767
//YRC Torque Calculate
~ Esc_yrc.yr_error  nobit 4 unit=bar scmin=-220.193 scmax=179.807
~ + exp=x/128
~ Esc_yrc.yr_error_os  nobit 1 unit=bar scmin=-220.193 scmax=179.807
~ + exp=x/128
~ Esc_yrc.prop_term_l_r_diff  nobit 2 unit=bar scmin=-6924.97 scmax=10372
~ Esc_yrc.int_term_l_r_diff  nobit 3 unit=bar scmin=-6924.97 scmax=10372
~ Esc_yrc.diff_term_l_r_diff  nobit 4 unit=bar scmin=-6924.97 scmax=10372
~ Esc_yrc.yr_l_r_torq_diff_no_limit  nobit 1 unit=bar scmin=-6924.97 scmax=10372
~ Esc_yrc.yr_l_r_torq_diff_yaw  nobit 2 unit=bar scmin=-6924.97 scmax=10372
//All Torque Diff
Esc_yrc.yr_l_r_torq_diff  nobit 1 unit=bar scmin=-5209.91 scmax=12087.1
Esc_yrc.ydc_l_r_torq_diff  nobit 2 unit=bar scmin=-5209.91 scmax=12087.1
~ Arm_control.final_l_r_torq_diff  nobit 4 unit=bar scmin=-5209.91 scmax=12087.1
~ Arm_control.l_r_torq_diff  nobit 4 unit=bar scmin=-5209.91 scmax=12087.1
Esc_sac.sac_us_l_r_torq_diff  nobit 3 unit=bar scmin=-5209.91 scmax=12087.1
//Torque Request
Esc_input.driver_req_axle_torq_front  nobit 4 unit= scmin=-7676.97 scmax=6910.19
Esc_ptc.axle_torque_request._0_  nobit 1 unit= scmin=-7676.97 scmax=6910.19
~ Esc_upc.driving_torq_latched_front  nobit 4 unit= scmin=-6230.6 scmax=8356.56
~ Esc_upc.us_fx_cmd  nobit 1 unit= scmin=-6230.6 scmax=8356.56
Tcs_axle._0_.pt_torque_request  nobit 2 unit= scmin=-7676.97 scmax=6910.19
Esc_input.axle_drving_torq._0_  nobit 3 unit= scmin=-7676.97 scmax=6910.19
Esc_input.driver_req_axle_torq_rear  nobit 4 unit= scmin=-5848.86 scmax=8738.33
Esc_ptc.axle_torque_request._1_  nobit 1 unit= scmin=-5848.86 scmax=8738.33
~ Esc_upc.driving_torq_latched_rear  nobit 2 unit= scmin=-4402.49 scmax=10184.7
Tcs_axle._1_.pt_torque_request  nobit 2 unit= scmin=-5848.86 scmax=8738.33
Esc_input.axle_drving_torq._1_  nobit 3 unit= scmin=-5848.86 scmax=8738.33
//UPC ACtive Thresholds
~ Esc_upc.us_delay_timer  nobit 1 unit= scmin=-30 scmax=30
~ Esc_upc.upc_prop_error  nobit 2 unit=Bar scmin=-389.329 scmax=138.628
~ + exp=x/128
~ Esc_upc.us_entry_error_thr  nobit 3 unit=Bar scmin=-389.329 scmax=138.628
~ + exp=x/128
~ Esc_upc.us_pt_enter_timer  nobit 4 unit= scmin=-30 scmax=30
~ Esc_upc.slot  nobit 1 unit= scmin=-90.4085 scmax=6.22021
~ Esc_upc.control_state  nobit 2 unit= scmin=-90.4085 scmax=6.22021
//SAC Active Thresholds
~ Esc_sac.us_prohibited  bit 3 unit= scmin=0 scmax=255
Esc_sac.us_target_ay_yaw  nobit 4 unit=Bar scmin=-389.329 scmax=138.628
+ exp=x/128
~ Esc_sac.front_max_slip_angle  nobit 1 unit=Bar scmin=-389.329 scmax=138.628
~ + exp=x/128
~ Esc_sac.us_brk_active_wait_timer  nobit 2 unit= scmin=-52.4698 scmax=78.4901
//SAC Torque Calculate
~ Esc_sac.us_prop_term  nobit 4 unit=bar scmin=-6924.97 scmax=10372
~ Esc_sac.us_deri_term  nobit 4 unit=bar scmin=-6924.97 scmax=10372
~ Esc_sac.us_int_term  nobit 4 unit=bar scmin=-6924.97 scmax=10372
~ Esc_sac.sac_us_l_r_torq_diff_raw  nobit 4 unit=bar scmin=-6924.97 scmax=10372
