
//// Enums
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

#region navigation
function target_navigation_correction() {
	omega_sign = sign(rel_target_dir)
	omega = degtorad(rotation_sp * omega_sign)
	rc = 1000
	if omega != 0
		rc = abs(sp / omega)
	xc = x + lengthdir_x(rc * omega_sign, image_angle + 90) 
	yc = y + lengthdir_y(rc * omega_sign, image_angle + 90)	
}

function target_navigation_correction_debug_draw() {
	draw_line(x, y, xc, yc)
	draw_circle(xc, yc, rc, true)
}

///implements ships' navigation
function scr_navigate() {

	target_dist = point_distance(x, y, target_x, target_y)

	switch navigate_phase
	{
		case Navigation.stay: {
			scr_set_dir_point(dir_target_x, dir_target_y)
			break
		}

		case Navigation.control: {
			// just keep moving if sp > 0
			scr_move_contact(sp, image_angle)

			if target_dist > glide_distance {
				scr_navigation_set(Navigation.get_on_course)
			}
			else if target_dist {
				scr_navigation_set(Navigation.glide)
			}
			break
		}

		case Navigation.stop: {
			sp = scr_approach(sp, 0, accel)
			scr_move_contact(sp, image_angle)
			if sp < accel {
				scr_navigation_set(Navigation.stay)
			}
			break
		}

		case Navigation.get_on_course_pre: {
			scr_move_contact(sp, image_angle)
			target_dir = scr_get_dir_to_point(target_x, target_y)
			rel_target_dir = angle_difference(target_dir, image_angle)

			if scr_point_is_approachable(target_x, target_y) {
				scr_navigation_set(Navigation.get_on_course)
			}
			break
		}

		case Navigation.get_on_course: {
			
			correct = point_distance(xc, yc, target_x, target_y)

			 if point_distance(xc, yc, target_x, target_y) < rc
				sp_to -= accel
			
			sp = scr_approach(sp, sp_to, accel)
			scr_move_contact(sp, image_angle)
			scr_set_dir_point(target_x, target_y)

			if abs(rel_target_dir) < rotation_sp {
				image_angle = target_dir
				scr_navigation_set(Navigation.approach)
			}
			break
		}

		case Navigation.approach: {
			sp = scr_approach(sp, sp_cruise, accel)
			scr_move_contact(sp, image_angle)

			if !navigation_cruise_mode
				if target_dist < break_down_dist
					scr_navigation_set(Navigation.stop)

			break
		}

		case Navigation.glide: {
			scr_move_contact(sp, image_angle)
			scr_navigation_set(Navigation.stay)
			break
		}

		case Navigation.stun: {
			stun_time--
			scr_move_contact(sp, dir)
			if !stun_time {
				scr_navigation_set(Navigation.stay)
			}
		}
	}
}

function scr_navigation_set(phase) {

	navigate_phase = phase

	switch navigate_phase
	{
		case Navigation.stay: {
			dir_target_x = x + lengthdir_x(1, image_angle)
			dir_target_y = y + lengthdir_y(1, image_angle)
			scr_set_fly_target(x, y)
			break
		}
	
		case Navigation.control: {
			break
		}
	
		case Navigation.take_speed: {
			sp_to = scr_set_sp_to(Sp_level.normal)
			break
		}
		
		case Navigation.stop: {
			break
		}
	
		case Navigation.get_on_course_pre: {
			break
		}
		
		case Navigation.get_on_course: {
			break
		}
		
		case Navigation.approach: {
			sp_to = sp_cruise
			break
		}
		
		case Navigation.glide: {
			break
		}
	}
}

function scr_set_dir_point(x, y) {
	target_dir = scr_get_dir_to_point(x, y)
	rel_target_dir = angle_difference(target_dir, image_angle)
	image_angle += rotation_sp * sign(rel_target_dir)

	if abs(rel_target_dir) < rotation_sp
		image_angle = target_dir
}

function scr_set_fly_target(x, y) {
	//set fly-target coordinates
	target_x = x;
	target_y = y;
	//set navigation
	navigate_phase = Navigation.stay
	set_navigation_true = true
}

#endregion

//// images
image_angle = 90
image_speed = 0
_img_shield_up = 1
shield_anim_var = 0
shield_anim_ratio = 0.05

//// ini general ship parameters
sp_cruise = 8
sp = 0
sp_to = 0 //sp value to approach

// list of sp levels
list_sp_levels = ds_list_create()
scr_fill_list_from_array(list_sp_levels, [0.25, 0.5, 1, 2])

// navigation
navigation_cruise_mode = false //true -> not stoping after reaching target point
break_down_dist = 0	// dist to stop at the target point
rot_radius = 0		// radius of rotating trajectory
sp_level_set = Sp_level.normal
sp_glide = 0
sp_glide_max = 0.2
glide_distance = 30
rotation_sp = 145/room_speed;
accel = 0.2
rel_target_dir = 0	//относительное направление к точке следования
direction = 0

// stun state
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
// navigation correction
omega_sign = 0
omega = 0
rc = 1000
xc = 0
yc = 0

// shooting
target_to_shoot = noone

scr_navigation_set(Navigation.stay)

// particles
ps_jet = obj_sys.part_sys_effects_deep
part_jet = part_type_create()
var life_seconds = 0.25
part_type_life(part_jet, life_seconds*room_speed, life_seconds*room_speed)
part_type_sprite(part_jet, spr_partJet, true, true, false)
partSpawnTime = 2
alarm[0] = partSpawnTime

//// step code
scr_step_code = scr_stub

//// delay on destroying
_destroy_alarm = 1
destroy_delay_time = 10

//// stats
hull_full_durability = 100 //прочность корпуса начальная
hull_durability = hull_full_durability	//=//= текущая

stat_hull_max = 10
stat_hull = stat_hull_max

stat_reactor_power = 5
stat_reactor_power_spare = stat_reactor_power

stat_shield_max = 5
stat_shield = 2
stat_shield_charge_max = 300
stat_shield_charge = 0
stat_shield_charge_ratio_max = 5
stat_shield_charge_ratio = 0

//// weapons
arr_weapon_objects = []
max_weapons_number = 2

// late init
alarm[2] = -1 //off
