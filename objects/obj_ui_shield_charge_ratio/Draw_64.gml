
draw_self()

draw_sprite_part(sprite_index, 
				_charge_ratio_img,
				0, y_st_ratio, 
				sprite_width, sprite_height, 
				x, y + y_st_ratio)
				
draw_sprite_part(sprite_index, 
				_charge_img, 
				0, y_st_charge, 
				sprite_width, sprite_height, 
				x, y + y_st_charge)