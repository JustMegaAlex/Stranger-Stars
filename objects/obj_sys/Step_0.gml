//// inputs
input = keyboard_check(vk_anykey) or mouse_check_button(mb_any)

mouse_left = mouse_check_button_pressed(mb_left)
mouse_right = mouse_check_button_pressed(mb_right)
key_aim = mouse_check_button_pressed(mb_right)
key_stay = keyboard_check_pressed(ord("S"))
key_cruise = keyboard_check_pressed(ord("A"))

//// ui interacting
ui_mouse_x = window_mouse_get_x()
ui_mouse_y = window_mouse_get_y()

ui_mouse_over_obj = collision_point(ui_mouse_x, ui_mouse_y, obj_ui, true, true)

switch ui_part {
	case Sys_ui.normal: {
		// ship control
		if mouse_left {
			with obj_ship {
				scr_set_fly_target(mouse_x, mouse_y)
				navigate_phase = Navigation.control
			}
		}
		if key_stay
			obj_ship.navigate_phase = Navigation.stop
	
		if key_cruise
			obj_ship.navigation_cruise_mode = !obj_ship.navigation_cruise_mode
		
		if mouse_right {
			with obj_ship {
				dir_target_x = mouse_x
				dir_target_y = mouse_y
			}
		}

		//check ui state change
		if ui_mouse_over_obj {
			ui_part = Sys_ui.ship_systems
		}
		break
	}
		
	case Sys_ui.ship_systems: {
		if !ui_mouse_over_obj {
			ui_part = Sys_ui.normal
		}
		break
	}
		
	case Sys_ui.ui_obj_controlled: {
		/// this state is controlled by ui objects
	}
}