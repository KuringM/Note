## Calibrate Apply rate & timeout

```c
temp_aply_grad_base = Cal.dbi_aply_grad_base_f; //16
temp_aply_grad_base = Lookup(Abs_input.VabsFiltVehSpd,3, Cal.dbi_aply_grad_base_r); //16
ABS_whl[].app_timeout_target = Cal.en_timeout_target_f/r; //1
```

### Compute base apply gradient

```c
temp_aply_grad_base = temp_aply_grad_base + ABS_whl[].dbi_cntrl_var_s16 * Cal.dbi_pd_aply_grad_gain[] *100 /1024 ; //16*256
ABS_whl[].state_apply_gradient_base_s16 = Limit(temp_aply_grad_base, Cal.dbi_aply_grad_min_f/r, Cal.dbi_aply_grad_max); //16 16

// rough road apply gradient modify
temp_apply_grad_mod = SelectDesenseWheel() - Cal.agen_aply_grad_rroad_bdnd[]; // 1023
temp_apply_grad_mod = Max(temp_apply_grad_mod,0);
temp_apply_grad_mod = temp_apply_grad_mod * Cal.agen_aply_grad_rroad_dbnd_gain[] *100 /1024;
temp_apply_grad_mod = 
```

