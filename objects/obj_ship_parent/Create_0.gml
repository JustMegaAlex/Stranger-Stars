
//Enums
enum Navigation {
	stay,
	control,
	get_on_course_pre,
	get_on_course,
	approach,
	glide,
	take_speed,
	stop,
	stun
}

enum Sp_level {	//ref to list_sp_levels
	low,
	moderate,
	normal,
	boost,
	increase,
	decrease
}

//////////ini general ship parameters
sp_cruise = 2
sp = 0
sp_to = 0 //sp value to approach

//list of sp levels
list_sp_levels = ds_list_create()
scr_fill_list_from_array(list_sp_levels, [0.25, 0.5, 1, 2])

///////////////navigation
navigation_cruise_mode = false //true -> not stoping after reaching target point
break_down_dist = 0	// dist to stop at the target point
rot_radius = 0		// radius of rotating trajectory
sp_level_set = Sp_level.normal
sp_glide = 0
sp_glide_max = 0.2
glide_distance = 30
image_angle = 90
rotation_sp = 145/room_speed;
accel = 0.05
rel_target_dir = 0	//относительное направление к точке следования
hull_full_durability = 100 //прочность корпуса начальная
hull_durability = hull_full_durability	//=//= текущая
direction = 0

//stun state
stun_set_time = 30
stun_time = 0
dir = 0
stun_bounce = 0.3
stun_sp_tolerance = sp_cruise*stun_bounce

target_x = x
target_y = y
dir_target_x = x
dir_target_y = y
target_dist = 0

scr_navigation_set(Navigation.stay)

/////////////////particles
ps_jet = obj_sys.part_sys_effects_deep
part_jet = part_type_create()
part_type_life(part_jet, 0.35*room_speed, 0.25*room_speed)
part_type_sprite(part_jet, spr_partJet, true, true, false)
partSpawnTime = 2
alarm[0] = partSpawnTime

////////////////step code
scr_step_code = scr_stub

/////delay on destroying
_destroy_alarm = 1
destroy_delay_time = 10

/////////////////////stats
stat_hull_max = 10
stat_hull = stat_hull_max
stat_shield_max = 5
stat_shield = stat_shield_max
stat_reactor_power = 5
stat_weapon_charge_max = 600
stat_weapon_charge = 0
stat_shield_charge_max = 300
stat_shield_charge = 0