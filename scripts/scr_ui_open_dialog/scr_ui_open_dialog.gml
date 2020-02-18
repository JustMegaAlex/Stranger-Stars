
///@decription update and show dialog window
obj_sys.ui_part = Sys_ui.dialog
obj_ui_dialog_window.visible = true
scr_tactical_pause_activate(true)

with obj_ui_dialog_window {
	// get text
	ini_open("dialogs.ini")
	text = ini_read_string("text", "text", "damn it")

	// create button
	button = instance_create_depth(btn_x, btn_y, depth - 1, obj_ui_dialog_button)
	button.text = ini_read_string("text", "button", "oops")
	
	ini_close()
}
