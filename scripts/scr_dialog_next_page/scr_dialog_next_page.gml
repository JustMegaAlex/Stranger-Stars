function scr_dialog_next_page() {

	with obj_ui_dialog_window {
		page++
		scr_ui_open_dialog(dialog_obj)
	}



}
