/// @description Rotate to point to player

dist_to_player = distance_to_object(player);

// Check if the player is within range
if(!is_dead && dist_to_player < range) {
	// Only update if player is in the field of view as well
	can_see_player = true//!collision_line(x, y, player.x, player.y, obj_ground, false, true);
	if(can_see_player) {
		image_angle = point_direction(x, y, player.x, player.y);
		
		// Fire when ready
		weapon_cooldown--;
		if(weapon_cooldown <= 0) {
			// Create explosion
			
			var _delay = instance_create_layer(player.x, player.y, "Instances", obj_explosion_delay);
		
			weapon_cooldown = cooldown_length;
		}
	}
}


// Inherit the parent event
event_inherited();
