
interacting = false

if obj_sys.ui_part == Sys_ui.ship_systems {
	
	mouse_over_me = obj_sys.ui_mouse_over_obj == id
	
	if mouse_over_me
		interacting = true
}