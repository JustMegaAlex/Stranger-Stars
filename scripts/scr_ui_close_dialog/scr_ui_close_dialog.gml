
///@decription update and show dialog window
obj_sys.ui_part = Sys_ui.normal
obj_ui_dialog_window.visible = false
scr_tactical_pause_activate(false)

if instance_exists(obj_ui_dialog_button)
	instance_destroy(obj_ui_dialog_button)