///@arg speed
///@arg dir
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