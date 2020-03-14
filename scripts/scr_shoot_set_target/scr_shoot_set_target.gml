///@arg weapon_obj
///@arg target
var weapon_obj = argument0
var target = argument1

if weapon_obj.stat_charge == weapon_obj.stat_charge_max {
	var proj = instance_create_layer(x, y, layer, weapon_obj.projectile_obj)
	proj.target = target
	proj.weapon = weapon_obj
	weapon_obj.stat_charge = 0
}
else {
	weapon_obj.target = target
}