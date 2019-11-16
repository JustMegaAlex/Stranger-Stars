
///control tips
if show_tips
	draw_sprite_ext(spr_control_tips, 0, 
					show_tips_x, 
					show_tips_y,
					show_tips_scale, show_tips_scale, 0, c_white, 1)

///debug scripts
scr_debug_scripts_update()

scr_debug_showVar("tip_x", show_tips_x)
scr_debug_showVar("window_w", window_get_width())
scr_debug_showVar("mouse_gui_x", device_mouse_x_to_gui(0))
scr_debug_showVar("window_mouse_x", window_mouse_get_x())
