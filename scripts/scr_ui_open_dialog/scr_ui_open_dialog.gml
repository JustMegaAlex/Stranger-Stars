///@arg dialog_obj
///@decription update and show dialog window
obj_sys.ui_part = Sys_ui.dialog
obj_ui_dialog_window.visible = true
scr_tactical_pause_activate(true)

with obj_ui_dialog_window {
	
	dialog_data = scr_get_dialog_data(argument0) // map data structure
	
	if !ds_map_empty(dialog_data) {
		// ini dialog
	}
	//// get text
	//ini_open("dialogs.ini")
	//text = ini_read_string("text", "text", "damn it")

	//// create button
	//button = instance_create_depth(btn_x, btn_y, depth - 1, obj_ui_dialog_button)
	//button.text = ini_read_string("text", "button", "oops")
	//button.image_xscale = 200
	
	//ini_close()
}