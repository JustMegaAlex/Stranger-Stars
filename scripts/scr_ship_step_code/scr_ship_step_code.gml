function scr_ship_step_code() {

	// navigation
	scr_navigate()

	/// stats update
	for(i=0; i<array_length_1d(arr_weapon_objects); i++) {
		var weap_obj = arr_weapon_objects[i]
		with weap_obj {
			stat_charge = scr_approach(stat_charge,
												stat_charge_max,
												stat_charge_ratio)
		}
	}


	stat_shield_charge = scr_approach(stat_shield_charge,
										stat_shield_charge_max,
										stat_shield_charge_ratio)

	if stat_shield < stat_shield_max
		if stat_shield_charge == stat_shield_charge_max {
			stat_shield++
			stat_shield_charge = 0
		}
	


}
