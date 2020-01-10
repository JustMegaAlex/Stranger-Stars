///ui interacting
m_x = window_mouse_get_x()
m_y = window_mouse_get_y()

interacting = collision_point(m_x, m_y, id, true, false)

if interacting
	obj_sys.ui_interacting = interacting