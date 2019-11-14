/// @description Insert description here
// You can write your code in this editor

mouse_right_pr = mouse_check_button_pressed(mb_right)
mouse_right = mouse_check_button(mb_right)
key_c = keyboard_check_pressed(ord("C"))

if locked_on_ship && instance_exists(obj_ship) {
	var dist = point_distance(x, y, obj_ship.x, obj_ship.y)
	if dist < sp_move_min {
		x = obj_ship.x
		y = obj_ship.y
	}
	//сближение
	else {
		var sp = dist * sp_ratio
		sp_move = max(sp_move_min, sp)
		sp_move = min(sp_move, sp_move_max)
		scr_move(sp_move, scr_get_dir_to_point(obj_ship.x, obj_ship.y))
	}
	
	scr_cameraSetCenter(view_camera[0], x, y)
	
	if mouse_right_pr {
		locked_on_ship = false
		mouse_x_pre = mouse_x
		mouse_y_pre = mouse_y
	}
}
else {
	//ползаем по карте
	if mouse_right_pr {
		mouse_x_pre = mouse_x
		mouse_y_pre = mouse_y
	}
	if mouse_right {
		//смещение при  смещении курсора мыши
		x += mouse_x_pre - mouse_x
		y += mouse_y_pre - mouse_y
		
		scr_cameraSetCenter(view_camera[0], x, y)
		
		//новые значения пред. координат мыши
		mouse_x_pre = mouse_x
		mouse_y_pre = mouse_y
	}
	
	//переключаемся на корабль
	if key_c
		locked_on_ship = true
}

//scr_cameraSetCenter(view_camera[0], x, y)