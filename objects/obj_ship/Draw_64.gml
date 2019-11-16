/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_ui)


var color = make_color_rgb(43, 255, 163)
draw_text_color(30, 30, 
				"Weapon charge: " + string(reloading),
				color, color, color, color, 1)


/*
scr_debug_showVar("relative dir",rel_target_dir)
scr_debug_showVar("nav phase",navigate_phase)
scr_debug_showVar("hull",hull_durability)

//scr_debug_showVar("size",ds_grid_height(gridTraject));
//scr_debug_showGrid(gridTraject,200,30);