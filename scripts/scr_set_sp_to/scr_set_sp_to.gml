
switch argument0 {
	
	case Sp_level.decrease: {
		sp_level_set = max(sp_level_set - 1, 0)
		break
	}
		
	case Sp_level.increase: {
		sp_level_set = min(sp_level_set + 1, ds_list_size(list_sp_levels)-1)
		break
	}
	
	default:
		sp_level_set = argument0
}

var sp_computed = sp_cruise*list_sp_levels[| sp_level_set]

// compute break_down_dist
break_down_dist = sp_computed*sp_computed*0.5/accel

return sp_computed