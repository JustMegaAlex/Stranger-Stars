
//Enums
enum Navigation {
	stay,
	get_on_course,
	approach,
	glide,
	take_speed,
	stop
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
sp_cruise = 2;
sp = 0;
sp_to = 0; //sp value to approach

//list of sp levels
list_sp_levels = ds_list_create()
scr_fill_list_from_array(list_sp_levels, [0.25, 0.5, 1, 2])

navigation_cruise_mode = false
sp_level_set = Sp_level.normal
sp_glide = 0;
sp_glide_max = 0.2
glide_distance = 30
image_angle = 90
rotation_sp = 145/room_speed;
accel = 0.05;
rel_target_dir = 0;	//относительное направление к точке следования
hull_full_durability = 100 //прочность корпуса начальная
hull_durability = hull_full_durability	//=//= текущая
direction = 0

target_x = x;
target_y = y;
target_dist = 0

navigate_phase = Navigation.stay

///particles
ps_jet = obj_sys.part_sys_effects_deep;
part_jet = part_type_create();
part_type_life(part_jet,0.35*room_speed,0.25*room_speed);
part_type_sprite(part_jet, spr_partJet, true, true, false);
partSpawnTime = 2;
alarm[0] = partSpawnTime;

//step code
scr_step_code = scr_stub

//delay on destroying
_destroy_alarm = 1
destroy_delay_time = 10