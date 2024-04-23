/// @description Point arm towards player

if(!instance_exists(parent) || !instance_exists(target) || !instance_exists(boss)) {
	instance_destroy(self);
	exit;
}

image_angle = lerp(image_angle, parent.image_angle, 0.06);

if(leg_num == 1) {
	// Right leg
	if(target.x < x) {
		depth = initial_depth - 1;
	} else {
		depth = initial_depth;
	}
} else if (leg_num == 2) {
	// Left leg
	if(target.x > x) {
		depth = initial_depth - 1;
	} else {
		depth = initial_depth;
	}
}
