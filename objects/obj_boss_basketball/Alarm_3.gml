/// @description grow spikes

if freeze = true {
	alarm[3] = 1;
	exit;
}

if size = 4 {
	sprite_index = spr_boss_basketball_spikes;
	mask_index = spr_boss_basketball;
	image_index = 0;
	image_speed = 1;
	spike_mode = true;
	spin_mode = false;
	shot_spikes = false;
	alarm[4] = 300;
	shoot_delay = 5;
}
if size = 2 {
	sprite_index = spr_boss_volleyball_spikes;
	mask_index = spr_boss_volleyball;
	image_index = 0;
	image_speed = 1;
	/// @description shoot spikes
	spin_mode = true;
	spike_mode = true;
	temp_spin_speed = hspeed;
	if abs(temp_spin_speed) < 3 {
		temp_spin_speed = sign(temp_spin_speed) * 3;
	}
	if temp_spin_speed = 0 {
		temp_spin_speed = 3;
	}
	last_spin_speed = temp_spin_speed;
	prev_spd = speed;
	prev_dir = direction;
	alarm[6] = 300;
	shot_spikes = false;
}

if size = 1 {
	spin_mode = true;
		temp_spin_speed = hspeed;
	if abs(temp_spin_speed) < 3 {
		temp_spin_speed = sign(temp_spin_speed) * 3;
	}
	if temp_spin_speed = 0 {
		temp_spin_speed = 3;
	}
	last_spin_speed = temp_spin_speed;
	prev_spd = speed;
	prev_dir = direction;
	image_index = 1;
	slow_down = false;
}