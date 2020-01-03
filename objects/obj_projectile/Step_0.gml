/// @description Insert description here
// You can write your code in this editor
scr_move(sp, image_angle)

got_him = instance_place(x, y, obj_ship_parent)

if got_him && !(got_him.object_index == obj_ship) {
	got_him.hull_durability -= damage
	
	var xx, yy
	xx = x + lengthdir_x(sprite_width*1.2, image_angle)
	yy = y + lengthdir_y(sprite_width*1.2, image_angle)
	part_particles_create(obj_sys.part_sys_effects,
							xx, yy,
							obj_sys.part_projectile_explosion, 1)
	instance_destroy()
}