x_draw = x + (obj_view.x - x) * draw_parallax
y_draw = y + (obj_view.y - y) * draw_parallax

draw_sprite(sprite_index, 0, x_draw, y_draw)