///@arg ship_system
///@arg control_action

// ui control

switch argument0 {
	case _weapon: {
		
		switch argument1 {
			case _up: {
				// check reactor has spare power
				if obj_ship.stat_reactor_power_spare {
					obj_ship.stat_weapon_charge_ratio = scr_approach(obj_ship.stat_weapon_charge_ratio,
																		obj_ship.stat_weapon_charge_ratio_max,
																		1)
					obj_ship.stat_reactor_power_spare--
				}
				break
			}
		
			case _down: {
				// check if reactor power should be increased
				if obj_ship.stat_weapon_charge_ratio {
					obj_ship.stat_weapon_charge_ratio = scr_approach(obj_ship.stat_weapon_charge_ratio,
																		0,
																		1)
					obj_ship.stat_reactor_power_spare++
				}
			}
		}
		break
	}
	
	case _shield: {
		
		switch argument1 {
			case _up: {
				// check reactor has spare power
				if obj_ship.stat_reactor_power_spare {
					obj_ship.stat_shield_charge_ratio = scr_approach(obj_ship.stat_shield_charge_ratio,
																	obj_ship.stat_shield_charge_ratio_max,
																	1)
					obj_ship.stat_reactor_power_spare--
				}
				
			break
			}
		
			case _down: {
				// check if reactor power should be increased
				if obj_ship.stat_shield_charge_ratio {
					obj_ship.stat_shield_charge_ratio = scr_approach(obj_ship.stat_shield_charge_ratio,
																		0,
																		1)
					obj_ship.stat_reactor_power_spare++
				}
			}
		}
		break
	}
	
}

scr_ui_update()