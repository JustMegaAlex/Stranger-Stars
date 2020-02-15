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