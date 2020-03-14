
if target
	if stat_charge == stat_charge_max {
		var proj = instance_create_layer(ship_obj.x, ship_obj.y, layer, projectile_obj)
		proj.target = target
		proj.weapon = id
		stat_charge = 0
		target = noone
	}