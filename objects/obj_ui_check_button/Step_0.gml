event_inherited()

switch image_index { // which is state by itself
	case _default: {
		image_index = interacting
		break
	}
	
	case _interact_img: {
		image_index = interacting
		if obj_sys.mouse_left
			script_execute(activate_script)
		break
	}
	
	case _checked_img: {
		break
	}
}


/// lighten if interact
if image_index != _checked_img { // if already choosed
	image_index = _default

	if interacting {
		image_index = _interact_img
	
		// just pressed
		if obj_sys.mouse_left {
			// uncheck all buttons
			with obj_ui_weapon_icon
				scr_ui_weapon_icon_deactivate()
				
			// set checked state
			scr_ui_weapon_icon_activate()
		}
	}
}
else {	
	if obj_sys.mouse_left and interacting{ //uncheck
		scr_ui_weapon_icon_deactivate()
		image_index = _interact_img
	}
}