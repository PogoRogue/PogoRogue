if instance_exists(parent_obj) {
	x = parent_obj.x + parent_x_diff;
	y = parent_obj.y + parent_y_diff;
	image_alpha = parent_obj.image_alpha;
	
	if basketball_stuck = true {
		instance_destroy();
	}
}else if grounded = false {
	instance_destroy();
}