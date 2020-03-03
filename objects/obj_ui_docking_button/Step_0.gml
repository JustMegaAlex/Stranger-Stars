
// Inherit the parent event
event_inherited()

visible = false

if point_distance(obj_ship.x, 
					obj_ship.y, 
					obj_space_station.x, 
					obj_space_station.y) < obj_sys.ui_station_interact_distance
	visible = true