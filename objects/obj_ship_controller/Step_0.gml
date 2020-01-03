

//input
mouse_left = mouse_check_button_pressed(mb_left)
key_aim = mouse_check_button_pressed(mb_right)
key_stay = keyboard_check_pressed(ord("S"))
key_cruise = keyboard_check_pressed(ord("A"))


if mouse_left
	with obj_ship {
		scr_set_fly_target(mouse_x, mouse_y)
		navigate_phase = Navigation.control
	}
		
if key_stay
	obj_ship.navigate_phase = Navigation.stop
	
if key_cruise
	obj_ship.navigation_cruise_mode = !obj_ship.navigation_cruise_mode