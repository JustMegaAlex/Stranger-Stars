/// @description Insert description here
// You can write your code in this editor


// сверхпродвинутый ИИ
if point_distance(x, y, target_x, target_y) < sp_max {
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
	set_navigation_true = true
	navigate_phase = Navigation.stay
}

scr_navigate()

if !hull_durability {
	part_particles_create(obj_sys.part_sys,  
							x, y, 
							obj_sys.part_ship_explosion, 1)
	alarm[_destroy_alarm] = destroy_delay_time
	
	//freeze
	scr_step_code = scr_stub
}