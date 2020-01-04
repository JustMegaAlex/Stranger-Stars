var m_x = window_mouse_get_x()
var m_y = window_mouse_get_y()

image_index = 0

if collision_point(m_x, m_y, id, false, false)
	image_index = 1