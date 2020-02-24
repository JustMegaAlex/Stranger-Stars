
if obj_sys.mouse_left {
	var target = collision_point(mouse_x, mouse_y, obj_scout, false, true)
		
	if target {
		scr_ui_open_dialog(target)
		with obj_ui_comm_button
			image_index = _default
			
		instance_destroy()
	}
}