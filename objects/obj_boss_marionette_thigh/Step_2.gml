/// @description Point arm towards player

if(!instance_exists(parent) || !instance_exists(target)) {
	instance_destroy(self);
	exit;
}

x = parent.x + lengthdir_x(length_diff, parent.image_angle + angle_diff);
y = parent.y + lengthdir_y(length_diff, parent.image_angle + angle_diff);

image_angle = lerp(image_angle, parent.image_angle, 0.04);

with(leg) {
	x = parent.x + lengthdir_x(length_diff, parent.image_angle - 90);
	y = parent.y + lengthdir_y(length_diff, parent.image_angle - 90);
}

if(leg_num == 1) {
	// Right leg
	if(target.x < x) {
		depth = initial_depth + 1;
	} else {
		depth = initial_depth;
	}
} else if (leg_num == 2) {
	// Left leg
	if(target.x > x) {
		depth = initial_depth + 1;
	} else {
		depth = initial_depth;
	}
}
