/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Calculate velocity
if(!is_dead && dist_to_player < range) {
	spd = is_vertical ? sign(y - player.y) : sign(x - player.x);
} else {
	spd = is_vertical ? sign(initial_y - y) : sign(initial_x - x);
}

dist_from_start = is_vertical ? abs(x + spd - initial_x) : abs(y + spd - initial_y);

if(is_dead) {
	spd = 0;	
}

if scr_In_Camera_View(128) {

	// Apply velocity
	if(is_vertical) {
		if(!position_meeting(x, (y + (24*sign(spd))) + spd, obj_ground_parent) && (!position_meeting(x, (y + (32*sign(spd))) + spd, obj_enemy_turret_mobile)) && dist_from_start < range) {
			y += spd;
		}else if place_meeting(x, (y + (24*sign(spd))) + spd, obj_ground_parent) {
			while !place_meeting(x, (y + (24*sign(spd))) + sign(spd), obj_ground_parent) {
				y += sign(spd);
			}
			spd = 0;
		}else if (!position_meeting(x, (y + (32*sign(spd))) + spd, obj_enemy_turret_mobile)) {
			while !place_meeting(x, (y + (32*sign(spd))) + sign(spd), obj_enemy_turret_mobile) {
				y += sign(spd);
			}
			spd = 0;
		}
	} else {
		if(!place_meeting(x + spd, y, obj_ground_parent) && dist_from_start < range) {
			x += spd;
		}
	}
}