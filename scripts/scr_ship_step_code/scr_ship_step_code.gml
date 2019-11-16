///
/// @description Insert description here
// You can write your code in this editor

//input
mouse_left = mouse_check_button_pressed(mb_left)
mouse_right = mouse_check_button_pressed(mb_right)
key_aim = mouse_left && keyboard_check(vk_control)
key_stay = keyboard_check_pressed(ord("S"))

// если целимся, то не управляем кораблем
if key_aim
	mouse_left = false

if mouse_left
	scr_set_fly_target(mouse_x, mouse_y)



if key_stay {
	navigate_phase = Navigation.stay
}


////////////////actions performing
//moving
switch navigate_phase
{
	case Navigation.stay:
	{
		scr_move_contact(sp, image_angle)
		sp = scr_accelerate(accel, 0)
			
		if mouse_left or set_navigation_true{
			set_navigation_true = false
				
			target_dir = scr_get_dir_to_point(target_x, target_y)
			rel_target_dir = angle_difference(target_dir,image_angle)
				
			// что дальше?
			if sp <= sp_glide_max
				if point_distance(x, y, target_x, target_y) < glide_distance {
					navigate_phase = Navigation.glide
					break
				}
				
			if abs(rel_target_dir) > rotation_sp
				if scr_point_is_approachable(target_x, target_y)
					navigate_phase = Navigation.get_on_course
				else
					navigate_phase = Navigation.get_on_course_deccelerate
			else
				navigate_phase = Navigation.approach
					
			sp_set = sp_max
		}
		break	
	}
		
	case Navigation.get_on_course:
	{
		scr_move_contact(sp, image_angle)
			
		sp = scr_accelerate(accel, sp_set)
				
		target_dir = scr_get_dir_to_point(target_x,target_y)
		rel_target_dir = angle_difference(target_dir,image_angle)
		image_angle += rotation_sp * sign(rel_target_dir)
			
		if !scr_point_is_approachable(target_x, target_y)
			navigate_phase = Navigation.get_on_course_deccelerate
			
		if abs(rel_target_dir) < rotation_sp {
			image_angle = target_dir
			sp_set = sp_max
			navigate_phase = Navigation.approach
		}
			
		if mouse_left {
			navigate_phase = Navigation.stay
			set_navigation_true = true
		}
		break	
	}
		
	case Navigation.get_on_course_deccelerate:
	{
		scr_move_contact(sp, image_angle)
			
		sp = scr_accelerate(accel, 0)
		target_dir = scr_get_dir_to_point(target_x,target_y)
		rel_target_dir = angle_difference(target_dir,image_angle)
		image_angle += rotation_sp * sign(rel_target_dir)
			
		if scr_point_is_approachable(target_x, target_y)
			navigate_phase = Navigation.get_on_course	
			sp_set = sp
		break
	}
		
	case Navigation.approach:
	{
		scr_move_contact(sp, image_angle)
		sp = scr_accelerate(accel,sp_max)
			
		if mouse_left {
			navigate_phase = Navigation.stay
			set_navigation_true = true
		}
		break	
	}
		
	case Navigation.glide:
	{
		target_dir = scr_get_dir_to_point(target_x,target_y)
		scr_move_contact(sp_glide_max, target_dir)
			
		var dist = point_distance(x, y, target_x, target_y)
		//stop
		if dist < sp_glide_max 
			navigate_phase = Navigation.stay
				
		//end gliding
		if dist > glide_distance{
			navigate_phase = Navigation.stay
			set_navigation_true = true
		}
		break
	}
		
	case Navigation.control_lost:
	{
		scr_move_contact(sp, direction)
		image_angle += angle_drifting * rotationDir
			
		if !control_lost_time--
			navigate_phase = Navigation.stay
			set_navigation_true = true
		break
	}
}


// прицеливание
if key_aim {
	obj_aim.x = mouse_x
	obj_aim.y = mouse_y
	obj_aim.visible = true
}

if !(reloading - time_to_reload) {
	reloading++ 
}
else {
	if obj_aim.visible
		scr_shoot()
}

if !hull_durability
	scr_destroy()