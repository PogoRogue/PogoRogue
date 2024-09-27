/// @description Point arm towards player

if(!instance_exists(parent)) {
	instance_destroy(self);
	exit;
}

scr_Gradually_Turn(self.id,obj_player,15,0.2);

image_angle = point_direction(x, y, target.x, target.y + 128);

x = parent.x + lengthdir_x(length_diff, parent.image_angle);
y = parent.y + lengthdir_y(length_diff, parent.image_angle);

weapon_x = x + lengthdir_x(48, image_angle);
weapon_y = y + lengthdir_y(48, image_angle);


var _half_second = room_speed * 0.5;
if boss.weapon = BOSS3_WEAPONS.LASER {
	_half_second = room_speed * 1;
}
draw_laser =  alarm[1] < _half_second
		  || (alarm[1] > _half_second + 4 && alarm[1] < _half_second + 8)
		  || (alarm[1] > _half_second + 12 && alarm[1] < _half_second + 16);
		  
if(arm_num == 1) {
	// Right arm
	if(target.x < x) {
		depth = initial_depth - 1;
	} else {
		depth = initial_depth;
	}
} else if (arm_num == 2) {
	// Left arm
	if(target.x > x) {
		depth = initial_depth - 1;
	} else {
		depth = initial_depth;
	}
}