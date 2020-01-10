//////// inputs
input = keyboard_check(vk_anykey) or mouse_check_button(mb_any)

mouse_left = mouse_check_button_pressed(mb_left)
mouse_right = mouse_check_button_pressed(mb_right)
key_aim = mouse_check_button_pressed(mb_right)
key_stay = keyboard_check_pressed(ord("S"))
key_cruise = keyboard_check_pressed(ord("A"))

if input {
	
	if ui_interacting {

	}
	
	else if ui_controller {
		
	}
	
	else { // ship control
		if mouse_left {
			with obj_ship {
				scr_set_fly_target(mouse_x, mouse_y)
				navigate_phase = Navigation.control
			}
		}
	
		if mouse_right {
			with obj_ship {
				dir_target_x = mouse_x
				dir_target_y = mouse_y
			}
		}
	
		if key_stay
			obj_ship.navigate_phase = Navigation.stop
	
		if key_cruise
			obj_ship.navigation_cruise_mode = !obj_ship.navigation_cruise_mode
	}
}

// ui 
ui_interacting = noone