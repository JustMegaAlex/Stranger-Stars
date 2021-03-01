function scr_ui_close_dialog() {

	///@decription update and show dialog window
	obj_sys.ui_part = Sys_ui.normal

	with obj_ui_dialog_window {
		page = 0
		visible = false
		dialog_obj = noone
	}

	scr_tactical_pause_activate(false)

	if instance_exists(obj_ui_dialog_button)
		instance_destroy(obj_ui_dialog_button)


}
