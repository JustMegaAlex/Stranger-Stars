///@arg x_on_the_line
///@arg y_on_the_line
///@arg line_angle
///@arg x_point
///@arg y_point

//расстояние между точками
var dist = point_distance(argument0, argument1, argument3, argument4)
// угол прямой, проходящей через точки
var angle_points_line = point_direction(argument0, argument1, argument3, argument4)
//относительный угол
var relative_angle = scr_get_rel_dir(angle_points_line, argument2)
return lengthdir_y(dist, relative_angle)