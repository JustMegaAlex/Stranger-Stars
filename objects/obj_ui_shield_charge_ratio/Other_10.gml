
// Inherit the parent event
event_inherited();

var rel_ratio = 1 - obj_ship.stat_shield_charge_ratio/obj_ship.stat_shield_charge_ratio_max
var rel_charge = 1 - obj_ship.stat_shield_charge/obj_ship.stat_shield_charge_max

y_st_ratio = y_st_ratio_full + param_ratio_height*rel_ratio
y_st_charge = y_st_charge_full + param_charge_height*rel_charge