
if instance_exists(target)
	if stat_charge == stat_charge_max 
		if point_distance(target.x, target.y, ship_obj.x, ship_obj.y) <= stat_range {
			var proj = instance_create_layer(ship_obj.x, ship_obj.y, "Projectiles", projectile_obj)
			proj.target = target
			proj.weapon = id
			stat_charge = 0
			if !obj_sys.weapon_autofire_active
				target = noone
		}