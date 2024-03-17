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
		
		if(weapon_cooldown <= 0 and w_alarm_cd == false and windup == true) {
			sprite_index = spr_TurretShoot;
			alarm_set(5,100);
			w_alarm_cd = true;
		}
		
		if(weapon_cooldown <= 0 and windup == false) {
			sprite_index = spr_TurretHead;
			// Create bullet
			var _xx = x + lengthdir_x(48, image_angle);
			var _yy = y + lengthdir_y(48, image_angle)
			var _bullet = instance_create_layer(_xx, _yy, "Instances", obj_enemy_projectile_bullet);
			_bullet.direction = point_direction(x, y, player.x, player.y);
			_bullet.speed = bullet_speed;
			_bullet.homing=true;
			_bullet.hm_spd=0.05;
			_bullet.max_spd=8;
			_bullet.explode=true;
			weapon_cooldown = cooldown_length;
			windup = true;
		}
	}
} else {
	// When player is out of range, reset cooldown
	weapon_cooldown = cooldown_length;
}


// Inherit the parent event
event_inherited();
