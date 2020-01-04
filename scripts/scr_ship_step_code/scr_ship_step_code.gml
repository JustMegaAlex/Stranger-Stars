//input
mouse_left = mouse_check_button_pressed(mb_left)
mouse_right = mouse_check_button_pressed(mb_right)
key_aim = mouse_check_button_pressed(mb_right)
key_stay = keyboard_check_pressed(ord("S"))
key_cruise = keyboard_check_pressed(ord("A"))


if mouse_left {
	scr_set_fly_target(mouse_x, mouse_y)
	navigate_phase = Navigation.control
}
	
if mouse_right {
	dir_target_x = mouse_x
	dir_target_y = mouse_y
}
	
if key_stay
	obj_ship.navigate_phase = Navigation.stop
	
if key_cruise
	obj_ship.navigation_cruise_mode = !obj_ship.navigation_cruise_mode

// навигация
scr_navigate()