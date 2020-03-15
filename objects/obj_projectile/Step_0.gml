
image_angle = point_direction(x, y, target.x, target.y)

if !obj_sys.active_pause_activated
	scr_move(sp, image_angle)
	
if !instance_exists(target)
	instance_destroy()

if place_meeting(x, y, target) {
	var xx, yy
	xx = x + lengthdir_x(sprite_width*1.2, image_angle)
	yy = y + lengthdir_y(sprite_width*1.2, image_angle)
	part_particles_create(obj_sys.part_sys_effects,
							xx, yy,
							obj_sys.part_projectile_explosion, 1)
	// target take damage
	if object_is_ancestor(target.object_index, obj_ship_parent) {
		// shield up
		if target.stat_shield {
			target.shield_anim_var = damage
			target.stat_shield -= damage
		}
		else {
			target.stat_hull -= damage
			if !target.stat_hull
				instance_destroy(target)
		}
	}	
	instance_destroy()
}