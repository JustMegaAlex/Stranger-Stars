///@arg ship_system
///@arg control_actions
///@arg equip_inst
var ship_system = argument[0]
var control_actions = argument[1]
if argument_count == 3
	var equip_inst = argument[2]

//// ui control
switch ship_system {
	case _weapon: {
		
		switch control_actions {
			case _up: {
				// check reactor has spare power
				if obj_ship.stat_reactor_power_spare {
					equip_inst.stat_charge_ratio = scr_approach(equip_inst.stat_charge_ratio,
																		equip_inst.stat_charge_ratio_max,
																		1)
					obj_ship.stat_reactor_power_spare--
				}
				break
			}
		
			case _down: {
				// check if reactor power should be increased
				if equip_inst.stat_charge_ratio {
					equip_inst.stat_charge_ratio = scr_approach(equip_inst.stat_charge_ratio,
																		0,
																		1)
					obj_ship.stat_reactor_power_spare++
				}
			}
		}
		break
	}
	
	case _shield: {
		
		switch control_actions {
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