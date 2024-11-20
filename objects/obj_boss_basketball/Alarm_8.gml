if freeze = true {
	alarm[8] = 1;
	exit;
}

speed = prev_spd;
direction = prev_dir;

alarm[3] = 420;
spin_mode = false;