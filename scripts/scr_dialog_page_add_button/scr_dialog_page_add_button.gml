/// scr_dialog_page_add_button(buttons, btn_txt, scr_dialog_next_page)
/// @arg buttons_map
/// @arg button_text
/// @arg button_script
function scr_dialog_page_add_button(argument0, argument1, argument2) {
	var btn = instance_create_depth(0, 0, obj_ui_dialog_window.depth-1, obj_ui_dialog_button)
	btn.text = argument1
	btn.action_script = argument2

	var map = argument0

	if !ds_map_exists(map, "button_list")
		map[? "button_list"] = ds_list_create()
	
	var list = map[? "button_list"]
	ds_list_add(list, btn) 


}
