/// @description Insert description here
// You can write your code in this editor


// сверхпродвинутый ИИ
if point_distance(x, y, target_x, target_y) < sp_max {
	dir_wander = irandom( 360 )
	dist_wander = irandom_range(dist_wander_min, dist_wander_max)
	target_x = x + lengthdir_x(dist_wander, dir_wander)
	target_y = y + lengthdir_y(dist_wander, dir_wander)	
	set_navigation_true = true
	navigate_phase = Navigation.stay
}


if(!obj_sys.tacticalPauseActivated) {
	scr_navigate()
}