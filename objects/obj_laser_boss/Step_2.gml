if instance_exists(parent_index) {
	start_x = parent_index.x + lengthdir_x(25,parent_index.image_angle+90);
	image_angle = parent_index.image_angle+90;
	start_y = parent_index.y + lengthdir_y(25,parent_index.image_angle+90);
	x = start_x + lengthdir_x(16,parent_index.image_angle+90);
	y = start_y + lengthdir_y(16,parent_index.image_angle+90); 
}


if spawned = true and instance_exists(parent_index) {
	image_xscale = 128;
}

//mask_index = sprite_index;