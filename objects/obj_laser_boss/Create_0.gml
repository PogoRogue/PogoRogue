image_speed = 1;

start_x = 0;
start_y = 0;

if instance_exists(obj_subboss_shield) {
	parent_index = instance_nearest(x,y,obj_subboss_shield);
}else {
	parent_index = noone;
}
spawned = false;
spawned2 = false;
alarm[1] = 2;

damage = 0;

xxx = 0;

mask_index = spr_nothing;