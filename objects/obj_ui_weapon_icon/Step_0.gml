event_inherited()

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
	obj_sys.ui_interacting = true
	
	if obj_sys.mouse_left //
		if interacting 
			image_index = _interact_img
		else {
			
		}
}