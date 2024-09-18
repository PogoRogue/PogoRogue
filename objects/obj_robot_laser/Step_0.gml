if scr_Animation_Complete() {
	image_speed = 0;
	x += h_spd;
}

if instance_exists(parent) {
	with parent {
		other.x += walk_speed * x_dir	
	}
}

if image_speed = -1 {
	x += h_spd;
	//x += h_spd;
}

if place_meeting(x + h_spd*2,y,obj_ground) {
	depth = 50;	
}

if image_speed = -1 and floor(image_index) <= 1 {
	instance_destroy();
}