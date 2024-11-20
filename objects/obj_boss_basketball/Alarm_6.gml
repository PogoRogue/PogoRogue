/// @description Insert description here
// You can write your code in this editor

if freeze = true {
	alarm[6] = 1;
	exit;
}

sprite_index = spr_boss_volleyball;
mask_index = spr_boss_volleyball;
image_index = 0;
image_speed = 0;
alarm[3] = 420;
spike_mode = false;
spin_mode = false;
damage = 0;
launched_num = 0;

speed = prev_spd;
direction = prev_dir;

with obj_boss_spike_shootv {
	if parent_index = other {
		//instance_destroy();
		retract = true;
	}
}