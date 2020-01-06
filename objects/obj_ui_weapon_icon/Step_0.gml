event_inherited()

/// lighten if interact
if image_index != _checked_img {
	image_index = _default

	if interacting {
		image_index = _interact_img
	
		// just pressed
		if obj_sys.mouse_left {
			// press action code
			with obj_ui_weapon_icon
				image_index = _default
			image_index = _checked_img
		}
	}
}