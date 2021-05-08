///@arg acceleration
///@arg speed_max
function scr_accelerate(argument0, argument1) {
	var delta = argument1 - sp
	if abs(delta) < argument0
		return argument1
	else
		return sp + argument0*sign(delta)


}
