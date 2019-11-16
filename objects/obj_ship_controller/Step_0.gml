

//input
mouse_left = mouse_check_button_pressed(mb_left)
key_aim = mouse_check_button_pressed(mb_right)
//key_aim = mouse_left && keyboard_check(vk_control)
key_stay = keyboard_check_pressed(ord("S"))

// если целимся, то не управляем кораблем
//if key_aim
//	mouse_left = false


if mouse_left
	with obj_ship
		scr_set_fly_target(mouse_x, mouse_y)


if key_stay
	with obj_ship
		navigate_phase = Navigation.stay


// прицеливание
if key_aim {
	obj_aim.x = mouse_x
	obj_aim.y = mouse_y
	obj_aim.visible = true
}
