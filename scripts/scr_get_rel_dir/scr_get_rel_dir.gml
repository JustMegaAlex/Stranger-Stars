///@desc get relative angle between two angles
///@arg first_angle
///@arg second_angle

//знак относительного угла
var rel_dir = argument1 - argument0;
//rel_dir_sign = rel_dir_sign -!rel_dir_sign; //1 или -1
//relative_dir = (argument0 - argument1)*rotationDir;

//поправка rotationDir
if(abs(rel_dir)>180) rel_dir = (360 - abs(rel_dir)) * -sign(rel_dir)

return rel_dir