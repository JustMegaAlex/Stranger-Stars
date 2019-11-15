/// @description Insert description here
// You can write your code in this editor
scr_move(sp, image_angle)

got_him = instance_place(x, y, obj_ship_parent)

if got_him && !(got_him.object_index == obj_ship)
	instance_destroy()