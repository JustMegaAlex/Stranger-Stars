///implements ships' navidation

target_dist = point_distance(x, y, target_x, target_y)

switch navigate_phase
{
	case Navigation.stay: {
		break
	}
	
	case Navigation.control: {
		scr_move_contact(sp, image_angle)
		
		if target_dist > glide_distance {
			sp_to = scr_set_sp_to(Sp_level.normal)
			navigate_phase = Navigation.take_speed
		}
		else if target_dist {
			navigate_phase = Navigation.glide
		}
	}
	
	case Navigation.take_speed: {
		sp = scr_approach(sp, sp_to, accel)
		
		scr_move_contact(sp, image_angle)
			
		if abs(sp - sp_to) < accel {
			navigate_phase = Navigation.get_on_course_pre
		}
			
		break
	}
		
	case Navigation.stop: {
		sp = scr_approach(sp, 0, accel)
		
		scr_move_contact(sp, image_angle)
			
		if sp < accel {
			scr_set_fly_target(x, y)
			navigate_phase = Navigation.stay
		}
			
		break
	}
	
	case Navigation.get_on_course_pre: {
		scr_move_contact(sp, image_angle)
		
		target_dir = scr_get_dir_to_point(target_x, target_y)
		rel_target_dir = angle_difference(target_dir, image_angle)
		
		if scr_point_is_approachable(target_x, target_y) {
			navigate_phase = Navigation.get_on_course
		}
		
		break
	}
		
	case Navigation.get_on_course: {
		scr_move_contact(sp, image_angle)
		
		target_dir = scr_get_dir_to_point(target_x, target_y)
		rel_target_dir = angle_difference(target_dir, image_angle)
		
		image_angle += rotation_sp * sign(rel_target_dir)
			
		if abs(rel_target_dir) < rotation_sp {
			image_angle = target_dir
			sp_to = scr_set_sp_to(Sp_level.normal)
			navigate_phase = Navigation.approach
		}
		break
	}
		
	case Navigation.approach: {
		scr_move_contact(sp, image_angle)
		
		if !navigation_cruise_mode
			if target_dist < break_down_dist
				navigate_phase = Navigation.stop
		
		break
	}
		
	case Navigation.glide: {
		scr_move_contact(sp, image_angle)
		navigate_phase = Navigation.stay
	}
}