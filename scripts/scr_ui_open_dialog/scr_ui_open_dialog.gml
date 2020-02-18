
///@decription update and show dialog window
obj_sys.ui_part = Sys_ui.dialog
obj_ui_dialog_window.visible = true
scr_tactical_pause_activate(true)

with obj_ui_dialog_window {
	// get text
	ini_open("dialogs.ini")
	text = ini_read_string("text", "text", "damn it")

	// create button
	button = instance_create_layer(btn_x, btn_y, layer, obj_ui_)
}
