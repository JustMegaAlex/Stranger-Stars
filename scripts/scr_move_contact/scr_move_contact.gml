///@arg speed
///@arg dir
x += lengthdir_x(argument0, argument1)
y += lengthdir_y(argument0, argument1)

//столкновение с астероидами
var aster = instance_place(x, y, obj_meteorite)
if aster {
	// считаем относительное смещение при столкновении
	var displacement = scr_distance_betw_line_and_point(x, y, 
														image_angle,
														aster.x,
														aster.y)
	// чем больше смещение, тем меньше эффект от удара
	var size = ( aster.sprite_height + sprite_width) * 0.5
	var gain = ( size - abs(displacement)) / size
	hull_durability -= aster.damage_from_contact * gain * sp
	//if !hull_durability
	//	scr_destroy()
	
	//вылезаем из метеорита
	var dir_out = point_direction(aster.x, aster.y, x, y)
	while place_meeting(x, y, aster) {
		x += lengthdir_x(1, dir_out)
		y += lengthdir_y(1, dir_out)
	}
	
	direction = image_angle + 180 * gain * -sign(displacement)
	rotationDir = -sign(displacement)
	navigate_phase = Navigation.control_lost
	control_lost_time = control_lost_time_max
	
}