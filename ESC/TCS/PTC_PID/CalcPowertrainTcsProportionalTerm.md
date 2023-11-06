## Calc Powertrain Tcs Proportional Term

```c
/*==========================================================
This process calculates powertrain TC proportional term.
===========================================================*/
temp_gain = Cal.pt_prop_gain_f/r_[gear]; //1
avg_ramp_part = Lookup(Tcs_input.veh_spd, 4, Cal.axl_p_exc_slip_f/r_tbl); //256

/*GAIN_INITIAL
GAIN_NORMAL
GAIN_SPLIT
GAIN_SCHEDULING_MAX*/
if(Tcs_axle[].gain_scheduling == GAIN_INITIAL)
{
    Tcs_axle[].pt_first_cycle_gain = Cal.pt_1st_cycle_adjust_f/r; //256
}
else
{
    Tcs_axle[].pt_first_cycle_gain = FirstOrderFilter(Tcs_axle[].pt_first_cycle_gain, 256, Cal.pt_1st_cycle_filt_gian); //128
}

temp_gain = temp_gain * Tcs_axle[].pt_first_cycle_gain /256;

temp_gain = temp_gain * Tcs_axle[].pt_torq_mod_gain /1024; // Tcs_axle[].pt_torq_mod_gain = Lookup(Tcs_input.veh_spd, 4, Cal.ptc_mod_gain_tbl); //1024
p_term = temp_gain * Tcs_axle[].pt_prop_error /(256*1); 

if(Tcs_whl[left].delta_spd_error < avg_ramp_part
 ||Tcs_whl[right].delta_spd_error < avg_ramp_part )
{
    avg_ramp_part = 0;
}

if(p_term > 0)
{
    if(Tcs_input.veh_ax > Cal.axl_p_veh_ax_himu) //256
	{
       accel_gain = Lookup(Tcs_input.veh_ax, 4, Cal.axl_p_ax_tbl); //1024
 	   p_term = p_term * accel_gain /1024;
	}
	if(Tcs_input.tcs_veh_sneak_up == 1)
	{
    	p_term = p_term * Cal.axl_p_sneak_up_gain /1024;
	}

	p_term = p_term * Max(Tcs_input.bend_detect_estimate, Cal.axl_p_bend_adj) / Max(Cal.axl_p_bend_adj, 1);  //1024 1024

	if(Tcs_input.gas_pedal_position < Cal.axl_p_tps_thr //1024
	 &&Tcs_axle[].pt_prop_error < Cal.axl_p_tps_slip_thr) //256
	{
    	p_term = p_term * Tcs_input.gas_pedal_position / Max(Cal.axl_p_tps_thr, 1); //1024
	}
	if(Tcs_axle[].split_mu_conf > Cal.axl_p_split_mu_conf_adj) //1024
	{
    	p_term = p_term * Cal.axl_p_split_mu_conf_adj / Tcs_axle[].split_mu_conf;
	}
	if(avg_ramp_part > 0
 	&&Tcs_axle[].tcs_active_timer > Cal.two_slip_highmu_time) //1
	{
    	p_term = p_term * Tcs_axle[].pt_prop_error / avg_ramp_part;
	}
}
else
{
    p_term = p_term * Cal.axl_p_bend_adj / Max(Cal.axl_p_bend_adj, Tcs_input.bend_detect_estimate); //1024
}

if(Tcs_input.axle_shudd_detect[] == 1
 &&p_term >0)
{
    p_term = p_term * Cal.shudder_axle_p_gain[] /1024; //1024
}

p_term = Limit(p_term, Cal.axl_p_lim_min[], Cal.axl_p_lim_max[]); //1 1

/*PTC_EXIT  0
PTC_INITIAL 1
PTC_NORMAL  2
PTC_RAMPOUT 3
PTC_STATE_MAX 4*/
if(Tcs_axle[].pt_torq_request_mode_old == PTC_NORMAL //2
 &&Tcs_input.tcs_axle_oscill[] == 1)
{
    Tcs_axle[].pt_proportional_term = Util_Filter(p_term, &Filt2_p_term_filter_state[axle], &Cal.pt_prop_error_osc_cutoff);
}
else if(Tcs_axle[].pt_torq_request_mode_old == PTC_NORMAL //2
 &&Tcs_input.veh_spd < Cal.axl_p_filt_vel_thr) //256
{
    Tcs_axle[].pt_proportional_term = Util_Filter(p_term, &Filt2_p_term_filter_state[axle], &Cal.pt_prop_error_osc_cutoff);
}
else
{
    Tcs_axle[].pt_proportional_term = p_term;
    Filt2_p_term_filter_state.bz_1 = p_term;
    Filt2_p_term_filter_state.az_1 = p_term;
}                                            
```