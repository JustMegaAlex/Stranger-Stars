event_inherited()

/// lighten if interact
if image_index != _checked_img { // if already choosed
	image_index = _default

	if interacting {
		image_index = _interact_img
	
		// just pressed
		if obj_sys.mouse_left {
			// uncheck all buttons
			with obj_ui_weapon_icon {
				image_index = _default
				if instance_exists(aim_controller) {
					instance_destroy(aim_controller)
					aim_controller = noone
				}
			}
			// set checked state
			image_index = _checked_img
			aim_controller = instance_create_layer(0, 0, layer, obj_ui_aim)
			obj_sys.ui_controller = aim_controller
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