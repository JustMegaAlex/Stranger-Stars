/// @description Insert description here
// You can write your code in this editor

//input
mouse_left = mouse_check_button_pressed(mb_left)
mouse_right = mouse_check_button_pressed(mb_right)
key_stay = keyboard_check_pressed(ord("S"))

if mouse_left
	scr_set_fly_target(mouse_x, mouse_y)

//if mouse_right 
//	image_angle = point_direction(x,y,mouse_x,mouse_y)

if key_stay {
	navigate_phase = Navigation.stay
}
		
if(!obj_sys.tacticalPauseActivated)
{
    ////////////////actions performing
	//tactical pause button
    if keyboard_check_pressed(vk_space) {}
		//scr_tacticalPauseActivate(true);
	
	//moving
	switch navigate_phase
	{
		case Navigation.stay:
		{
			scr_move(sp, image_angle)
			sp = scr_accelerate(accel, 0)
			
			if mouse_left or set_navigation_true{
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
			
			if mouse_left {
				navigate_phase = Navigation.stay
				set_navigation_true = true
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
			
			if mouse_left {
				navigate_phase = Navigation.stay
				set_navigation_true = true
			}
			break	
		}
		
		case Navigation.glide:
		{
			target_dir = scr_get_dir_to_point(target_x,target_y)
			scr_move(sp_glide_max, target_dir)
			if point_distance(x, y, target_x, target_y) < sp_glide_max
				navigate_phase = Navigation.stay
			break	
		}
	}
}
else 
{
    //ui interact
    if(keyboard_check_pressed(vk_space))
    {
        scr_tacticalPauseActivate(false);
    }
}

scr_cameraSetCenter(view_camera[0],x,y);

///////////////
/*
if(mouse_check_button_pressed(mb_middle))
{
    viewOnShip = false;
    mouseRelX = window_mouse_get_x();
    mouseRelY = window_mouse_get_y();
    viewRelX = view_xview[0];
    viewRelY = view_yview[0];
}
view_hspeed[0] = 0;
view_vspeed[0] = 0;


mouseXPre = mouse_x;
mouseYPre = mouse_y;