if instance_exists(parent_index) {
	if parent_index.is_dead = false {
		x = parent_index.x;
		y = parent_index.y;
		image_angle = parent_index.rot_angle;
		image_alpha = parent_index.image_alpha;
		depth = parent_index.depth + 2;
	}else {
		instance_destroy();
	}
}else {
	instance_destroy();
}