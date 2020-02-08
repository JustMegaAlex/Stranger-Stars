//// ui interacting
m_x = window_mouse_get_x()
m_y = window_mouse_get_y()

interacting = false

if obj_sys.ui_part == Sys_ui.normal {
	
	mouse_over_me = collision_point(m_x, m_y, id, true, false)

	if mouse_over_me
		obj_sys.ui_part = Sys_ui.ship_systems
}
else if obj_sys.ui_part == Sys_ui.ship_systems {
	
	mouse_over_me = collision_point(m_x, m_y, id, true, false)
	
	if mouse_over_me
		interacting = true
}