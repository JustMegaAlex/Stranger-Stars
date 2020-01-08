
if !obj_sys.active_pause_activated {
	script_execute(scr_step_code)
}

/// stats update
stat_weapon_charge = scr_approach(stat_weapon_charge,
									stat_weapon_charge_max,
									stat_weapon_charge_ratio)


stat_shield_charge = scr_approach(stat_shield_charge,
									stat_shield_charge_max,
									stat_shield_charge_ratio)
									
if stat_shield < stat_shield_max	
	if stat_shield_charge == stat_shield_charge_max {
		stat_shield++
		stat_shield_charge = 0
	}
									
scr_ui_update()