///@arg navigation_phase
///@arg asteroid_id
function scr_navigation_set() {

	navigate_phase = argument[0]

	switch navigate_phase
	{
		case Navigation.stay: {
			dir_target_x = x + lengthdir_x(1, image_angle)
			dir_target_y = y + lengthdir_y(1, image_angle)
			scr_set_fly_target(x, y)
			break
		}
	
		case Navigation.control: {
			break
		}
	
		case Navigation.take_speed: {
			sp_to = scr_set_sp_to(Sp_level.normal)
			break
		}
		
		case Navigation.stop: {
			break
		}
	
		case Navigation.get_on_course_pre: {
			break
		}
		
		case Navigation.get_on_course: {
			break
		}
		
		case Navigation.approach: {
			sp_to = scr_set_sp_to(Sp_level.normal)
			break
		}
		
		case Navigation.glide: {
			break
		}
	
		case Navigation.stun: {
			dir = point_direction(argument[1].x, argument[1].y, x, y)
			navigate_phase = Navigation.stun
			stun_time = stun_set_time
			sp *= stun_bounce
			break
		}
	}


}
