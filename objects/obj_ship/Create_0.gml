//ini general ship parameters
event_inherited()

//weapon system
projectile_obj = obj_projectile
reloading = 0

instance_create_layer(0, 0, "Instances", obj_ship_controller)

scr_step_code = scr_ship_step_code