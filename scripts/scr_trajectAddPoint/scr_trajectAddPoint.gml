///@func scr_trajectAddPoint(x,y)
///@arg x
///@arg y
///@arg angle
///@arg sp
function scr_trajectAddPoint(argument0, argument1, argument2, argument3) {

	//size++
	var size = ds_grid_height(gridTraject);
	ds_grid_resize(gridTraject,4,size+1);

	//add point
	gridTraject[# _x,size] = argument0;
	gridTraject[# _y,size] = argument1;
	gridTraject[# _angle,size] = argument2
	gridTraject[# _sp,size] = argument3;


}
