
event_inherited()

/// subimages
_default = 0
_interact_img = 1
_checked_img = 2
_charge_img = 3
_heat_img = 4

/// weapon ui obj
weapon_spr = spr_weapon_1


// parameters of elements
x_st = 3
param_len = 147 // charge bar and heat bar length
param_heat = 0

// charge ratio icon obj
instance_create_layer(x, y, layer, obj_ui_weapon_charge_ratio)
instance_create_depth(x, y, depth - 1, obj_ui_weapon_1)