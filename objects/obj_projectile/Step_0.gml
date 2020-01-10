
image_angle = point_direction(x, y, target.x, target.y)

scr_move(sp, image_angle)

if place_meeting(x, y, target) {
	var xx, yy
	xx = x + lengthdir_x(sprite_width*1.2, image_angle)
	yy = y + lengthdir_y(sprite_width*1.2, image_angle)
	part_particles_create(obj_sys.part_sys_effects,
							xx, yy,
							obj_sys.part_projectile_explosion, 1)
	instance_destroy()
}