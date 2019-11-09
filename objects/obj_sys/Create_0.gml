/// @description Insert description here
// You can write your code in this editor
///ini
tacticalPauseActivated = false;
//camera
viewPortRatio = 2;
view_set_wport(view_camera[0],camera_get_view_width(view_camera[0])*viewPortRatio);
view_set_hport(view_camera[0],camera_get_view_height(view_camera[0])*viewPortRatio);

scr_debugINI();

//background
surf_stars = surface_create(room_width,room_height);
surface_set_target(surf_stars);
repeat(80)
    draw_sprite(spr_stars,irandom(sprite_get_number(spr_stars)),
				random(room_width),
				random(room_height));
surface_reset_target();
x_room_start = 0
y_room_start = 0
if instance_exists(obj_ship) {
	x_room_start = obj_ship.x
	y_room_start = obj_ship.y
}
	
x_draw_stars = 0
y_draw_stars = 0
stars_parallax = 0.9

//view
instance_create_layer(0, 0, "Instances", obj_view)