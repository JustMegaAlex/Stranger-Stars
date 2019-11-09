///@arg point_x
///@arg point_y

var radius = sp/degtorad(rotation_sp)
var center_x, center_y, angle
angle = image_angle + 90*sign(rel_target_dir)
center_x = x + lengthdir_x(radius, angle)
center_y = y + lengthdir_y(radius, angle)

if point_distance(center_x, center_y, argument0, argument1) > radius
	return true
	
return false



