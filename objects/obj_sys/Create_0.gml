//////////init gameplay

// active pause
active_pause_activated = false;

// ui
ui_interacting = noone	// is affected by ui elements
ui_controller = noone	//

//camera
viewPortRatio = 2;
w = camera_get_view_width(view_camera[0]) * viewPortRatio
h = camera_get_view_height(view_camera[0]) * viewPortRatio
//view_set_wport(view_camera[0], w)
//view_set_hport(view_camera[0], h)
display_set_gui_size(window_get_width(), window_get_height())


// if game is first time launched 
// show tips in a half a second
show_tips = false
show_tips_scale = 2
show_tips_x = (view_get_wport(view_camera[0]) - sprite_get_width(spr_control_tips) * show_tips_scale) + 50// * 0.5
show_tips_y = (view_get_hport(view_camera[0]) - sprite_get_height(spr_control_tips) * show_tips_scale) - 40// * 0.5
alarm[0] = -1 // turn off

//ini of debug scripts' vars
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

//////////particle systems
part_sys_effects = part_system_create_layer("Effects", false)
part_sys_effects_deep = part_system_create_layer("Effects_deep", false)


//projectiles
part_projectile_explosion = part_type_create()
var life_time = sprite_get_number(spr_projectile_explosion) * 2
part_type_life(part_projectile_explosion,
					life_time,
					life_time)
part_type_sprite(part_projectile_explosion, 
					spr_projectile_explosion, 
					true, true, false)
					
part_ship_explosion = part_type_create()
var life_time = sprite_get_number(spr_ship_explosion)
part_type_life(part_ship_explosion,
					life_time,
					life_time)
part_type_sprite(part_ship_explosion, 
					spr_ship_explosion, 
					true, true, false)


//view
instance_create_layer(0, 0, "Instances", obj_view)