switch navigate_phase
	{
		case Navigation.stay:
		{
			scr_move(sp, image_angle)
			sp = scr_accelerate(accel, 0)
			
			if set_navigation_true {
				set_navigation_true = false
				
				target_dir = scr_get_dir_to_point(target_x,target_y)
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
			scr_move(sp, image_angle)
			
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
			
			break	
		}
		
		case Navigation.get_on_course_deccelerate:
		{
			scr_move(sp, image_angle)
			
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
			scr_move(sp, image_angle)
			sp = scr_accelerate(accel,sp_max)
			
			break	
		}
		
		case Navigation.glide:
		{
			target_dir = scr_get_dir_to_point(target_x,target_y)
			scr_move(sp_glide_max, target_dir)
			
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
			scr_move(sp, direction)
			image_angle += angle_drifting * rotationDir
			
			if !control_lost_time--
				navigate_phase = Navigation.stay
				set_navigation_true = true
			break
		}
	}