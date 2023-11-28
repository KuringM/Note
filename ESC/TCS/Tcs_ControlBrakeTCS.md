## Tcs_ControlBrakeTCS

```c
if (Tcs_veh.veh_brk_active == 1)
{
	if (Tcs_veh.brake_tcs_rampout == 1)
	{
		for(pinion = 0; pinion < 3; pinion++)
		{
			if (Tcs_pin[pinion].pid_term > 0)
			{
				Tcs_pin[pinion].pid_term = Max(Tcs_pin[pinion].pid_term - Cal.brk_rapout_rate * TCS_LOOPTIME / SECOND, 0); //1
			}
			else if(Tcs_pin[pinion].pid_term < 0)
			{
				Tcs_pin[pinion].pid_term = Min(Tcs_pin[pinion].pid_term + Cal.brk_rapout_rate * TCS_LOOPTIME / SECOND, 0);
			}
		}
	}
}
```
