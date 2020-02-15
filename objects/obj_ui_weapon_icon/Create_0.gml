
event_inherited()

/// extra subimages
_charge_img = 3
_heat_img = 4

activate_script = scr_ui_weapon_icon_activate

/// weapon ui obj
weapon_spr = spr_weapon_1

// parameters of elements
x_st = 3
param_len = 147 // charge bar and heat bar length
param_heat = 0

// aim controller obj
aim_controller = noone

// charge ratio icon obj
instance_create_layer(x, y, layer, obj_ui_weapon_charge_ratio)
instance_create_depth(x, y, depth - 1, obj_ui_weapon_1)