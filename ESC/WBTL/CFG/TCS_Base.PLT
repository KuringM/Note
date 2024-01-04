//B30XP Trace
AbsActv  bit 1 unit= scmin=0 scmax=1
~ PdcuFrntAxleTrqReq  nobit 1 unit= scmin=-15904.6 scmax=10565.7
~ WCBS_N_FrntAxleFastReductionTrqReq  nobit 2 unit= scmin=-15904.6 scmax=10565.7
~ PdcuFrntAxleTrqAct  nobit 3 unit= scmin=-15904.6 scmax=10565.7
~ PdcuReAxleTrqReq  nobit 4 unit= scmin=-2443.97 scmax=5704.72
~ WCBS_N_ReAxleFastReductionTrqReq  nobit 1 unit= scmin=-2443.97 scmax=5704.72
~ PdcuReAxleTrqAct  nobit 2 unit= scmin=-2443.97 scmax=5704.72
BrkPedlSwt  bit 1 unit= scmin=0 scmax=1
Tcs_veh.vehicle_active  bit 2 unit=Bar scmin=-243.564 scmax=11.4364
//Base infos
//State Active Signals
~ Tcs_axle._0_.axle_active  bit 3 unit= scmin=0 scmax=255
~ Tcs_axle._1_.axle_active  bit 4 unit= scmin=0 scmax=255
Tcs_axle._0_.powertrain_active  bit 3 unit= scmin=0 scmax=255
Tcs_axle._1_.powertrain_active  bit 4 unit= scmin=0 scmax=255
~ Tcs_axle._0_.axle_brk_active  bit 3 unit= scmin=0 scmax=255
~ Tcs_axle._1_.axle_brk_active  bit 4 unit= scmin=0 scmax=255
~ Tcs_input.ah_or_hh_veh_control  nobit 1 unit= scmin=-62.3608 scmax=192.639
~ Tcs_input_process.ah_or_hh_delay  nobit 2 unit= scmin=-4245.52 scmax=139.056
~ Tcs_input.axle_shudd_detect._0_  nobit 1 unit= scmin=0 scmax=255
~ Tcs_input.axle_shudd_detect._1_  nobit 2 unit= scmin=0 scmax=255
~ Tcs_input.axle_shudd_confidence._0_  nobit 3 unit= scmin=-32768 scmax=32767
~ Tcs_input.axle_shudd_confidence._1_  nobit 4 unit= scmin=-32768 scmax=32767
//State Bit Signals
Tcs_input.gear_position  nobit 1 unit= scmin=-248.826 scmax=6.17433
~ Tcs_input.drivetrain  nobit 2 unit=Nm scmin=0 scmax=255
~ Tcs_input.control_mode  nobit 1 unit=Nm scmin=0 scmax=255
~ Tcs_input.first_drive_axle  nobit 4 unit=Nm scmin=0 scmax=255
~ Tcs_input.last_drive_axle  nobit 5 unit=Nm scmin=0 scmax=255
Tcs_axle._0_.pt_torq_request_mode  nobit 2 unit= scmin=-41.5196 scmax=4.60152
Tcs_axle._1_.pt_torq_request_mode  nobit 3 unit= scmin=-41.5196 scmax=4.60152
Tcs_axle._0_.gain_scheduling  nobit 4 unit= scmin=-112.982 scmax=5.66157
Tcs_axle._1_.gain_scheduling  nobit 1 unit= scmin=-112.982 scmax=5.66157
~ Tcs_veh.slip_state  nobit 2 unit= scmin=-58.5692 scmax=6.26267
Tcs_axle._0_.slip_state  nobit 2 unit= scmin=-58.5692 scmax=6.26267
Tcs_axle._1_.slip_state  nobit 3 unit= scmin=-58.5692 scmax=6.26267
//Base infos
Tcs_input.gas_pedal_position  nobit 4 unit= scmin=-11.4381 scmax=4.90572
+ exp=X/1024
~ Tcs_axle._0_.slip_state  nobit 4 unit= scmin=-62.0622 scmax=10.1545
~ Tcs_axle._1_.slip_state  nobit 1 unit= scmin=-62.0622 scmax=10.1545
~ Tcs_veh.slip_state  nobit 2 unit= scmin=-62.0622 scmax=10.1545
//I Stable
Tcs_axle._0_.noslip_time  nobit 1 unit= scmin=-52556.7 scmax=12978.3
~ Tcs_axle._1_.noslip_time  nobit 2 unit= scmin=-32768 scmax=32767
Tcs_axle._0_.noslip_init_restore  nobit 2 unit= scmin=-58.5692 scmax=6.26267
Tcs_axle._1_.noslip_init_restore  nobit 3 unit= scmin=-58.5692 scmax=6.26267
//Veh info
~ Veh_Info.filt_ax  nobit 1 unit= scmin=-45.4324 scmax=8.78308
~ + exp=X/256
~ Veh_Info.filt_ay  nobit 2 unit= scmin=-44.1489 scmax=7.85745
~ + exp=X/256
~ Veh_Info.filt_yr  nobit 2 unit=Bar scmin=-209.265 scmax=44.5316
~ + exp=x/128
~ Veh_Info.filt_swa  nobit 3 unit=Bar scmin=-677.061 scmax=168.417
~ + exp=x/8
~ Tcs_input.veh_ax  nobit 1 unit= scmin=-45.4324 scmax=8.78308
~ + exp=X/256
//Ice torq
~ Tcs_input.driver_req_axle_torq  nobit 4 unit= scmin=-15904.6 scmax=10565.7
~ Tcs_veh.pt_torque_request  nobit 2 unit= scmin=-15904.6 scmax=10565.7
~ Tcs_input.axle_driving_torq  nobit 1 unit=Nm scmin=-4996.65 scmax=3427.51
//BEGIN_GROUP "Front Axle Torq" ENABLED
Tcs_input.driver_req_axle_torq._0_  nobit 4 unit= scmin=-15904.6 scmax=10565.7
Tcs_axle._0_.pt_torque_request  nobit 1 unit= scmin=-15904.6 scmax=10565.7
Tcs_input.axle_driving_torq._0_  nobit 2 unit= scmin=-15904.6 scmax=10565.7
//END_GROUP
//BEGIN_GROUP "Rear Axle Torq" ENABLED
Tcs_input.driver_req_axle_torq._1_  nobit 4 unit= scmin=-5691.53 scmax=8524.2
Tcs_axle._1_.pt_torque_request  nobit 1 unit= scmin=-5691.53 scmax=8524.2
Tcs_input.axle_driving_torq._1_  nobit 2 unit= scmin=-5691.53 scmax=8524.2
//END_GROUP
//Front Axle PID Term
Tcs_axle._0_.pt_delta_integral_term  nobit 3 unit= scmin=-11239 scmax=11151.7
+ exp=x/256
Tcs_axle._0_.pt_integral_term  nobit 4 unit= scmin=-11239 scmax=11151.7
+ exp=x/256
Tcs_axle._0_.pt_derivative_term  nobit 1 unit= scmin=-11239 scmax=11151.7
Tcs_axle._0_.pt_proportional_term  nobit 2 unit= scmin=-11239 scmax=11151.7
//Rear Axle PID Term
~ Tcs_axle._1_.pt_delta_integral_term  nobit 3 unit= scmin=-2831.59 scmax=6548.92
~ + exp=x/256
~ Tcs_axle._1_.pt_integral_term  nobit 4 unit= scmin=-2831.59 scmax=6548.92
~ + exp=x/256
~ Tcs_axle._1_.pt_derivative_term  nobit 1 unit= scmin=-2831.59 scmax=6548.92
~ Tcs_axle._1_.pt_proportional_term  nobit 2 unit= scmin=-2831.59 scmax=6548.92
//Front Pin term
~ Tcs_pin._0_.delta_integral_term  nobit 4 unit= scmin=-1.62053e+006 scmax=2.28218e+006
~ + exp=x/256
~ Tcs_pin._0_.derivative_term  nobit 1 unit= scmin=-1.62053e+006 scmax=2.28218e+006
~ + exp=x
~ Tcs_pin._0_.integral_term  nobit 2 unit= scmin=-1.62053e+006 scmax=2.28218e+006
~ + exp=x/256
~ Tcs_pin._0_.pid_term  nobit 3 unit= scmin=-2861.11 scmax=7725.37
~ + exp=x
~ Tcs_pin._0_.proportional_term  nobit 4 unit= scmin=-2861.11 scmax=7725.37
~ + exp=x
~ Tcs_input.engine_speed  nobit 3 unit=Bar scmin=-1853.03 scmax=16465.6
~ Tcs_input.engine_speed._0_  nobit 3 unit=Bar scmin=-1853.03 scmax=16465.6
~ Tcs_input.engine_speed._1_  nobit 4 unit= scmin=-0.803108 scmax=7.2021
Tcs_input.veh_spd  nobit 3 unit=km/h scmin=-52.2774 scmax=473.058
+ exp=x/256*3.6
Tcs_input.veh_spd  nobit 4 unit=m/s scmin=-14.5215 scmax=131.405
+ exp=x/256
//BEGIN_GROUP "Norm whl spd" ENABLED
Tcs_input.norm_whl_spd._0_  nobit 1 unit=m/s scmin=-14.5215 scmax=131.405
+ exp=x/256
Tcs_input.norm_whl_spd._1_  nobit 2 unit=m/s scmin=-14.5215 scmax=131.405
+ exp=x/256
Tcs_input.norm_whl_spd._2_  nobit 3 unit=m/s scmin=-14.5215 scmax=131.405
+ exp=x/256
Tcs_input.norm_whl_spd._3_  nobit 4 unit=m/s scmin=-14.5215 scmax=131.405
+ exp=x/256
//END_GROUP
//BEGIN_GROUP "Engine Target spd" ENABLED
Tcs_whl._0_.engine_target_spd  nobit 1 unit=m/s scmin=-14.5215 scmax=131.405
+ exp=x/256
Tcs_whl._1_.engine_target_spd  nobit 2 unit=m/s scmin=-14.5215 scmax=131.405
+ exp=x/256
Tcs_whl._2_.engine_target_spd  nobit 3 unit=m/s scmin=-14.5215 scmax=131.405
+ exp=x/256
Tcs_whl._3_.engine_target_spd  nobit 4 unit=m/s scmin=-14.5215 scmax=131.405
+ exp=x/256
//END_GROUP
//BEGIN_GROUP "Brake Target Spd" ENABLED
Tcs_whl._0_.brake_target_spd  nobit 1 unit=m/s scmin=-14.5215 scmax=131.405
+ exp=x/256
Tcs_whl._1_.brake_target_spd  nobit 2 unit=m/s scmin=-14.5215 scmax=131.405
+ exp=x/256
Tcs_whl._2_.brake_target_spd  nobit 3 unit=m/s scmin=-14.5215 scmax=131.405
+ exp=x/256
Tcs_whl._3_.brake_target_spd  nobit 4 unit=m/s scmin=-14.5215 scmax=131.405
+ exp=x/256
//END_GROUP
//BEGIN_GROUP "Whl ref spd" DISABLED
~ Tcs_input.whl_ref_spd._0_  nobit 1 unit=m/s scmin=-14.5215 scmax=131.405
~ + exp=x/256
~ Tcs_input.whl_ref_spd._1_  nobit 2 unit=m/s scmin=-14.5215 scmax=131.405
~ + exp=x/256
~ Tcs_input.whl_ref_spd._2_  nobit 3 unit=m/s scmin=-14.5215 scmax=131.405
~ + exp=x/256
~ Tcs_input.whl_ref_spd._3_  nobit 4 unit=m/s scmin=-14.5215 scmax=131.405
~ + exp=x/256
//END_GROUP
//Whl ax
~ Tcs_input.whl_ax._0_  nobit 1 unit=Degrees scmin=-85.3105 scmax=1491.78
~ + exp=X/32
~ Tcs_input.whl_ax._1_  nobit 2 unit=Degrees scmin=-85.3105 scmax=1491.78
~ + exp=X/32
~ Tcs_input.whl_ax._2_  nobit 3 unit=Degrees scmin=-85.3105 scmax=1491.78
~ + exp=X/32
~ Tcs_input.whl_ax._3_  nobit 4 unit=Degrees scmin=-85.3105 scmax=1491.78
~ + exp=X/32
//BEGIN_GROUP "Brake press" DISABLED
~ Tcs_input.brake_press._0_  nobit 4 unit= scmin=-31.2436 scmax=1027.25
~ + exp=X/16
~ Tcs_input.brake_press._1_  nobit 1 unit= scmin=-31.2436 scmax=1027.25
~ + exp=X/16
~ Tcs_input.brake_press._2_  nobit 2 unit= scmin=-31.2436 scmax=1027.25
~ + exp=X/16
~ Tcs_input.brake_press._3_  nobit 3 unit= scmin=-31.2436 scmax=1027.25
~ + exp=X/16
//END_GROUP
//BEGIN_GROUP "DAQ press" DISABLED
~ DAQ4_pWheelLF  nobit 4 unit=Bar scmin=-10 scmax=600
~ DAQ4_pWheelRF  nobit 1 unit=Bar scmin=-10 scmax=600
~ DAQ4_pWheelLR  nobit 2 unit=Bar scmin=-10 scmax=600
~ DAQ4_pWheelRR  nobit 3 unit=Bar scmin=-10 scmax=600
//END_GROUP
//In Slip engine control
~ Tcs_whl._0_.in_slip_engine_control  bit 2 unit= scmin=0 scmax=255
~ Tcs_whl._1_.in_slip_engine_control  bit 3 unit= scmin=0 scmax=255
~ Tcs_whl._2_.in_slip_engine_control  bit 1 unit= scmin=0 scmax=255
~ Tcs_whl._3_.in_slip_engine_control  bit 1 unit= scmin=0 scmax=255
~ Tcs_axle._0_.fast_split_mu_detected  bit 4 unit= scmin=0 scmax=255
~ Tcs_axle._1_.fast_split_mu_detected  bit 1 unit= scmin=0 scmax=255
~ Tcs_axle._0_.split_slip_on_high  bit 2 unit= scmin=0 scmax=255
~ Tcs_axle._1_.split_slip_on_high  bit 3 unit= scmin=0 scmax=255
