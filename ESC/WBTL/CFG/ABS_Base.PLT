ABS_veh.ABS_active  bit 1 unit= scmin=0 scmax=255
ABS_in_veh.brake_pedal_current  bit 2 unit=Degrees scansc
//Base infos
//BEGIN_GROUP "B30XP Trace" DISABLED
~ LgtAcce  nobit 3 unit= scmin=-6.15315 scmax=1.92682
~ ActAccrPedlPosn  nobit 4 unit=% scmin=-90.2056 scmax=9.79444
~ BrkPedlSwt  bit 1 unit= scmin=0 scmax=1
~ WCBS_F_FrntAxleDTCTrqReqVld  bit 4 unit=Nm scansc
~ WCBS_F_ReAxleDTCTrqReqVld  bit 1 unit= scmin=0 scmax=1
~ WCBS_EV_F_RegenTarTrqValid  bit 2 unit= scmin=0 scmax=1
~ WCBS_EV_R_RegenTarTrqValid  bit 3 unit= scmin=0 scmax=1
~ PdcuFRegenTrqCur  nobit 4 unit=Nm scmin=-1620.5 scmax=2303.5
~ PdcuFrntAxleTrqReq  nobit 1 unit=Nm scmin=-1620.5 scmax=2303.5
~ WCBS_N_FrntAxleDTCTrqReq  nobit 2 unit=Nm scmin=-1620.5 scmax=2303.5
~ WCBS_EV_F_RegenTarTrq  nobit 3 unit=Nm scmin=-1620.5 scmax=2303.5
~ PdcuFrntAxleTrqAct  nobit 4 unit=Nm scmin=-1620.5 scmax=2303.5
~ PdcuReAxleTrqReq  nobit 1 unit=Nm scmin=-1620.5 scmax=2303.5
~ WCBS_N_ReAxleDTCTrqReq  nobit 2 unit=Nm scmin=-1620.5 scmax=2303.5
~ WCBS_EV_R_RegenTarTrq  nobit 3 unit=Nm scmin=-1620.5 scmax=2303.5
~ PdcuReAxleTrqAct  nobit 4 unit=Nm scmin=-1620.5 scmax=2303.5
//END_GROUP
//State Active Signals
ABS_veh.quick_apply  bit 3 unit= scmin=0 scmax=255
~ Abs_input.Divetrain  nobit 1 unit= scansc
Abs_input.SupplementActive  bit 4 unit= scansc
~ Abs_input.Ref_Cascade_Possible  bit 4 unit=Nm scmin=0 scmax=255
~ ABS_veh.cpc_enable  bit 4 unit= scmin=0 scmax=255
~ ABS_veh.scv_enable  bit 2 unit= scmin=0 scmax=255
//State Bit Signals
ABS_veh.surface_condition  nobit 1 unit=Bar scmin=-149.231 scmax=9.4214
ABS_veh.rear_control_mode:0  bit 2 unit= scansc
~ ABS_veh.rear_control_mode_history:0  bit 1 unit= scansc
~ ABS_veh.flag_sthr_low_speed  bit 2 unit= scmin=0 scmax=255
~ ABS_veh.ra_irc_to_slc  bit 3 unit= scmin=0 scmax=255
~ ABS_veh.flag_sthr_low_speed  bit 3 unit= scmin=0 scmax=255
//Base infos
~ ABS_veh.vmot_eos_spd  nobit 2 unit=km/h scmin=-79.2428 scmax=120.757
~ + exp=x/256*3.6
~ Abs_input.veh_spd_from_ramps  nobit 1 unit=km/h scmin=-79.3347 scmax=120.666
~ + exp=x/256*3.6
Veh_Info.filt_ax  nobit 3 unit= scmin=-109.546 scmax=18.5865
+ exp=x/256
~ Veh_Info.filt_ay  nobit 2 unit= scmin=-19.7906 scmax=3.36924
~ + exp=x/256
~ Abs_input.fi1_mes_ax  nobit 1 unit= scmin=-44.8686 scmax=2.72183
~ + exp=x/256
Abs_input.filt_ax_general  nobit 4 unit= scmin=-45.5327 scmax=3.2591
+ exp=x/256
Abs_input.FiltSwa  nobit 1 unit= scmin=-853.446 scmax=146.554
+ exp=x/8
Abs_input.VehFiltYr  nobit 2 unit= scmin=-123.106 scmax=31.4237
+ exp=x/128
Abs_input.PlgCldPres  nobit 1 unit=Bar scmin=-127.388 scmax=292.612
+ exp=x/16
Abs_input.VabsFiltVehSpd  nobit 3 unit=m/s scmin=-22.012 scmax=33.544
+ exp=x/256
Abs_input.VabsFiltVehSpd  nobit 4 unit=km/h scmin=-79.2428 scmax=120.757
+ exp=x/256*3.6
~ ABS_whl._0_.eh_control  bit 3 unit= scmin=0 scmax=255
~ ABS_whl._1_.eh_control  bit 4 unit= scmin=0 scmax=255
~ ABS_whl._2_.eh_control  bit 1 unit= scmin=0 scmax=255
~ ABS_whl._3_.eh_control  bit 2 unit= scmin=0 scmax=255
~ ABS_whl._0_.whl_surf_jump_state  bit 3 unit= scansc
~ ABS_whl._1_.whl_surf_jump_state  bit 4 unit= scansc
~ ABS_whl._2_.whl_surf_jump_state  bit 1 unit= scansc
~ ABS_whl._3_.whl_surf_jump_state  bit 2 unit= scansc
~ ABS_whl._0_.l2h_detct_by_wacl  bit 2 unit= scmin=0 scmax=255
~ ABS_whl._1_.l2h_detct_by_wacl  bit 3 unit= scmin=0 scmax=255
~ ABS_whl._2_.l2h_detct_by_wacl  bit 4 unit= scmin=0 scmax=255
~ ABS_whl._3_.l2h_detct_by_wacl  bit 1 unit= scmin=0 scmax=255
//Need pulse apply
~ ABS_whl._0_.need_pulse_apply  bit 4 unit= scmin=0 scmax=255
~ ABS_whl._1_.need_pulse_apply  bit 4 unit= scmin=0 scmax=255
~ ABS_whl._2_.need_pulse_apply  bit 2 unit= scmin=-28.8641 scmax=3.08887
~ ABS_whl._3_.need_pulse_apply  bit 3 unit= scmin=-26.8719 scmax=5.08105
//Splt control
~ ABS_whl._0_.splt_control  bit 2 unit= scmin=-163.62 scmax=91.3801
~ ABS_whl._1_.splt_control  bit 3 unit= scmin=-163.62 scmax=91.3801
~ ABS_whl._2_.splt_control  bit 4 unit= scmin=-163.62 scmax=91.3801
~ ABS_whl._3_.splt_control  bit 1 unit= scmin=-163.62 scmax=91.3801
//Number of cycle
~ ABS_whl._0_.number_of_cycle  nobit 4 unit= scmin=-246.024 scmax=8.97554
~ ABS_whl._1_.number_of_cycle  nobit 1 unit= scmin=-246.024 scmax=8.97554
~ ABS_whl._2_.number_of_cycle  nobit 2 unit= scmin=-246.024 scmax=8.97554
~ ABS_whl._3_.number_of_cycle  nobit 3 unit= scmin=-246.024 scmax=8.97554
//Slip Phase
~ ABS_whl._0_.slip_phase  nobit 3 unit=Nm scmin=-121.897 scmax=13.2499
~ ABS_whl._1_.slip_phase  nobit 4 unit=Nm scmin=-121.897 scmax=13.2499
~ ABS_whl._2_.slip_phase  nobit 1 unit=Nm scmin=-121.897 scmax=13.2499
~ ABS_whl._3_.slip_phase  nobit 2 unit=Nm scmin=-121.897 scmax=13.2499
//Slip Slot
ABS_whl._0_.slip_slot  nobit 1 unit=Nm scmin=-56.6108 scmax=260.6
ABS_whl._1_.slip_slot  nobit 2 unit=Nm scmin=-56.6108 scmax=260.6
ABS_whl._2_.slip_slot  nobit 3 unit=Nm scmin=-56.6108 scmax=260.6
ABS_whl._3_.slip_slot  nobit 4 unit=Nm scmin=-56.6108 scmax=260.6
//BEGIN_GROUP "Whl Spd" ENABLED
Abs_input.WabsFiltNormalWhlSpd._0_  nobit 1 unit=km/h scmin=-79.2428 scmax=120.757
+ exp=x/256*3.6
Abs_input.WabsFiltNormalWhlSpd._1_  nobit 2 unit=km/h scmin=-79.2428 scmax=120.757
+ exp=x/256*3.6
Abs_input.WabsFiltNormalWhlSpd._2_  nobit 3 unit=km/h scmin=-79.2428 scmax=120.757
+ exp=x/256*3.6
Abs_input.WabsFiltNormalWhlSpd._3_  nobit 4 unit=km/h scmin=-79.2428 scmax=120.757
+ exp=x/256*3.6
//END_GROUP
//BEGIN_GROUP "Whl Ref Speed" ENABLED
Abs_input.VabsWhlReferSpd._0_  nobit 1 unit=km/h scmin=-79.2428 scmax=120.757
+ exp=x/256*3.6
Abs_input.VabsWhlReferSpd._1_  nobit 2 unit=km/h scmin=-79.2428 scmax=120.757
+ exp=x/256*3.6
Abs_input.VabsWhlReferSpd._2_  nobit 3 unit=km/h scmin=-79.2428 scmax=120.757
+ exp=x/256*3.6
Abs_input.VabsWhlReferSpd._3_  nobit 4 unit=km/h scmin=-79.2428 scmax=120.757
+ exp=x/256*3.6
//END_GROUP
//BEGIN_GROUP "Control State" ENABLED
ABS_whl._0_.control_state._0_:0:-7  nobit 1 unit= scmin=-48.0923 scmax=191.138
ABS_whl._1_.control_state._0_:0:-7  nobit 2 unit= scmin=-48.0923 scmax=191.138
ABS_whl._2_.control_state._0_:0:-7  nobit 3 unit= scmin=-48.0923 scmax=191.138
ABS_whl._3_.control_state._0_:0:-7  nobit 4 unit= scmin=-48.0923 scmax=191.138
//END_GROUP
//BEGIN_GROUP "WhlPres" ENABLED
Abs_input.WhlPresEst._0_  nobit 1 unit=Bar scmin=-127.458 scmax=292.542
+ exp=x/16
Abs_input.WhlPresEst._1_  nobit 2 unit=Bar scmin=-127.458 scmax=292.542
+ exp=x/16
Abs_input.WhlPresEst._2_  nobit 3 unit=Bar scmin=-127.458 scmax=292.542
+ exp=x/16
Abs_input.WhlPresEst._3_  nobit 4 unit=Bar scmin=-127.458 scmax=292.542
+ exp=x/16
//END_GROUP
//BEGIN_GROUP "DAQ Press" DISABLED
~ DAQ4_pWheelLF  nobit 1 unit=Bar scmin=-127.458 scmax=292.542
~ DAQ4_pWheelRF  nobit 2 unit=Bar scmin=-127.458 scmax=292.542
~ DAQ4_pWheelLR  nobit 3 unit=Bar scmin=-127.458 scmax=292.542
~ DAQ4_pWheelRR  nobit 4 unit=Bar scmin=-127.458 scmax=292.542
//END_GROUP
// Slip prcnt actual
ABS_whl._0_.slip_prcnt_actual  nobit 1 unit=Bar scmin=-110.747 scmax=938.873
+ exp=x/1024*100
ABS_whl._1_.slip_prcnt_actual  nobit 2 unit=Bar scmin=-110.747 scmax=938.873
+ exp=x/1024*100
ABS_whl._2_.slip_prcnt_actual  nobit 3 unit=Bar scmin=-110.747 scmax=938.873
+ exp=x/1024*100
ABS_whl._3_.slip_prcnt_actual  nobit 4 unit=Bar scmin=-110.747 scmax=938.873
+ exp=x/1024*100
// Sthr final prcnt
ABS_whl._0_.sthr_final_prcnt  nobit 1 unit=Bar scmin=-110.747 scmax=938.873
+ exp=x/1024*100
ABS_whl._1_.sthr_final_prcnt  nobit 2 unit=Bar scmin=-110.747 scmax=938.873
+ exp=x/1024*100
ABS_whl._2_.sthr_final_prcnt  nobit 3 unit=Bar scmin=-110.747 scmax=938.873
+ exp=x/1024*100
ABS_whl._3_.sthr_final_prcnt  nobit 4 unit=Bar scmin=-110.747 scmax=938.873
+ exp=x/1024*100
// Sthr base prcnt
~ ABS_whl._0_.sthr_base_prcnt  nobit 1 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._1_.sthr_base_prcnt  nobit 2 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._2_.sthr_base_prcnt  nobit 3 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._3_.sthr_base_prcnt  nobit 4 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._0_.sthr_learn_band._0_  nobit 1 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._1_.sthr_learn_band._0_  nobit 2 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._2_.sthr_learn_band._0_  nobit 3 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._3_.sthr_learn_band._0_  nobit 4 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._0_.sthr_learn_band._1_  nobit 1 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._1_.sthr_learn_band._1_  nobit 2 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._2_.sthr_learn_band._1_  nobit 3 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._3_.sthr_learn_band._1_  nobit 4 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._0_.whl_slip_pct_max  nobit 1 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._1_.whl_slip_pct_max  nobit 2 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._2_.whl_slip_pct_max  nobit 3 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._3_.whl_slip_pct_max  nobit 4 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._0_.sthr_dep_desense_prcnt  nobit 1 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._1_.sthr_dep_desense_prcnt  nobit 2 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._2_.sthr_dep_desense_prcnt  nobit 3 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._3_.sthr_dep_desense_prcnt  nobit 4 unit=Bar scmin=-110.747 scmax=938.873
~ + exp=x/1024*100
~ ABS_whl._0_.slp_reg_yaw_stab_cntrl_gain  nobit 3 unit= scmin=-32768 scmax=32767
~ ABS_whl._1_.slp_reg_yaw_stab_cntrl_gain  nobit 4 unit= scmin=-32768 scmax=32767
~ ABS_whl._2_.slp_reg_yaw_stab_cntrl_gain  nobit 1 unit= scmin=-32768 scmax=32767
~ ABS_whl._3_.slp_reg_yaw_stab_cntrl_gain  nobit 2 unit= scmin=-32768 scmax=32767
// Dbi slip target prcnt
~ ABS_whl._0_.dbi_slip_targ_prcnt_s16  nobit 3 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._1_.dbi_slip_targ_prcnt_s16  nobit 4 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._2_.dbi_slip_targ_prcnt_s16  nobit 1 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._3_.dbi_slip_targ_prcnt_s16  nobit 2 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
// Dbi slip err prcnt
~ ABS_whl._0_.dbi_slip_err_prcnt_s16  nobit 3 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._1_.dbi_slip_err_prcnt_s16  nobit 4 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._2_.dbi_slip_err_prcnt_s16  nobit 1 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._3_.dbi_slip_err_prcnt_s16  nobit 2 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._0_.slip_prcnt_ds_dt_s16  nobit 1 unit=Nm scmin=-6.07494 scmax=84.8511
~ + exp=x/1024
~ ABS_whl._1_.slip_prcnt_ds_dt_s16  nobit 1 unit=Nm scmin=-6.07494 scmax=84.8511
~ + exp=x/1024
~ ABS_whl._2_.slip_prcnt_ds_dt_s16  nobit 1 unit=Nm scmin=-6.07494 scmax=84.8511
~ + exp=x/1024
~ ABS_whl._3_.slip_prcnt_ds_dt_s16  nobit 1 unit=Nm scmin=-6.07494 scmax=84.8511
~ + exp=x/1024
// Pulse App Rate
~ ABS_whl._0_.pulse_app_rate  nobit 3 unit=°/s scmin=-82.5482 scmax=440.114
~ + exp=x/16
~ ABS_whl._1_.pulse_app_rate  nobit 4 unit=°/s scmin=-82.5482 scmax=440.114
~ + exp=x/16
~ ABS_whl._2_.pulse_app_rate  nobit 1 unit=°/s scmin=-82.5482 scmax=440.114
~ + exp=x/16
~ ABS_whl._3_.pulse_app_rate  nobit 2 unit=°/s scmin=-82.5482 scmax=440.114
~ + exp=x/16
// Whl AX
~ Abs_input.WabsFiltWhlAx._0_  nobit 1 unit=Bar scmin=-196.745 scmax=3428.83
~ + exp=x/32
~ Abs_input.WabsFiltWhlAx._1_  nobit 2 unit=Bar scmin=-196.745 scmax=3428.83
~ + exp=x/32
~ Abs_input.WabsFiltWhlAx._2_  nobit 3 unit=Bar scmin=-196.745 scmax=3428.83
~ + exp=x/32
~ Abs_input.WabsFiltWhlAx._3_  nobit 4 unit=Bar scmin=-196.745 scmax=3428.83
~ + exp=x/32
// Pulse Dump size
~ ABS_whl._0_.state_pulse_size_s16  nobit 4 unit=Nm scmin=-195.058 scmax=660.717
~ + exp=x/16
~ ABS_whl._1_.state_pulse_size_s16  nobit 1 unit=Nm scmin=-195.058 scmax=660.717
~ + exp=x/16
~ ABS_whl._2_.state_pulse_size_s16  nobit 2 unit=Nm scmin=-195.058 scmax=660.717
~ + exp=x/16
~ ABS_whl._3_.state_pulse_size_s16  nobit 3 unit=Nm scmin=-195.058 scmax=660.717
~ + exp=x/16
// Full Dump
~ ABS_whl._0_.duw_path_in_logic  nobit 3 unit=Nm scmin=-11.4379 scmax=85.8966
~ ABS_whl._1_.duw_path_in_logic  nobit 4 unit=Nm scmin=-11.4379 scmax=85.8966
~ ABS_whl._2_.duw_path_in_logic  nobit 1 unit=Nm scmin=-11.4379 scmax=85.8966
~ ABS_whl._3_.duw_path_in_logic  nobit 2 unit=Nm scmin=-11.4379 scmax=85.8966
~ ABS_whl._0_.full_dump_gradient_s16  nobit 3 unit=Nm scmin=-3.31841 scmax=13.8686
~ + exp=x/1024
~ ABS_whl._1_.full_dump_gradient_s16  nobit 4 unit=Nm scmin=-3.31841 scmax=13.8686
~ + exp=x/1024
~ ABS_whl._2_.full_dump_gradient_s16  nobit 1 unit=Nm scmin=-3.31841 scmax=13.8686
~ + exp=x/1024
~ ABS_whl._3_.full_dump_gradient_s16  nobit 2 unit=Nm scmin=-3.31841 scmax=13.8686
~ + exp=x/1024
// CPC Err
~ ABS_veh.Cpc_Err_Yaw_Int_s16._0_  nobit 5 unit= scansc
~ ABS_veh.Cpc_Err_Yaw_Deriv_s16._0_  nobit 2 unit= scansc
~ ABS_veh.Cpc_Err_Slip_Add_s16._0_  nobit 3 unit= scansc
~ ABS_veh.Cpc_Err_Yaw_Rate_s16._0_  nobit 4 unit= scansc
~ ABS_veh.Cpc_Err_Veh_Ax_Add_s16._0_  nobit 5 unit= scansc
~ ABS_veh.Cpc_Err_Yaw_Deriv_s16._1_  nobit 2 unit= scansc
~ ABS_veh.Cpc_Err_Slip_Add_s16._1_  nobit 3 unit= scansc
~ ABS_veh.Cpc_Err_Yaw_Rate_s16._1_  nobit 4 unit= scansc
~ ABS_veh.Cpc_Err_Veh_Ax_Add_s16._1_  nobit 5 unit= scansc
~ ABS_veh.Cpc_Err_Yaw_Int_s16._1_  nobit 2 unit= scansc
// ContinuousPresControlErr
~ ABS_whl._0_.ContinuousPresControlErr_S16  nobit 2 unit= scmin=-3688.39 scmax=32915.7
~ ABS_whl._1_.ContinuousPresControlErr_S16  nobit 3 unit= scmin=-3688.39 scmax=32915.7
~ ABS_whl._2_.ContinuousPresControlErr_S16  nobit 4 unit= scmin=-3688.39 scmax=32915.7
~ ABS_whl._3_.ContinuousPresControlErr_S16  nobit 1 unit= scmin=-3688.39 scmax=32915.7
// CPC Gradient request
~ ABS_whl._0_.gradient_request_s16  nobit 3 unit= scmin=-2090.11 scmax=8319.06
~ ABS_whl._1_.gradient_request_s16  nobit 4 unit= scmin=-2090.11 scmax=8319.06
~ ABS_whl._2_.gradient_request_s16  nobit 1 unit= scmin=-2090.11 scmax=8319.06
~ ABS_whl._3_.gradient_request_s16  nobit 2 unit= scmin=-2090.11 scmax=8319.06
// CPC info
~ ABS_whl._3_.requested_delta_torque  nobit 4 unit= scansc
~ ABS_whl._3_.delta_wheel_pressure_request  nobit 1 unit= scansc
~ Abs_output.WhlDeltaPressRequest._3_  nobit 2 unit= scansc
~ Abs_output.IsWhlControl._3_  nobit 3 unit= scmin=-45.2017 scmax=209.798
~ Abs_output.IsStepApply._3_  nobit 4 unit= scansc
// CPC PSI
~ ABS_veh.CPC_max_press_RA_calc_s16  nobit 4 unit=Bar scmin=-127.458 scmax=292.542
~ + exp=x/16
~ ABS_veh.PSI_ControlVar_s16  nobit 1 unit= scmin=-2719.07 scmax=886.446
~ ABS_in_veh.yaw_rate_filt_s16  nobit 2 unit= scmin=-107.979 scmax=33.3419
~ + exp=x/128
~ ABS_veh.PSI_int_s16  nobit 3 unit= scmin=-20.56 scmax=7.38092
~ + exp=x/128
~ ABS_in_veh.yaw_rate_deriv_s16  nobit 4 unit= scmin=-1167.29 scmax=432.411
~ + exp=x/64
// Rel time sum
~ ABS_whl._0_.rel_time_sum:0:-1  nobit 3 unit= scmin=-19.584 scmax=1072.03
~ + exp=x/4
~ ABS_whl._1_.rel_time_sum  nobit 4 unit= scmin=-19.584 scmax=1072.03
~ + exp=x/4
~ ABS_whl._2_.rel_time_sum  nobit 1 unit= scmin=-19.584 scmax=1072.03
~ + exp=x/4
~ ABS_whl._3_.rel_time_sum  nobit 2 unit= scmin=-19.584 scmax=1072.03
~ + exp=x/4
//BEGIN_GROUP "Vbox" DISABLED
~ Vbox_Distance  nobit 1 unit=Bar scansc
~ Vbox_TriggerV  nobit 2 unit=Bar scansc
~ Vbox_Velocity  nobit 3 unit=Bar scansc
//END_GROUP
//BEGIN_GROUP "VBox New" DISABLED
~ Brake_Stop_Distance  nobit 3 unit=Metres scansc
~ Brake_Trigger_Velocity  nobit 4 unit=Knots scansc
~ + exp=x*1.85
~ Vel_kph  nobit 1 unit=km/h scansc
//END_GROUP
~ ABS_whl._0_.veh_state_machine_override  nobit 1 unit= scansc
~ ABS_whl._1_.veh_state_machine_override  nobit 1 unit= scansc
~ ABS_whl._2_.veh_state_machine_override  nobit 1 unit= scansc
~ ABS_whl._3_.veh_state_machine_override  nobit 1 unit= scansc
~ ABS_in_whl._0_.ftd_status  nobit 1 unit= scansc
~ ABS_in_whl._1_.ftd_status  nobit 1 unit= scansc
~ ABS_in_whl._2_.ftd_status  nobit 1 unit= scansc
~ ABS_in_whl._3_.ftd_status  nobit 1 unit= scansc
~ ABS_whl._0_.surface_mu_jump_state_trans_u8  nobit 1 unit= scmin=-153.735 scmax=12.9201
~ ABS_whl._1_.surface_mu_jump_state_trans_u8  nobit 2 unit= scmin=-153.735 scmax=12.9201
~ ABS_whl._2_.surface_mu_jump_state_trans_u8  nobit 3 unit= scmin=-153.735 scmax=12.9201
~ ABS_whl._3_.surface_mu_jump_state_trans_u8  nobit 4 unit= scansc
// Last departure press
~ ABS_whl._0_.last_departure_press_s16  nobit 2 unit=Bar scmin=-127.458 scmax=292.542
~ + exp=x/16
~ ABS_whl._1_.last_departure_press_s16  nobit 3 unit=Bar scmin=-127.458 scmax=292.542
~ + exp=x/16
~ ABS_whl._2_.last_departure_press_s16  nobit 4 unit=Bar scmin=-127.458 scmax=292.542
~ + exp=x/16
~ ABS_whl._3_.last_departure_press_s16  nobit 1 unit=Bar scmin=-127.458 scmax=292.542
~ + exp=x/16
// YC Dump perc cpied // ABS dump percent
~ ABS_whl._0_.yc_dump_perc_copied_s16  nobit 2 unit= scmin=-2.06784 scmax=8.62048
~ + exp=x/1024
~ ABS_whl._1_.yc_dump_perc_copied_s16  nobit 3 unit= scmin=-2.06784 scmax=8.62048
~ + exp=x/1024
~ ABS_whl._2_.yc_dump_perc_copied_s16  nobit 4 unit= scmin=-2.06784 scmax=8.62048
~ + exp=x/1024
~ ABS_whl._3_.yc_dump_perc_copied_s16  nobit 1 unit= scmin=-2.06784 scmax=8.62048
~ + exp=x/1024
~ ABS_whl._0_.dump_torq_change_percent  nobit 2 unit= scmin=-2.06784 scmax=8.62048
~ + exp=x/1024
~ ABS_whl._1_.dump_torq_change_percent  nobit 3 unit= scmin=-2.06784 scmax=8.62048
~ + exp=x/1024
~ ABS_whl._2_.dump_torq_change_percent  nobit 4 unit= scmin=-2.06784 scmax=8.62048
~ + exp=x/1024
~ ABS_whl._3_.dump_torq_change_percent  nobit 1 unit= scmin=-2.06784 scmax=8.62048
~ + exp=x/1024
// Transition in SpltRel
~ ABS_whl._0_.t_yc_dump_copy_intrrpt_tim_s16  nobit 1 unit= scmin=-18.1596 scmax=97.1432
~ ABS_whl._1_.t_yc_dump_copy_intrrpt_tim_s16  nobit 2 unit= scmin=-18.1596 scmax=97.1432
~ ABS_whl._2_.t_yc_dump_copy_intrrpt_tim_s16  nobit 3 unit= scmin=-18.1596 scmax=97.1432
~ ABS_whl._3_.t_yc_dump_copy_intrrpt_tim_s16  nobit 4 unit= scmin=-18.1596 scmax=97.1432
// CPC reset dumptime
~ ABS_whl._0_.cpc_reset_dumptime  bit 1 unit= scmin=0 scmax=255
~ ABS_whl._1_.cpc_reset_dumptime  bit 1 unit= scmin=0 scmax=255
~ ABS_whl._2_.cpc_reset_dumptime  bit 1 unit= scmin=0 scmax=255
~ ABS_whl._3_.cpc_reset_dumptime  bit 1 unit= scmin=0 scmax=255
// wheel torque
~ ABS_in_whl._0_.wheel_torque  nobit 3 unit= scmin=-4332.21 scmax=9940.31
~ ABS_in_whl._1_.wheel_torque  nobit 4 unit= scmin=-4332.21 scmax=9940.31
~ ABS_in_whl._2_.wheel_torque  nobit 1 unit= scmin=-4332.21 scmax=9940.31
~ ABS_in_whl._3_.wheel_torque  nobit 2 unit= scmin=-4332.21 scmax=9940.31
// wheel lock torque current
~ ABS_whl._0_.wheel_lock_torque._0_  nobit 3 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._1_.wheel_lock_torque._0_  nobit 4 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._2_.wheel_lock_torque._0_  nobit 1 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._3_.wheel_lock_torque._0_  nobit 2 unit= scmin=-4332.21 scmax=9940.31
// wheel recov torque current
~ ABS_whl._0_.wheel_recov_torque._0_  nobit 3 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._1_.wheel_recov_torque._0_  nobit 4 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._2_.wheel_recov_torque._0_  nobit 1 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._3_.wheel_recov_torque._0_  nobit 2 unit= scmin=-4332.21 scmax=9940.31
// wheel torque band
~ ABS_whl._0_.wheel_torque_band  nobit 3 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._1_.wheel_torque_band  nobit 4 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._2_.wheel_torque_band  nobit 1 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._3_.wheel_torque_band  nobit 2 unit= scmin=-4332.21 scmax=9940.31
// Wheel lock torq overshoot
~ ABS_whl._0_.wheel_lock_torq_overshoot  nobit 3 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._1_.wheel_lock_torq_overshoot  nobit 4 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._2_.wheel_lock_torq_overshoot  nobit 1 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._3_.wheel_lock_torq_overshoot  nobit 2 unit= scmin=-4332.21 scmax=9940.31
