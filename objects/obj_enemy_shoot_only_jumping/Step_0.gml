/// @description Jump towards player when in range

// Inherit the parent event
event_inherited();


is_grounded = place_meeting(x, y + 1, obj_ground) || place_meeting(x, y + 1, obj_ground_oneway);
at_wall = place_meeting(x + h_spd, y, obj_ground);

if(place_meeting(x + h_spd, y, obj_ground)) {
	while(!place_meeting(x + sign(h_spd), y, obj_ground)) {
		x += sign(h_spd);
	}
	h_spd *= -0.5;
}

if(is_grounded) {
	h_spd *= 0.8;
}

if(!place_meeting(x + h_spd, y, obj_ground)) {
	x += h_spd;
}

// When in range, jump towards the player
if(!is_dead && distance_to_object(player) <= jump_range) {
	
	// Jump towards player
	if (is_grounded) {
		// Head towards the player
		if(jump_cooldown <= 0) {
			sprite_index = spr_enemy_shoot_only_jump;
			image_index = 0;
			jump_cooldown = cooldown_length;
			alarm_set(1, 1.4 * room_speed);
		}
	}
}

jump_cooldown = max(jump_cooldown - 1, 0);
