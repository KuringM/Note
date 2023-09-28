ABS_veh.ABS_active  bit 1 unit= scmin=0 scmax=255
ABS_in_veh.brake_pedal_current  bit 2 unit=Degrees scansc
//Base infos
//State Active Signals
~ ABS_veh.surface_condition  nobit 3 unit=Bar scmin=-149.231 scmax=9.4214
~ ABS_veh.quick_apply  bit 3 unit= scmin=0 scmax=255
~ Abs_input.Divetrain  nobit 1 unit= scansc
~ Abs_input.SupplementActive  bit 3 unit= scansc
~ Abs_input.Ref_Cascade_Possible  bit 4 unit=Nm scmin=0 scmax=255
~ ABS_veh.cpc_enable  bit 1 unit= scmin=0 scmax=255
~ ABS_veh.scv_enable  bit 2 unit= scmin=0 scmax=255
~ ABS_whl._0_.eh_control  bit 3 unit= scmin=0 scmax=255
~ ABS_whl._1_.eh_control  bit 4 unit= scmin=0 scmax=255
~ ABS_whl._2_.eh_control  bit 1 unit= scmin=0 scmax=255
~ ABS_whl._3_.eh_control  bit 2 unit= scmin=0 scmax=255
ABS_whl._0_.whl_surf_jump_state  bit 3 unit= scansc
ABS_whl._1_.whl_surf_jump_state  bit 4 unit= scansc
~ ABS_whl._2_.whl_surf_jump_state  bit 3 unit= scansc
~ ABS_whl._3_.whl_surf_jump_state  bit 4 unit= scansc
ABS_whl._0_.l2h_detct_by_wacl  bit 1 unit= scmin=0 scmax=255
ABS_whl._1_.l2h_detct_by_wacl  bit 2 unit= scmin=0 scmax=255
~ ABS_whl._2_.l2h_detct_by_wacl  bit 1 unit= scmin=0 scmax=255
~ ABS_whl._3_.l2h_detct_by_wacl  bit 1 unit= scmin=0 scmax=255
~ ABS_veh.rear_control_mode:0  bit 4 unit= scansc
~ ABS_veh.rear_control_mode_history:0  bit 1 unit= scansc
~ ABS_veh.flag_sthr_low_speed  bit 2 unit= scmin=0 scmax=255
~ ABS_veh.ra_irc_to_slc  bit 2 unit= scmin=0 scmax=255
//State Bit Signals
~ Abs_input.VabsFiltVehSpd  nobit 3 unit=m/s scmin=-22.0805 scmax=33.4432
~ + exp=x/256
~ Abs_input.VabsFiltVehSpd  nobit 4 unit=km/h scmin=-79.3347 scmax=120.666
~ + exp=x/256*3.6
~ ABS_veh.vmot_eos_spd  nobit 2 unit=km/h scmin=-79.2428 scmax=120.757
~ + exp=x/256*3.6
~ Abs_input.veh_spd_from_ramps  nobit 1 unit=km/h scmin=-79.3347 scmax=120.666
~ + exp=x/256*3.6
~ Veh_Info.filt_ax  nobit 1 unit= scmin=-118.191 scmax=9.94093
~ + exp=x/256
~ Veh_Info.filt_ay  nobit 2 unit= scmin=-19.7906 scmax=3.36924
~ + exp=x/256
~ Abs_input.fi1_mes_ax  nobit 4 unit= scmin=-44.8686 scmax=2.72183
~ + exp=x/256
~ Abs_input.FiltSwa  nobit 1 unit= scmin=-800.242 scmax=199.758
~ + exp=x/8
~ Abs_input.VehFiltYr  nobit 2 unit= scmin=-123.106 scmax=31.4237
~ + exp=x/128
~ Abs_input.PlgCldPres  nobit 3 unit=Bar scmin=-70 scmax=350
~ + exp=x/16
//Base infos
//BEGIN_GROUP "Whl Spd" DISABLED
~ Abs_input.WabsFiltNormalWhlSpd._0_  nobit 3 unit=km/h scmin=-79.2428 scmax=120.757
~ + exp=x/256*3.6
~ Abs_input.WabsFiltNormalWhlSpd._1_  nobit 4 unit=km/h scmin=-79.2428 scmax=120.757
~ + exp=x/256*3.6
~ Abs_input.WabsFiltNormalWhlSpd._2_  nobit 1 unit=km/h scmin=-79.2428 scmax=120.757
~ + exp=x/256*3.6
~ Abs_input.WabsFiltNormalWhlSpd._3_  nobit 2 unit=km/h scmin=-79.2428 scmax=120.757
~ + exp=x/256*3.6
//END_GROUP
//BEGIN_GROUP "Whl Ref Speed" DISABLED
~ Abs_input.VabsWhlReferSpd._0_  nobit 3 unit=km/h scmin=-79.2428 scmax=120.757
~ + exp=x/256*3.6
~ Abs_input.VabsWhlReferSpd._1_  nobit 4 unit=km/h scmin=-79.2428 scmax=120.757
~ + exp=x/256*3.6
~ Abs_input.VabsWhlReferSpd._2_  nobit 1 unit=km/h scmin=-79.2428 scmax=120.757
~ + exp=x/256*3.6
~ Abs_input.VabsWhlReferSpd._3_  nobit 2 unit=km/h scmin=-79.2428 scmax=120.757
~ + exp=x/256*3.6
//END_GROUP
//BEGIN_GROUP "Number of cycle" DISABLED
~ ABS_whl._0_.number_of_cycle  nobit 4 unit= scmin=-246.024 scmax=8.97554
~ ABS_whl._1_.number_of_cycle  nobit 1 unit= scmin=-246.024 scmax=8.97554
~ ABS_whl._2_.number_of_cycle  nobit 2 unit= scmin=-246.024 scmax=8.97554
~ ABS_whl._3_.number_of_cycle  nobit 3 unit= scmin=-246.024 scmax=8.97554
//END_GROUP
//BEGIN_GROUP "Control State" DISABLED
~ ABS_whl._0_.control_state._0_:0:-7  nobit 3 unit= scmin=-47.5094 scmax=108.657
~ ABS_whl._1_.control_state._0_:0:-7  nobit 4 unit= scmin=-47.5094 scmax=108.657
~ ABS_whl._2_.control_state._0_:0:-7  nobit 1 unit= scmin=-47.5094 scmax=108.657
~ ABS_whl._3_.control_state._0_:0:-7  nobit 2 unit= scmin=-47.5094 scmax=108.657
//END_GROUP
//BEGIN_GROUP "WhlPres" DISABLED
~ Abs_input.WhlPresEst._0_  nobit 3 unit=Bar scmin=-127.458 scmax=292.542
~ + exp=x/16
~ Abs_input.WhlPresEst._1_  nobit 4 unit=Bar scmin=-127.458 scmax=292.542
~ + exp=x/16
~ Abs_input.WhlPresEst._2_  nobit 1 unit=Bar scmin=-127.458 scmax=292.542
~ + exp=x/16
~ Abs_input.WhlPresEst._3_  nobit 2 unit=Bar scmin=-127.458 scmax=292.542
~ + exp=x/16
//END_GROUP
//BEGIN_GROUP "DAQ Press" DISABLED
~ DAQ4_pWheelLF  nobit 4 unit=Bar scmin=-127.458 scmax=292.542
~ DAQ4_pWheelRF  nobit 1 unit=Bar scmin=-127.458 scmax=292.542
~ DAQ4_pWheelLR  nobit 2 unit=Bar scmin=-127.458 scmax=292.542
~ DAQ4_pWheelRR  nobit 3 unit=Bar scmin=-127.458 scmax=292.542
//END_GROUP
//BEGIN_GROUP "Slip prcnt actual" DISABLED
~ ABS_whl._0_.slip_prcnt_actual  nobit 2 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._1_.slip_prcnt_actual  nobit 3 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._2_.slip_prcnt_actual  nobit 4 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._3_.slip_prcnt_actual  nobit 1 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
//END_GROUP
//BEGIN_GROUP "Sthr final prcnt" DISABLED
~ ABS_whl._0_.sthr_final_prcnt  nobit 3 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._1_.sthr_final_prcnt  nobit 3 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._2_.sthr_final_prcnt  nobit 3 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._3_.sthr_final_prcnt  nobit 3 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
//END_GROUP
//BEGIN_GROUP "Sthr base prcnt" DISABLED
~ ABS_whl._0_.sthr_base_prcnt  nobit 3 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._1_.sthr_base_prcnt  nobit 3 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._2_.sthr_base_prcnt  nobit 3 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._3_.sthr_base_prcnt  nobit 3 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
//END_GROUP
//BEGIN_GROUP "Dbi slip target prcnt" DISABLED
~ ABS_whl._0_.dbi_slip_targ_prcnt_s16  nobit 2 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._1_.dbi_slip_targ_prcnt_s16  nobit 3 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._2_.dbi_slip_targ_prcnt_s16  nobit 4 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._3_.dbi_slip_targ_prcnt_s16  nobit 1 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
//END_GROUP
//BEGIN_GROUP "Dbi slip err prcnt" DISABLED
~ ABS_whl._0_.dbi_slip_err_prcnt_s16  nobit 2 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._1_.dbi_slip_err_prcnt_s16  nobit 3 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._2_.dbi_slip_err_prcnt_s16  nobit 4 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
~ ABS_whl._3_.dbi_slip_err_prcnt_s16  nobit 1 unit=Bar scmin=-11.3017 scmax=189.603
~ + exp=x/1024*100
//END_GROUP
//BEGIN_GROUP "Pulse App Rate" DISABLED
~ ABS_whl._0_.pulse_app_rate  nobit 2 unit=°/s scmin=-128.684 scmax=393.978
~ + exp=x/16
~ ABS_whl._1_.pulse_app_rate  nobit 3 unit=°/s scmin=-128.684 scmax=393.978
~ + exp=x/16
~ ABS_whl._2_.pulse_app_rate  nobit 4 unit=°/s scmin=-128.684 scmax=393.978
~ + exp=x/16
~ ABS_whl._3_.pulse_app_rate  nobit 1 unit=°/s scmin=-128.684 scmax=393.978
~ + exp=x/16
//END_GROUP
//BEGIN_GROUP "Adjusted Veh Decel" DISABLED
~ ABS_whl._0_.split_adjusted_veh_decel  nobit 3 unit= scmin=-103.144 scmax=24.9879
~ + exp=x/256
~ ABS_whl._1_.split_adjusted_veh_decel  nobit 4 unit= scmin=-103.144 scmax=24.9879
~ + exp=x/256
~ ABS_whl._2_.split_adjusted_veh_decel  nobit 1 unit= scmin=-103.144 scmax=24.9879
~ + exp=x/256
~ ABS_whl._3_.split_adjusted_veh_decel  nobit 2 unit= scmin=-103.144 scmax=24.9879
~ + exp=x/256
//END_GROUP
//BEGIN_GROUP "Whl AX" DISABLED
~ Abs_input.WabsFiltWhlAx._0_  nobit 4 unit=Bar scmin=-196.745 scmax=3428.83
~ + exp=x/32
~ Abs_input.WabsFiltWhlAx._1_  nobit 1 unit=Bar scmin=-196.745 scmax=3428.83
~ + exp=x/32
~ Abs_input.WabsFiltWhlAx._2_  nobit 2 unit=Bar scmin=-196.745 scmax=3428.83
~ + exp=x/32
~ Abs_input.WabsFiltWhlAx._3_  nobit 3 unit=Bar scmin=-196.745 scmax=3428.83
~ + exp=x/32
//END_GROUP
//BEGIN_GROUP "Pulse Dump size" DISABLED
~ ABS_whl._0_.state_pulse_size_s16  nobit 4 unit=Nm scmin=-195.058 scmax=660.717
~ + exp=x/16
~ ABS_whl._1_.state_pulse_size_s16  nobit 1 unit=Nm scmin=-195.058 scmax=660.717
~ + exp=x/16
~ ABS_whl._2_.state_pulse_size_s16  nobit 2 unit=Nm scmin=-195.058 scmax=660.717
~ + exp=x/16
~ ABS_whl._3_.state_pulse_size_s16  nobit 3 unit=Nm scmin=-195.058 scmax=660.717
~ + exp=x/16
//END_GROUP
//BEGIN_GROUP "Slip Phase" DISABLED
~ ABS_whl._0_.slip_phase  nobit 3 unit=Nm scmin=-121.897 scmax=13.2499
~ ABS_whl._1_.slip_phase  nobit 4 unit=Nm scmin=-121.897 scmax=13.2499
~ ABS_whl._2_.slip_phase  nobit 1 unit=Nm scmin=-121.897 scmax=13.2499
~ ABS_whl._3_.slip_phase  nobit 2 unit=Nm scmin=-121.897 scmax=13.2499
//END_GROUP
~ ABS_whl._0_.slip_prcnt_ds_dt_s16  nobit 1 unit=Nm scmin=-6.07494 scmax=84.8511
~ + exp=x/1024
~ ABS_whl._1_.slip_prcnt_ds_dt_s16  nobit 1 unit=Nm scmin=-6.07494 scmax=84.8511
~ + exp=x/1024
~ ABS_whl._2_.slip_prcnt_ds_dt_s16  nobit 1 unit=Nm scmin=-6.07494 scmax=84.8511
~ + exp=x/1024
~ ABS_whl._3_.slip_prcnt_ds_dt_s16  nobit 1 unit=Nm scmin=-6.07494 scmax=84.8511
~ + exp=x/1024
//BEGIN_GROUP "Slip Slot" DISABLED
~ ABS_whl._0_.slip_slot  nobit 4 unit=Nm scmin=-17.7916 scmax=244.745
~ ABS_whl._1_.slip_slot  nobit 5 unit=Nm scansc
~ ABS_whl._2_.slip_slot  nobit 2 unit=Nm scansc
~ ABS_whl._3_.slip_slot  nobit 3 unit=Nm scansc
//END_GROUP
//BEGIN_GROUP "Full Dump" DISABLED
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
//END_GROUP
//BEGIN_GROUP "CPC Err" DISABLED
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
//END_GROUP
//BEGIN_GROUP "ContinuousPresControlErr" DISABLED
~ ABS_whl._0_.ContinuousPresControlErr_S16  nobit 2 unit= scmin=-3688.39 scmax=32915.7
~ ABS_whl._1_.ContinuousPresControlErr_S16  nobit 3 unit= scmin=-3688.39 scmax=32915.7
~ ABS_whl._2_.ContinuousPresControlErr_S16  nobit 4 unit= scmin=-3688.39 scmax=32915.7
~ ABS_whl._3_.ContinuousPresControlErr_S16  nobit 1 unit= scmin=-3688.39 scmax=32915.7
//END_GROUP
//BEGIN_GROUP "CPC Gradient request" DISABLED
~ ABS_whl._0_.gradient_request_s16  nobit 4 unit= scmin=-2090.11 scmax=8319.06
~ ABS_whl._1_.gradient_request_s16  nobit 1 unit= scmin=-2090.11 scmax=8319.06
~ ABS_whl._2_.gradient_request_s16  nobit 2 unit= scmin=-2090.11 scmax=8319.06
~ ABS_whl._3_.gradient_request_s16  nobit 3 unit= scmin=-2090.11 scmax=8319.06
//END_GROUP
//BEGIN_GROUP "Need pulse apply" DISABLED
~ ABS_whl._0_.need_pulse_apply  bit 4 unit= scmin=0 scmax=255
~ ABS_whl._1_.need_pulse_apply  bit 1 unit= scmin=0 scmax=255
~ ABS_whl._2_.need_pulse_apply  bit 2 unit= scmin=-28.8641 scmax=3.08887
~ ABS_whl._3_.need_pulse_apply  bit 3 unit= scmin=-26.8719 scmax=5.08105
//END_GROUP
~ ABS_whl._0_.splt_control  bit 2 unit= scmin=-163.62 scmax=91.3801
~ ABS_whl._1_.splt_control  bit 3 unit= scmin=-163.62 scmax=91.3801
~ ABS_whl._2_.splt_control  bit 4 unit= scmin=-163.62 scmax=91.3801
~ ABS_whl._3_.splt_control  bit 1 unit= scmin=-163.62 scmax=91.3801
//BEGIN_GROUP "CPC info" DISABLED
~ ABS_whl._3_.requested_delta_torque  nobit 4 unit= scansc
~ ABS_whl._3_.delta_wheel_pressure_request  nobit 1 unit= scansc
~ Abs_output.WhlDeltaPressRequest._3_  nobit 2 unit= scansc
~ Abs_output.IsWhlControl._3_  nobit 3 unit= scmin=-45.2017 scmax=209.798
~ Abs_output.IsStepApply._3_  nobit 4 unit= scansc
//END_GROUP
//BEGIN_GROUP "CPC PSI" DISABLED
~ ABS_veh.CPC_max_press_RA_calc_s16  nobit 4 unit=Bar scmin=-127.458 scmax=292.542
~ + exp=x/16
~ ABS_veh.PSI_ControlVar_s16  nobit 1 unit= scmin=-2719.07 scmax=886.446
~ ABS_in_veh.yaw_rate_filt_s16  nobit 2 unit= scmin=-107.979 scmax=33.3419
~ + exp=x/128
~ ABS_veh.PSI_int_s16  nobit 3 unit= scmin=-20.56 scmax=7.38092
~ + exp=x/128
~ ABS_in_veh.yaw_rate_deriv_s16  nobit 4 unit= scmin=-1167.29 scmax=432.411
~ + exp=x/64
//END_GROUP
//BEGIN_GROUP "Rel time sum" DISABLED
~ ABS_whl._0_.rel_time_sum:0:-1  nobit 3 unit= scmin=-19.584 scmax=1072.03
~ + exp=x/4
~ ABS_whl._1_.rel_time_sum  nobit 4 unit= scmin=-19.584 scmax=1072.03
~ + exp=x/4
~ ABS_whl._2_.rel_time_sum  nobit 1 unit= scmin=-19.584 scmax=1072.03
~ + exp=x/4
~ ABS_whl._3_.rel_time_sum  nobit 2 unit= scmin=-19.584 scmax=1072.03
~ + exp=x/4
//END_GROUP
//BEGIN_GROUP "Vbox" DISABLED
~ Vbox_Distance  nobit 2 unit=Bar scansc
~ Vbox_TriggerV  nobit 3 unit=Bar scansc
~ Vbox_Velocity  nobit 4 unit=Bar scansc
//END_GROUP
//BEGIN_GROUP "Last departure press" DISABLED
~ ABS_whl._0_.last_departure_press_s16  nobit 2 unit=Bar scmin=-127.458 scmax=292.542
~ + exp=x/16
~ ABS_whl._1_.last_departure_press_s16  nobit 3 unit=Bar scmin=-127.458 scmax=292.542
~ + exp=x/16
~ ABS_whl._2_.last_departure_press_s16  nobit 4 unit=Bar scmin=-127.458 scmax=292.542
~ + exp=x/16
~ ABS_whl._3_.last_departure_press_s16  nobit 1 unit=Bar scmin=-127.458 scmax=292.542
~ + exp=x/16
//END_GROUP
//BEGIN_GROUP "YC Dump perc cpied // ABS dump percent" DISABLED
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
//END_GROUP
//BEGIN_GROUP "Transition in SpltRel" DISABLED
~ ABS_whl._0_.t_yc_dump_copy_intrrpt_tim_s16  nobit 1 unit= scmin=-18.1596 scmax=97.1432
~ ABS_whl._1_.t_yc_dump_copy_intrrpt_tim_s16  nobit 2 unit= scmin=-18.1596 scmax=97.1432
~ ABS_whl._2_.t_yc_dump_copy_intrrpt_tim_s16  nobit 3 unit= scmin=-18.1596 scmax=97.1432
~ ABS_whl._3_.t_yc_dump_copy_intrrpt_tim_s16  nobit 4 unit= scmin=-18.1596 scmax=97.1432
//END_GROUP
//BEGIN_GROUP "CPC reset dumptime" DISABLED
~ ABS_whl._0_.cpc_reset_dumptime  bit 1 unit= scmin=0 scmax=255
~ ABS_whl._1_.cpc_reset_dumptime  bit 1 unit= scmin=0 scmax=255
~ ABS_whl._2_.cpc_reset_dumptime  bit 1 unit= scmin=0 scmax=255
~ ABS_whl._3_.cpc_reset_dumptime  bit 1 unit= scmin=0 scmax=255
//END_GROUP
//BEGIN_GROUP "wheel torque" DISABLED
~ ABS_in_whl._0_.wheel_torque  nobit 3 unit= scmin=-4332.21 scmax=9940.31
~ ABS_in_whl._1_.wheel_torque  nobit 4 unit= scmin=-4332.21 scmax=9940.31
~ ABS_in_whl._2_.wheel_torque  nobit 1 unit= scmin=-4332.21 scmax=9940.31
~ ABS_in_whl._3_.wheel_torque  nobit 2 unit= scmin=-4332.21 scmax=9940.31
//END_GROUP
//BEGIN_GROUP "wheel lock torque current" DISABLED
~ ABS_whl._0_.wheel_lock_torque._0_  nobit 3 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._1_.wheel_lock_torque._0_  nobit 4 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._2_.wheel_lock_torque._0_  nobit 1 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._3_.wheel_lock_torque._0_  nobit 2 unit= scmin=-4332.21 scmax=9940.31
//END_GROUP
//BEGIN_GROUP "wheel recov torque current" DISABLED
~ ABS_whl._0_.wheel_recov_torque._0_  nobit 3 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._1_.wheel_recov_torque._0_  nobit 4 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._2_.wheel_recov_torque._0_  nobit 1 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._3_.wheel_recov_torque._0_  nobit 2 unit= scmin=-4332.21 scmax=9940.31
//END_GROUP
//BEGIN_GROUP "wheel torque band" DISABLED
~ ABS_whl._0_.wheel_torque_band  nobit 3 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._1_.wheel_torque_band  nobit 4 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._2_.wheel_torque_band  nobit 1 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._3_.wheel_torque_band  nobit 2 unit= scmin=-4332.21 scmax=9940.31
//END_GROUP
//BEGIN_GROUP "Wheel lock torq overshoot" DISABLED
~ ABS_whl._0_.wheel_lock_torq_overshoot  nobit 3 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._1_.wheel_lock_torq_overshoot  nobit 4 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._2_.wheel_lock_torq_overshoot  nobit 1 unit= scmin=-4332.21 scmax=9940.31
~ ABS_whl._3_.wheel_lock_torq_overshoot  nobit 2 unit= scmin=-4332.21 scmax=9940.31
//END_GROUP
