/// @description Rotate to point to player

dist_to_player = distance_to_object(player);

// Check if the player is within range
if(!is_dead && dist_to_player < range) {
	// Only update if player is in the field of view as well
	//can_see_player = !collision_line(x, y, player.x, player.y, obj_ground, false, true);
	can_see_player = true;
	if(can_see_player) {
		target_angle = point_direction(x, y, player.x, player.y);
		
		if rotation = 180 {
			if obj_player.x < x {
				scr_Gradually_Turn(self,obj_player,15,1);
				direction = image_angle;
				can_shoot = true;
			}else {
				can_shoot = false;	
				weapon_cooldown = cooldown_length;	
				
			}
			can_shoot = true;
		}else if rotation = 0 {
			if obj_player.x > x {
				scr_Gradually_Turn(self,obj_player,15,1);
				direction = image_angle;
				can_shoot = true;
			}else {
				can_shoot = false;	
				weapon_cooldown = cooldown_length;
			}		
		}

		// Fire when ready 
		weapon_cooldown--;
		
		if(weapon_cooldown <= 0 and w_alarm_cd == false and windup == true) and sprite_index != shooting_sprite {
			sprite_index = shooting_sprite;
			audio_play_sound(snd_turret_charge,0,false);
		}
		
		if sprite_index = shooting_sprite and floor(image_index) = 16 { //(weapon_cooldown <= 0 and windup == false) and can_shoot {
			// Create bullet
			var _xx = x + lengthdir_x(48, image_angle);
			var _yy = y + lengthdir_y(48, image_angle);
			if(pattern == obj_enemy_projectile_bullet) {
				var _bullet = instance_create_depth(_xx, _yy, -9, obj_enemy_projectile_bullet);
				_bullet.direction = other.direction;
				_bullet.speed = bullet_speed;
				audio_play_sound(snd_turret_shoot,0,false);
			} else {
				var _pattern = instance_create_depth(_xx, _yy, -9, pattern);
				_pattern.parent = self;
				_pattern.dir_central = other.direction;
			}
			weapon_cooldown = cooldown_length;
			windup = true;
		}
	}
	if scr_Animation_Complete() and sprite_index = shooting_sprite {
		sprite_index = default_sprite;
		image_index = 0;
	}
	show_debug_message("ACTIVE");
}else {
	// When player is out of range, reset cooldown
	weapon_cooldown = cooldown_length;
	can_shoot = false;
	sprite_index = default_sprite;
	image_index = 0;
}

if is_dead {
	image_alpha = 0;	
	if break_away = false {
		instance_create_depth(x,y,depth,obj_turret_breakaway_head,{
			sprite_index: sprite_index,
			image_angle: image_angle,
			image_index: image_index,
			image_speed: 0,
			image_xscale: image_xscale,
			image_yscale: image_yscale,
		});
		instance_create_depth(x,y,depth,obj_turret_breakaway_body,{
			sprite_index: body_sprite,
			image_angle: rotation,
			image_index: 0,
			image_speed: 0,
			image_xscale: 1,
			image_yscale: 1,
		});
		break_away = true;
	}
}



// Inherit the parent event
event_inherited();



//show_debug_message(angle);
//show_debug_message(target_angle);