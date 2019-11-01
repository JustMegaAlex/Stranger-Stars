///@func scr_cameraSetCenter(camera,x,y)
///@desc set view center
///@arg camera
///@arg {real} x
///@arg {real} y
camera_set_view_pos(argument0,
					argument1-camera_get_view_width(argument0)*0.5,
					argument2-camera_get_view_height(argument0)*0.5);