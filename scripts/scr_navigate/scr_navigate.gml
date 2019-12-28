///implements ships' navidation

target_dist = point_distance(x, y, target_x, target_y)

switch navigate_phase
	{
		case Navigation.stay:
		{
			if target_dist > glide_distance {
				navigate_phase = Navigation.accelerate
			}
			else if target_dist {
				navigate_phase = Navigation.glide
			}
		}
		
		case Navigation.accelerate:
		{
			var sp_to = sp_cruise*sp_level_set
			
			sp = scr_approach(sp, sp_to, accel)
			
			if abs(sp - sp_to) < accel {
				navigate_phase = Navigation.approach	
			}
		}
		
		case Navigation.decelerate:
		{
			sp = scr_approach(sp, 0, accel)
			
			if sp < accel {
				navigate_phase = Navigation.stay
			}
		}
		
		case Navigation.get_on_course:
		{
			
		}
		
		case Navigation.approach:
		{
			
		}
		
		case Navigation.glide:
		{
			
		}
		
	}