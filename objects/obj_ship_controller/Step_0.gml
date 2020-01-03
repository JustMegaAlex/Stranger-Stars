

//input
mouse_left = mouse_check_button_pressed(mb_left)
key_aim = mouse_check_button_pressed(mb_right)
key_stay = keyboard_check_pressed(ord("S"))


if mouse_left
	with obj_ship {
		scr_set_fly_target(mouse_x, mouse_y)
		navigate_phase = Navigation.take_speed
	}
		
if key_stay
	obj_ship.navigate_phase = Navigation.stop