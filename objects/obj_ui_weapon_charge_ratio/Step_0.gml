
event_inherited()

if interacting {
	
	if obj_sys.mouse_left { // charge ratio up
		scr_ui_control(_weapon, _up, weapon_obj)
	}
	else if obj_sys.mouse_right { // charge ratio down
		scr_ui_control(_weapon, _down, weapon_obj)
	}
	
}