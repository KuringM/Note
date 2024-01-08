
## CBTTP: ConvertBrakeTorqueToPressure(whl, brake_torque)

- TORQUE_PRESSURE_CONV_SF 512
- BAR 16
- NM 1

$$
brake\{_}pressure=\frac{brake\{_}torque\times TORQUE\{_}PRESSURE\_CONV\{_}SF\times  BAR}{brake\{_}factor\times NM}
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

## SIGN(a)
```c
#define SIGN(a) a < 0 ? -1:1
```