
if !obj_sys.active_pause_activated {
	script_execute(scr_step_code)
}

/// stats uodate
stat_weapon_charge = scr_approach(stat_weapon_charge,
									stat_weapon_charge_max,
									stat_weapon_charge_ratio)
									
scr_ui_update()