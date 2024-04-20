/// @description Point arm towards player

if(!instance_exists(parent)) {
	instance_destroy(self);
	exit;
}

image_angle = point_direction(x, y, target.x, target.y - 20);

x = parent.x + lengthdir_x(length_diff, parent.image_angle);
y = parent.y + lengthdir_y(length_diff, parent.image_angle);

weapon_x = x + lengthdir_x(48, image_angle);
weapon_y = y + lengthdir_y(48, image_angle);


var _half_second = room_speed * 0.5;
draw_laser =  alarm[1] < _half_second
		  || (alarm[1] > _half_second + 4 && alarm[1] < _half_second + 8)
		  || (alarm[1] > _half_second + 12 && alarm[1] < _half_second + 16);