
event_inherited()

image_index = _default

if interacting {
	image_index = _interact_img
	
	if obj_sys.mouse_left { // charge ratio up
		scr_ui_control_(_weapon, _up)
	}
	
}