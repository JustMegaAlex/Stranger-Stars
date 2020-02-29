
event_inherited()

if interacting {
	
	if obj_sys.mouse_left { // charge ratio up
		scr_ui_control(_shield, _up)
	}
	else if obj_sys.mouse_right { // charge ratio down
		scr_ui_control(_shield, _down)
	}
	
}