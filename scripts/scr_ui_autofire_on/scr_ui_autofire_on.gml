function scr_ui_autofire_on() {


	obj_sys.weapon_autofire_active = !obj_sys.weapon_autofire_active
	image_index = _checked_img * obj_sys.weapon_autofire_active


}
