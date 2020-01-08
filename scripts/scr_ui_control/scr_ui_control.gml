///@arg ship_system
///@arg control_action

// ui control

switch argument0 {
	case _weapon: {
		
		switch argument1 {
			case _up: {
				obj_ship.stat_weapon_charge_ratio = scr_approach(obj_ship.stat_weapon_charge_ratio,
																	obj_ship.stat_weapon_charge_ratio_max,
																	1)
			break
			}
		
			case _down: {
				obj_ship.stat_weapon_charge_ratio = scr_approach(obj_ship.stat_weapon_charge_ratio,
																	0,
																	1)
			}
		}
		break
	}
	
	case _shield: {
		
		switch argument1 {
			case _up: {
				obj_ship.stat_shield_charge_ratio = scr_approach(obj_ship.stat_shield_charge_ratio,
																	obj_ship.stat_shield_charge_ratio_max,
																	1)
			break
			}
		
			case _down: {
				obj_ship.stat_shield_charge_ratio = scr_approach(obj_ship.stat_shield_charge_ratio,
																	0,
																	1)
			}
		}
		break
	}
	
}

scr_ui_update()