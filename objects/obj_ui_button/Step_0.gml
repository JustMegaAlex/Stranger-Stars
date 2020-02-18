
// Inherit the parent event
event_inherited()

/// lightening if interaction
if interacting {
	image_index = _interact_img
	
	// just pressed
	if obj_sys.mouse_left {
		image_index = _checked_img
		script_execute(action_script)
	}
}
else {
	image_index = _default
}