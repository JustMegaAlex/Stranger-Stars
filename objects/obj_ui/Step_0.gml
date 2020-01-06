///ui interacting
var m_x = window_mouse_get_x()
var m_y = window_mouse_get_y()

interacting = collision_point(m_x, m_y, id, false, false)

if interacting
	obj_sys.ui_interacting = interacting