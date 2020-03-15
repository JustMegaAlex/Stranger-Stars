//////////init gameplay

//// gameplay attributes
active_pause_activated = false
weapon_autofire_active = true

//// ui
// ui parts enum
enum Sys_ui{
	menu,			// obj_sys controlled states
	normal,			//
	ship_systems,	//
	dialog,			//
	
	ui_obj_controlled // ui obj controlled state
}
ui_part = Sys_ui.normal
ui_mouse_over_obj = noone	// is affected by ui elements
ui_controller = noone	//

draw_set_font(fnt_ui)

//// ui elements coordinates
ui_weapon_icon_coord_x = obj_ui_weapon_icon_mockup.x
ui_weapon_icon_coord_y = obj_ui_weapon_icon_mockup.y
instance_destroy(obj_ui_weapon_icon_mockup)
var icon_w = sprite_get_width(spr_ui_weapon_icon)
var gap_factor = 1.2
for(var i=0; i<4; i++)
	arr_weapon_icon_positions[i] = ui_weapon_icon_coord_x + icon_w*gap_factor * i

//// ui interacting
ui_mouse_x = window_mouse_get_x()
ui_mouse_y = window_mouse_get_y()
ui_station_interact_distance = 350

//// inputs
input = false
mouse_left = false
mouse_right = false
key_aim = false
key_stay = false
key_cruise = false

//// camera
display_set_gui_size(window_get_width(), window_get_height())
var view_w = view_get_wport(view_camera[0])
var view_h = view_get_hport(view_camera[0])

//// tips
// if game is first time launched 
// show tips in a half a second
show_tips = false
show_tips_scale = 2
show_tips_x = (view_w - sprite_get_width(spr_control_tips) * show_tips_scale) + 50// * 0.5
show_tips_y = (view_h - sprite_get_height(spr_control_tips) * show_tips_scale) - 40// * 0.5
alarm[0] = -1 // tips turn off

//// ini of debug scripts' vars
scr_debugINI();

//// background
var surf_size = 2
var surf_w = view_w*surf_size
var surf_h = view_h*surf_size
var stars_num = 80
surf_stars = surface_create(surf_w, surf_h)
surface_set_target(surf_stars)
repeat(stars_num)
    draw_sprite(spr_stars,irandom(sprite_get_number(spr_stars)),
				random(surf_w),
				random(surf_h))
surface_reset_target()

// for surface drawing
x_ship_st = 0	// ship's starting location
y_ship_st = 0
if instance_exists(obj_ship) {
	x_ship_st = obj_ship.x
	y_ship_st = obj_ship.y
}
x_draw_stars_start = x_ship_st - surf_w * 0.5
y_draw_stars_start = y_ship_st - surf_h * 0.5

x_draw_stars = x_draw_stars_start
y_draw_stars = y_draw_stars_start
stars_parallax = 0.9

//// particle systems
part_sys_effects = part_system_create_layer("Effects", false)
part_sys_effects_deep = part_system_create_layer("Effects_deep", false)


//// projectiles
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