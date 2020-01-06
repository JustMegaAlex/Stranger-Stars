
// Inherit the parent event
event_inherited();

// subimages
_hull_img = 1
_shield_img = 2

// hull bar and shield bar params
chunk_size = 25
y_st_hull_full = 143
y_st_shield_full = 3
param_hull_max = 10
param_hull = param_hull_max
param_shield_max = 5
param_shield = param_shield_max

// in step event
y_st_hull = y_st_hull_full + chunk_size*(param_hull_max - param_hull)
y_st_shield = y_st_shield_full + chunk_size*(param_shield_max - param_shield)