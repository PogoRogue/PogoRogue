/// @description Point arm towards player

if(!instance_exists(parent)) {
	instance_destroy(self);
	exit;
}

x = parent.x + lengthdir_x(length_diff, parent.image_angle + angle_diff);
y = parent.y + lengthdir_y(length_diff, parent.image_angle + angle_diff);

image_angle = point_direction(x, y, target.x, target.y + 300);

if(arm_num == 1) {
	// Right arm
	if(target.x < x) {
		depth = initial_depth + 1;
	} else {
		depth = initial_depth;
	}
} else if (arm_num == 2) {
	// Left arm
	if(target.x > x) {
		depth = initial_depth + 1;
	} else {
		depth = initial_depth;
	}
}
