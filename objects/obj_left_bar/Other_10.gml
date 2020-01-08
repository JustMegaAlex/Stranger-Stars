/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

y_displ_hull = chunk_size*(obj_ship.stat_hull_max - obj_ship.stat_hull)
y_st_hull = y_st_hull_full + y_displ_hull
y_displ_shield = chunk_size*(obj_ship.stat_shield_max - obj_ship.stat_shield)
y_st_shield = y_st_shield_full + y_displ_shield