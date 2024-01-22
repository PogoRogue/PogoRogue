/// @description Rotate to point to player

dist_to_player = distance_to_object(player);

// Check if the player is within range
if(!is_dead && dist_to_player < range) {
	// Only update if player is in the field of view as well
	can_see_player = !collision_line(x, y, player.x, player.y, obj_ground, false, true);
	if(can_see_player) {
		image_angle = point_direction(x, y, player.x, player.y);
		
		// Fire when ready
		weapon_cooldown--;
		if(weapon_cooldown <= 0) {
			// Create bullet
			xdiff=min(abs(player.x-x),50);
			ydiff=min(abs(player.y-y),50);
			if(player.x<x){
			 xdiff=-xdiff; 
			}
			if(player.y<y){
			  ydiff=-ydiff;
			}
			
			var _bullet = instance_create_layer(x+xdiff, y+ydiff, "Instances", obj_melee);
			_bullet.direction = point_direction(x, y, player.x, player.y);
			_bullet.speed = 1;
			weapon_cooldown = cooldown_length;
		}
	}
}


// Inherit the parent event
event_inherited();
