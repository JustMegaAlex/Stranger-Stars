
// сверхпродвинутый ИИ (щутка)
if point_distance(x, y, target_x, target_y) < sp_cruise {
	//задаем новую точку следования
	dir_wander = irandom( 360 )
	dist_wander = irandom_range(dist_wander_min, dist_wander_max)
	target_x = x + lengthdir_x(dist_wander, dir_wander)
	target_y = y + lengthdir_y(dist_wander, dir_wander)	
	// search meteorite-free trajectory
	while collision_line(x, y, target_x, target_y, obj_meteorite, false, false) {
		dir_wander = irandom( 360 )
		target_x = x + lengthdir_x(dist_wander, dir_wander)
		target_y = y + lengthdir_y(dist_wander, dir_wander)
	}
	navigate_phase = Navigation.control
}

scr_navigate()

if !hull_durability {
	scr_destroy()
}