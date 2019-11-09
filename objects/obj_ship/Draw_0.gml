/// @description Insert description here
// You can write your code in this editor
//if surface_exists(surf_stars)
//	draw_surface(surf_stars, (x-x_room_start)*stars_parallax, (y-y_room_start)*stars_parallax)

draw_sprite(spr_fly_target, 0, target_x, target_y)

draw_self();


//draw_circle_color(x, y, glide_distance, c_yellow, c_yellow, true)

var size = ds_grid_height(gridTraject);
for(var i=0; i<size-1; i++)
{
	draw_line_width_color(gridTraject[# _x, i],gridTraject[# _y, i],
					gridTraject[#_x,i+1],gridTraject[#_y,i+1],
					3,c_green,c_green);
}

