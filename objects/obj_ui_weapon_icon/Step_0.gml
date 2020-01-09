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
				image_index = _default
			// set checked subimage
			image_index = _checked_img
		}
	}
}
else {
	if interacting and obj_sys.mouse_left // cancel choosing
		image_index = _interact_img
}