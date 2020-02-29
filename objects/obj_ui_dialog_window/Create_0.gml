visible  = false

m_x = window_mouse_get_x()
m_y = window_mouse_get_y()

text = ""
var x_indent = 60
text_with = sprite_width - x_indent
text_x = x + x_indent * 0.5
text_y = y + 20

// button = noone
btn_x = text_x
btn_y = y + sprite_height - 100
space_between_buttons = 30

//// dialog parameters
page = 0
dialog_obj = noone