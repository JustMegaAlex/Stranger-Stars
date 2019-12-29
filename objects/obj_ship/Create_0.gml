//ini general ship parameters
event_inherited()

//weapon system
projectile_obj = obj_projectile
reloading = 0

instance_create_layer(0, 0, "Instances", obj_ship_controller)
instance_create_layer(0, 0, "Instances", obj_aim)


//траектория
_x = 0;
_y = 1
_sp = 2;
_angle = 3;
trajectParNumber = 4; //число параметров траектории
gridTraject = ds_grid_create(trajectParNumber,0);

scr_step_code = scr_ship_step_code