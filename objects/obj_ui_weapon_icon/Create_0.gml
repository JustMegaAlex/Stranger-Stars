
event_inherited()

/// extra subimages
_charge_img = 3
_heat_img = 4

action_script_interact = scr_ui_weapon_icon_activate

/// weapon ui obj
weapon_obj = noone
weapon_spr = noone

// parameters of elements
x_st = 3
param_len = 147 // charge bar and heat bar length
param_heat = 0
param_charge = 0

// aim controller obj
aim_controller = noone

// charge ratio icon obj
charge_ratio_obj = instance_create_layer(x, y, layer, obj_ui_weapon_charge_ratio)
charge_ratio_obj.weapon_icon_obj = id
charge_ratio_obj.weapon_obj = weapon_obj