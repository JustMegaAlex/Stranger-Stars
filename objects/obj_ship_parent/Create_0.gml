/// @description Insert description here
// You can write your code in this editor


//////////ini general ship parameters
sp_max = 2.8;
sp = 0;
sp_set = 0; //к какой скорости стремиться
sp_glide = 0;
sp_glide_max = 0.2
glide_distance = 30
image_angle = 90
rotation_sp = 90/room_speed;
accel = 0.01;
rel_target_dir = 0;	//относительное направление к точке следования
rotationDir = 0;	//куда вращаться чтобы выйти на точку следования
hull_full_durability = 100 //прочность корпуса начальная
hull_durability = hull_full_durability	//=//= текущая
angle_drifting = rotation_sp * 0.5 //дрифт ориентации при потере управления
control_lost_time_max = 1.7 * room_speed
control_lost_time = 0
direction = 0

target_x = x;
target_y = y;

//navigation system
enum Navigation{
	stay,
	get_on_course,
	get_on_course_deccelerate,
	approach,
	glide,
	control_lost
}
navigate_phase = Navigation.stay
set_navigation_true = false

///particles
part_create_dist = 12
psJet = part_system_create();
partJet = part_type_create();
part_type_life(partJet,0.35*room_speed,0.25*room_speed);
part_type_sprite(partJet,spr_partJet,true,true,false);
partSpawnTime = 2;
alarm[0] = partSpawnTime;

//step code
scr_step_code = scr_stub