
// Inherit the parent event
event_inherited();

// subimages
_hull_img = 1
_shield_img = 2

// hull bar and shield bar params
chunk_size = 28
y_st_hull_full = 143
y_st_shield_full = 3
param_hull_max = 10
param_hull = param_hull_max - 3
param_shield_max = 5
param_shield = param_shield_max - 4

// in step event
y_displ_hull = chunk_size*(param_hull_max - param_hull)
y_st_hull = y_st_hull_full + y_displ_hull
y_displ_shield = chunk_size*(param_shield_max - param_shield)
y_st_shield = y_st_shield_full + y_displ_shield