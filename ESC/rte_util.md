
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

## `FirstOrderFilter()`

```c
FirstOrderFilter(old, input, filter_coeff)
{
    temp = (input - old) * filter_coeff / 128;
    if (temp == 0 && input - old != 0)
    {
        temp = SIGN(input-old); 
    }
    output = temp + old;
    return(output);
}
```

## `SIGN()`

```c
#define SIGN(a) (a<0? -1:1)
```

## `Util_Filter()`

```c
Util_Filter(xk, *states, *coeff)
{
    yk = xk * coeff->b0 + states->bz_1 * coeff->b1 - states->az_1 * coeff->al;
    yk = yk /FILTMULTM;
    states->bz_1 = xk;
    states->az_1 = yk;
    return yk;
}
```

### ABS_CYCLE_STATUS_TYPE_TAG (ABS_whl[].slip_phase)
- SLIP_ABOVE_THR=0
- SLIP_UNDER_THR
- SLIP_PHASE_TRANS
- SLIP_PHASE_TRANS_CONFIM

### ABS_whl[].whl_surf_jump_state
- WHL_NO_TRANSITION 0
- WHL_L2H_TRANSITION 1
- WHL_H2L_TRANSITION 2

### Tcs_axle[].pt_torq_request_mode
- PTC_EXIT 0
- PTC_INITIAL 1
- PTC_NORMAL  2
- PTC_RAMPOUT 3
- PTC_STATE_MAX 4

### Tcs_input.drivetrain
- FWD
- AWD
- NEUTRAL
- HIGH_RANGE_4x4
- LOW_RANGE_4x4
- AWD
- AWD_RANGE

### Tcs_axle[].slip_state
- STATE_STABLE 0
- STATE_SPLIT 1
- STATE_HOMOGENEOUS 2

### Tcs_axle[].gain_scheduling
- GAIN_INITIAL
- GAIN_NORMAL
- GAIN_SPLIT
- GAIN_SCHEDULING_MAX