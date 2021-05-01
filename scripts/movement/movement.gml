
function scr_get_dir_to_point(x_, y_) {
	return point_direction(x, y, x_, y_)
}

function scr_move(speed, dir) {
	x += lengthdir_x(speed, dir)
	y += lengthdir_y(speed, dir)
}

function scr_move_contact(argument0, argument1) {
	x += lengthdir_x(argument0, argument1)
	y += lengthdir_y(argument0, argument1)
	//столкновение с астероидами
	var aster = instance_place(x, y, obj_meteorite)
	if aster {
		// move out of asteroid
		while place_meeting(x, y, obj_meteorite) {
	        x -= lengthdir_x(1, image_angle);
	        y -= lengthdir_y(1, image_angle);
		}
		// go to stun state
		if sp > stun_sp_tolerance {
			scr_navigation_set(Navigation.stun, aster)
			return
		}
		navigate_phase = Navigation.stay
	}
}
