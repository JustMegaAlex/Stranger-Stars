///@arg dialog_obj
///@decription update and show dialog window
function scr_ui_open_dialog(argument0) {
	obj_sys.ui_part = Sys_ui.dialog
	obj_ui_dialog_window.visible = true
	scr_tactical_pause_activate(true)

	if instance_exists(obj_ui_dialog_button)
		instance_destroy(obj_ui_dialog_button)

	with obj_ui_dialog_window {
	
		dialog_obj = argument0
	
		dialog_data = scr_get_dialog_data(dialog_obj) // map data structure
	
		if !ds_map_empty(dialog_data) {
			// ini dialog
			text = dialog_data[? "text"]
			var list = dialog_data[? "button_list"]
			if list
				for(i = 0; i < ds_list_size(list); i++) {
					var button = list[| i]
					button.x = btn_x
					button.y = btn_y + i*space_between_buttons
					button.x_text = button.x + 8
					button.y_text = button.y - font_get_size(fnt_ui) * 0.6
				}
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


}
