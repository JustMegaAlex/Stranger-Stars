m_x = window_mouse_get_x()
m_y = window_mouse_get_y()

if obj_sys.ui_part == Sys_ui.dialog
	if obj_sys.mouse_left
		if !collision_point(m_x, m_y, id, false, false) {
			visible = false
			obj_sys.ui_part = Sys_ui.normal
		}
