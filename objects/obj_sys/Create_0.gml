/// @description Insert description here
// You can write your code in this editor
///ini
tacticalPauseActivated = false;
//camera
viewPortRatio = 2;
view_set_wport(view_camera[0],camera_get_view_width(view_camera[0])*viewPortRatio);
view_set_hport(view_camera[0],camera_get_view_height(view_camera[0])*viewPortRatio);

scr_debugINI();