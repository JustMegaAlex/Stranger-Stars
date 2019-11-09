/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_ship) {
	x = obj_ship.x
	y = obj_ship.y
}

scr_cameraSetCenter(view_camera[0], x, y)