if instance_exists(parent_obj) {
	x = parent_obj.x;
	y = parent_obj.y;
	image_index = 1;
	image_speed = 0;
	depth = parent_obj.depth + 1;
}else {
	instance_destroy();	
}