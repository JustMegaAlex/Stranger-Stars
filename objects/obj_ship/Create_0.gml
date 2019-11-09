//ini general ship parameters
event_inherited()

//траектория
_x = 0;
_y = 1
_sp = 2;
_angle = 3;
trajectParNumber = 4; //число параметров траектории
gridTraject = ds_grid_create(trajectParNumber,0);
endOfTraject = false;