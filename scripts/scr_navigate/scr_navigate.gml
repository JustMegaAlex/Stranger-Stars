///implements ships' navigation

target_dist = point_distance(x, y, target_x, target_y)

switch navigate_phase
{
	case Navigation.stay: {
		scr_set_dir_point(dir_target_x, dir_target_y)
		break
	}
	
	case Navigation.control: {
		scr_move_contact(sp, image_angle)
		
		if target_dist > glide_distance {
			scr_navigation_set(Navigation.take_speed)
		}
		else if target_dist {
			scr_navigation_set(Navigation.glide)
		}
		break
	}
	
	case Navigation.take_speed: {
		sp = scr_approach(sp, sp_to, accel)
		
		scr_move_contact(sp, image_angle)
			
		if abs(sp - sp_to) < accel {
			scr_navigation_set(Navigation.get_on_course_pre)
		}
			
		break
	}
		
	case Navigation.stop: {
		sp = scr_approach(sp, 0, accel)
		
		scr_move_contact(sp, image_angle)
			
		if sp < accel {
			scr_navigation_set(Navigation.stay)
		}
			
		break
	}
	
	case Navigation.get_on_course_pre: {
		scr_move_contact(sp, image_angle)
		
		target_dir = scr_get_dir_to_point(target_x, target_y)
		rel_target_dir = angle_difference(target_dir, image_angle)
		
		if scr_point_is_approachable(target_x, target_y) {
			scr_navigation_set(Navigation.get_on_course)
		}
		
		break
	}
		
	case Navigation.get_on_course: {
		scr_move_contact(sp, image_angle)
		
		scr_set_dir_point(target_x, target_y)
			
		if abs(rel_target_dir) < rotation_sp {
			image_angle = target_dir
			scr_navigation_set(Navigation.approach)
		}
		break
	}
		
	case Navigation.approach: {
		scr_move_contact(sp, image_angle)
		
		if !navigation_cruise_mode
			if target_dist < break_down_dist
				scr_navigation_set(Navigation.stop)
		
		break
	}
		
	case Navigation.glide: {
		scr_move_contact(sp, image_angle)
		scr_navigation_set(Navigation.stay)
		break
	}
	
	case Navigation.stun: {
		stun_time--
		scr_move_contact(sp, dir)
		if !stun_time {
			scr_navigation_set(Navigation.stay)
		}
	}
}