
switch argument0 {
	
	case Sp_level.increase: {
		sp_level_set = max(ds_list_find_index(list_sp_levels, sp_level_set)-1, 0)
		break
	}
		
	case Sp_level.decrease: {
		sp_level_set = min(ds_list_find_index(list_sp_levels, sp_level_set)+1,
							ds_list_size(list_sp_levels)-1)
	}
	
	default:
		sp_level_set = argument0
}

return sp_cruise*list_sp_levels[| sp_level_set]