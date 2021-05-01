
function scr_get_dialog_data(obj){

	var page_data = ds_map_create()
	var text = ""
	var page = obj_ui_dialog_window.page
	var btn_text = ""

	if !object_exists(obj)
		obj = obj.object_index

	switch obj {
		case obj_scout: {
			if obj.already_talked
				page = 4
			
			switch page {
				case 0: {
					text = "Ооо! Надо же. Новый посетитель самого пустого места во вселенной."
					btn_text = "Привет"
					scr_dialog_page_add_button(page_data, btn_text, scr_dialog_next_page)
					scr_dialog_page_add_button(page_data, "Ну это только пока, я работаю... Привет.", scr_dialog_next_page)
					break
				}
				case 1: {
					text = "И вам не хворать. Дай угадаю: ты спасаешь галактику. Или просто мимо пролетал?"
					btn_text = "Эээ... Проверяю тут, все ли в порядке"
					scr_dialog_page_add_button(page_data, btn_text, scr_dialog_next_page)
					break
				}
				case 2: {
					text = "Хах, ну хорошо."
					btn_text = "Так тут все в порядке?"
					scr_dialog_page_add_button(page_data, btn_text, scr_dialog_next_page)
					break
				}
				case 3: {
					text = "Дааа, все в поряде"
					btn_text = "Вот и славно"
					scr_dialog_page_add_button(page_data, btn_text, scr_ui_close_dialog)
					obj.already_talked = true
					break
				}
				case 4: {
					text = "Вообще-то, мне тут сильно астероиды мешают, ты не мог бы добавить в игру ульматрон или в мультирезонатор какой-нибудь?"
					btn_text = "Сейчас метнусь..."
					scr_dialog_page_add_button(page_data, btn_text, scr_ui_close_dialog)
					break
				}
			}
			break	
		}
	
		case obj_space_station: {
			text = "Добро пожаловать на станцию"
			break
		}
	}

	page_data[? "text"] = text
	return page_data
}

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

function scr_dialog_next_page() {
	with obj_ui_dialog_window {
		page++
		scr_ui_open_dialog(dialog_obj)
	}
}
