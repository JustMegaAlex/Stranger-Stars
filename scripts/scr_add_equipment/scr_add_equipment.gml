///@arg ship_obj
///@arg equipm_obj
var ship_obj = argument0
var equipm_obj = argument1

// create equipment object instance
var equipm_inst = instance_create_layer(0, 0, "UI", equipm_obj)

switch equipm_obj.type {
	case "weapon": {
		var weapon_num = array_length_1d(ship_obj.arr_weapon_objects)
		//check if there are slots for new weapon
		if weapon_num > ship_obj.max_weapons_number {
			var ship_name = object_get_name(ship_obj.object_index)
			var equip_name = object_get_name(equipm_obj.object_index)
			instance_destroy(equipm_inst)
			show_error("weapon number limit exceeded: ("+ship_name+", "+equip_name+")", false)
			return
		}
		// add weapon
		ship_obj.arr_weapon_objects[weapon_num] = equipm_inst
		// add ui weapon icon
		var xx = obj_sys.arr_weapon_icon_positions[weapon_num]
		var yy = obj_sys.ui_weapon_icon_coord_y
		var icon_obj = instance_create_layer(xx, yy, "UI", obj_ui_weapon_icon)
		icon_obj.weapon_obj = equipm_inst
		icon_obj.weapon_spr = equipm_inst.sprite_index
		break
	}
}

// assign ship instance var 
equipm_inst.ship_obj = ship_obj