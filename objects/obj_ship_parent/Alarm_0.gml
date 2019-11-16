/// @description Insert description here
// You can write your code in this editor
///particle spawn
if(!obj_sys.active_pause_activated && sp)
	part_particles_create(psJet,
                            x-lengthdir_x(part_create_dist,image_angle),
                            y-lengthdir_y(part_create_dist,image_angle),
                            partJet,1);
alarm[0] = partSpawnTime;