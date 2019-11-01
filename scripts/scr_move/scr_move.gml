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
	var size = aster.sprite_height*0.5
	var gain = ( size - abs(displacement)) / size
	hull_durability -= aster.damage_from_contact * gain * sp
	if !hull_durability
		scr_destroy()
	place_meeting(x, y, aster)
}