
image_index = _default

if instance_exists(aim_controller) {
	instance_destroy(aim_controller)
	aim_controller = noone
	obj_sys.ui_controller = noone
}