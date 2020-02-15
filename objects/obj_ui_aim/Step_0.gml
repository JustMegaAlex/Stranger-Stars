
if obj_sys.mouse_left {
	var target = collision_point(mouse_x, mouse_y, obj_space_stuff, false, true)
	
	if target
		if target.object_index != obj_ship {
			obj_ship.target_to_shoot = target	
		}		
	
	image_index = _default
	
	with obj_ui_weapon_icon
		aim_controller = noone
		
	obj_sys.ui_part = Sys_ui.normal
	instance_destroy()

}