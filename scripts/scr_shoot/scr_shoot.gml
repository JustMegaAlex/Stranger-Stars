
var projectile = instance_create_layer(x, y, "Instances", projectile_obj)

projectile.image_angle = scr_get_dir_to_point(obj_aim.x, obj_aim.y)
reloading = 0
obj_aim.visible = false