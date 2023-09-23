# ABS control state

![ABS_Control_State](./img/ABS_control_state.png)

## CBTTP: ConvertBrakeTorqueToPressure(whl, brake_torque)

- TORQUE_PRESSURE_CONV_SF 512
- BAR 16
- NM 1

$$
brake\_pressure=\frac{brake\_torque\times TORQUE\_PRESSURE\_CONV\_SF\times  BAR}{brake\_factor\times NM}
$$

## CPTBT:ConvertPressureToBrakeTorque(whl, brake_pressure)

$$
brake\_torque=\frac{brake\_pressure\times brake\_factor\times NM}{TORQUE\_PRESSURE\_CONV\_SF\times  BAR}
$$

## LookUp:Util_LookInTwoDimTable

$$
y=\frac{y_1-y_0}{x_1-x_0}(x-x_0)+y_0
$$

## Limit(a,min,max)

```c
#define LIMIT(a,min,max)
	a < min ? min : (a > max ? max :a )
```
