function scr_ui_comm_point_target() {
	instance_create_layer(0, 0, layer, obj_ui_comm_cursor)
	obj_sys.ui_part = Sys_ui.ui_obj_controlled
	image_index = _default
}
