if scr_Animation_Complete() {
	image_speed = 0;
	x += h_spd;
}

if instance_exists(parent) {
	with parent {
		other.x += walk_speed * x_dir	
	}
}