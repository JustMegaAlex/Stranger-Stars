function scr_ui_weapon_icon_activate() {
	aim_controller = instance_create_layer(0, 0, layer, obj_ui_aim)
	aim_controller.weapon_obj = weapon_obj
	obj_sys.ui_part = Sys_ui.ui_obj_controlled
}
