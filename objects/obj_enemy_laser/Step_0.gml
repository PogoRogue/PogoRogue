/// @description Insert description here
// You can write your code in this editor

if(alarm[0] > 10) {
	width_percent = min(1.0, width_percent + 0.1);
} else {
	width_percent = max(0.0, width_percent - 0.1);
}

if(parent != noone) {
	x = parent.x + lengthdir_x(64, parent.image_angle);
    y = parent.y + lengthdir_y(64, parent.image_angle);
}

current_angle += angle_increment/4;

end_x = x + lengthdir_x(collision_range, current_angle);
end_y = y + lengthdir_y(collision_range, current_angle);

// Find the collision point with the ground
if(collide_with_walls) {
	var _result = scr_Collision_Line_Point(x, y, end_x, end_y, obj_ground, true, true);
	if(_result.r != noone) {
		end_x = _result.x;
		end_y = _result.y;
	}
}

// Check if hitting player to deal damage
var _collision = collision_line(x, y, end_x, end_y, obj_player_mask, true, true);
if(_collision != noone) {
	if(damage > 0) and obj_player.current_iframes <= 0 {
		scr_Player_Damaged(damage);
		damage = 0;
	}
}

scr_Screen_Shake(2,1,false);