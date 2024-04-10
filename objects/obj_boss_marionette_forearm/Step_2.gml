/// @description Point arm towards player

if(!instance_exists(parent)) {
	instance_destroy(self);
	exit;
}

x = parent.x + lengthdir_x(length_diff, parent.image_angle);
y = parent.y + lengthdir_y(length_diff, parent.image_angle);

image_angle = point_direction(x, y, target.x, target.y);
