
// Inherit the parent event
event_inherited();

if obj_sys.mouse_left {
	var target = collision_point(mouse_x, mouse_y, obj_space_stuff, false, true)
	
	if target.object_index != obj_ship {
		obj_ship.target_to_shoot = target	
	}
	
	with obj_ui_weapon_icon
		scr_ui_weapon_icon_deactivate()
}