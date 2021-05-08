
//// scontrol tips
if show_tips
	draw_sprite_ext(spr_control_tips, 0, 
					show_tips_x, 
					show_tips_y,
					show_tips_scale, show_tips_scale, 0, c_white, 1)

scr_debug_show_var("mx", ui_mouse_x)
scr_debug_show_var("my", ui_mouse_y)
scr_debug_show_var("dx", obj_ui_dialog_window.x)
scr_debug_show_var("dy", obj_ui_dialog_window.y)
//// debug scripts
scr_debug_scripts_update()