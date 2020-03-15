event_inherited()

if !image_index {
	image_index = interacting
} else {
	if obj_sys.mouse_left and interacting
		script_execute(action_script_interact)
}