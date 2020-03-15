event_inherited()

switch image_index { // which is state by itself
	case _default: {
		image_index = interacting
		break
	}
	
	case _interact_img: {
		image_index = interacting
		if obj_sys.mouse_left {
			image_index = _checked_img
			script_execute(action_script_interact)
		}
		break
	}
	
	case _checked_img: {
		if obj_sys.mouse_left {
			script_execute(action_script_checked)
		}
		break
	}
}