
if !obj_sys.active_pause_activated {
	script_execute(scr_step_code)
}

//// ui update
scr_ui_update()

///shield animation
shield_anim_var = scr_approach(shield_anim_var, 0, shield_anim_ratio)