///@arg point_x
///@arg point_y

var radius = sp/degtorad(rotation_sp)
var center_x, center_y, angle
angle = image_angle + 90*sign(rel_target_dir)
center_x = x + lengthdir_x(radius, angle)
center_y = y + lengthdir_y(radius, angle)

if !instance_exists(obj_draw_circle)
	instance_create_layer(center_x, center_y, layer,obj_draw_circle)

obj_draw_circle.x = center_x
obj_draw_circle.y = center_y
obj_draw_circle.radius = radius

if point_distance(center_x, center_y, argument0, argument1) > radius
	return true
	
return false



