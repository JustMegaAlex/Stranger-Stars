
// navigation
scr_navigate()

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
	
// shoot
if target_to_shoot {
	if stat_weapon_charge == stat_weapon_charge_max {
		stat_weapon_charge = 0
		with instance_create_layer(x, y, layer, weapon_projectile) {
			target = obj_ship.target_to_shoot
		}
		target_to_shoot = noone
	}
}