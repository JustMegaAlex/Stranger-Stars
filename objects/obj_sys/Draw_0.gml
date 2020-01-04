
if instance_exists(obj_view) {
	x_draw_stars = obj_view.x
	y_draw_stars = obj_view.y
}

if surface_exists(surf_stars)
	draw_surface(surf_stars, (x_draw_stars-x_room_start)*stars_parallax, (y_draw_stars-y_room_start)*stars_parallax)