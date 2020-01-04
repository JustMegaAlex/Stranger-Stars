var m_x = window_mouse_get_x()
var m_y = window_mouse_get_y()

rel_mouse_x = (mouse_x - camera_get_view_x(view_camera[0]))/view_scale
rel_mouse_y = (mouse_y - camera_get_view_y(view_camera[0]))/view_scale

image_index = 0

if collision_point(m_x, m_y, id, false, false)
	image_index = 1