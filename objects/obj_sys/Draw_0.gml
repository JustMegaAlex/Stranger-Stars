
//// draw background
// precalculate bgr coords
if instance_exists(obj_view) {
	x_draw_stars = x_draw_stars_start + (obj_view.x - x_ship_st) * stars_parallax
	y_draw_stars = y_draw_stars_start + (obj_view.y - y_ship_st) * stars_parallax
}

//draw
if surface_exists(surf_stars)
	draw_surface(surf_stars, x_draw_stars, y_draw_stars)