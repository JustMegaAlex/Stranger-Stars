///arg@ x
///arg@ y
target_dir = scr_get_dir_to_point(argument0, argument1)
rel_target_dir = angle_difference(target_dir, image_angle)
image_angle += rotation_sp * sign(rel_target_dir)