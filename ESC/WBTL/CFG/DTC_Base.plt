DtcIncEngTqFlg  bit 1 unit= scmin=0 scmax=1
WCBS_F_FrntAxleDTCTrqReqVld  bit 2 unit= scmin=0 scmax=1
PdcuAccPedalPos  nobit 3 unit=% scansc
//BEGIN_GROUP "Front Torq" ENABLED
PdcuFrntAxleTrqReq  nobit 4 unit=Nm scmin=-1963.45 scmax=2701.85
PdcuFrntAxleTrqAct  nobit 1 unit=Nm scmin=-1963.45 scmax=2701.85
WCBS_N_FrntAxleDTCTrqReq  nobit 2 unit=Nm scmin=-1963.45 scmax=2701.85
DTC_axle._0_.drag_torq  nobit 3 unit= scansc
Dtc_input.actual_axle_torq._0_  nobit 4 unit= scansc
Dtc_input.driver_req_axle_torq._0_  nobit 1 unit= scansc
//END_GROUP
WCBS_F_ReAxleDTCTrqReqVld  bit 2 unit= scmin=0 scmax=1
//BEGIN_GROUP "Rear Torq" ENABLED
PdcuReAxleTrqAct  nobit 3 unit=Nm scansc
PdcuReAxleTrqReq  nobit 4 unit=Nm scansc
WCBS_N_ReAxleDTCTrqReq  nobit 1 unit=Nm scmin=-239.667 scmax=1645.67
DTC_axle._1_.drag_torq  nobit 2 unit= scansc
Dtc_input.actual_axle_torq._1_  nobit 3 unit= scansc
Dtc_input.driver_req_axle_torq._1_  nobit 4 unit= scansc
//END_GROUP
Dtc_input.gaspedalposition  nobit 1 unit= scmin=-4.24533 scmax=0.44792
+ exp=x/1024
Dtc_input.abs_veh_speed  nobit 2 unit= scansc
+ exp=x/256*3.6
//BEGIN_GROUP "wheel speed" ENABLED
Dtc_input.abs_wheel_speed._0_  nobit 3 unit= scansc
+ exp=x/256*3.6
Dtc_input.abs_wheel_speed._1_  nobit 4 unit= scansc
+ exp=x/256*3.6
Dtc_input.abs_wheel_speed._2_  nobit 1 unit= scansc
+ exp=x/256*3.6
Dtc_input.abs_wheel_speed._3_  nobit 2 unit= scansc
+ exp=x/256*3.6
//END_GROUP
//BEGIN_GROUP "whl refer speed"
DTC_axle._0_.dtc_torq_act  nobit 3 unit= scmin=-1000 scmax=1000
DTC_axle._1_.dtc_torq_act  nobit 4 unit= scmin=-2000 scmax=200
Dtc_input.abs_whl_refer_speed._0_  nobit 1 unit= scansc
+ exp=x/256*3.6
Dtc_input.abs_whl_refer_speed._1_  nobit 2 unit= scansc
+ exp=x/256*3.6
~ Dtc_input.abs_whl_refer_speed._2_  nobit 4 unit= scansc
~ + exp=x/256*3.6
~ Dtc_input.abs_whl_refer_speed._3_  nobit 1 unit= scansc
~ + exp=x/256*3.6
//END_GROUP
Dtc_input.engine_spd  nobit 3 unit= scmin=-32768 scmax=32767
DTC_Veh.slip_actual._0_  nobit 4 unit= scmin=-32768 scmax=32767
DTC_Veh.slip_actual._1_  nobit 1 unit= scmin=-32768 scmax=32767
Dtc_output.dtc_front_torq  nobit 2 unit= scmin=-2000 scmax=200
Dtc_output.dtc_rear_control  nobit 3 unit= scmin=0 scmax=255
Dtc_output.dtc_rear_torq  nobit 4 unit= scmin=-2000 scmax=200
Dtc_output.dtc_front_control  nobit 1 unit= scmin=0 scmax=255
DTC_Veh.target_slip._1_  nobit 2 unit= scmin=-32768 scmax=32767
DTC_Veh.target_slip._0_  nobit 3 unit= scmin=-32768 scmax=32767
DTC_axle._0_.delta_slip_i  nobit 4 unit= scmin=-1000 scmax=1000
+ exp=x/256
DTC_axle._0_.slip_p  nobit 1 unit= scmin=-1000 scmax=1000
DTC_axle._0_.slip_i  nobit 2 unit= scmin=-1000 scmax=1000
+ exp=x/256
Dtc_output.dtc_front_torq  nobit 3 unit= scmin=-1000 scmax=1000
Dtc_output.dtc_front_control  nobit 4 unit= scmin=0 scmax=255
DTC_Veh.dtc_torque_min  nobit 4 unit= scmin=-1000 scmax=1000
DTC_axle._0_.drag_torq  nobit 1 unit= scmin=-1000 scmax=1000
Dtc_input.RegenTqMax._0_  nobit 2 unit= scmin=-32768 scmax=32767
