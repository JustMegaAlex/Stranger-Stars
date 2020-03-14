
if obj_sys.mouse_left {
	if point_distance(obj_ship.x, 
					obj_ship.y, 
					mouse_x, 
					mouse_y) <= weapon_obj.stat_range
	{	
		var target = collision_point(mouse_x, mouse_y, obj_space_stuff, false, true)
		if target
			if target.object_index != obj_ship 
				scr_shoot_set_target(weapon_obj, target)
	}
	
	with obj_ui_weapon_icon {
		aim_controller = noone
		image_index = _default
	}
	
	obj_sys.ui_part = Sys_ui.normal
	instance_destroy()
}