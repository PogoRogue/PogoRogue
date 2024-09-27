/// @description Handle each state

if(!fight_started) {
	with(obj_spikeswing) {
		is_active = false;
	}
			
	with(obj_button) {
		if(button_id <= 3){
			is_active = false;
		}
	}
			
	with(obj_enemy_turret_unkillable) {
		is_active = false;
		alarm_set(2, 0);
	}
			
	with(obj_electric_current) {
		alarm[0] = 1;
	}
	current_sprite = 7;
	
	mask_index = spr_nothing;
	exit;
}

// Force an inactive state if the boss is dead or doesn't exist
if(!instance_exists(body) || body.is_dead) {
	current_state = BOSS2_STATES.INACTIVE;
	depth = obj_player.depth+10;
}

// Set current hp segment
if(instance_exists(body)) and current_state = BOSS2_STATES.IDLE {
	if(body.hp_percent > hp_thresholds[2]) {
		current_hp_segment = 2;
	} else if(body.hp_percent > hp_thresholds[1]) {
		current_hp_segment = 1;
	} else if(body.hp_percent >= hp_thresholds[0]) {
		current_hp_segment = 0;
	}
}
		
switch(current_state) {
	case BOSS2_STATES.IDLE: // Idle code goes here
		
		// Generate new sequence and animate it
		if(state_has_changed) {
			if(instance_exists(body)) {
				if(body.hp_percent > hp_thresholds[2]) {
					sequence_length = 2;
				} else if(body.hp_percent > hp_thresholds[1]) {
					sequence_length = 3;
				} else if(body.hp_percent > hp_thresholds[0]) {
					sequence_length = 4;
				}
			}
			
			alarm_set(4, 0);
			
			with(obj_boss_sequence_melee) {
				hp = 0;
				is_dead = true;
			}
			
			with(obj_spikeswing) {
				is_active = false;
			}
			
			with(obj_button) {
				is_active = false;
			}
			
			with(obj_enemy_turret_unkillable) {
				is_active = false;
				alarm_set(2, 0);
			}
			
			with(obj_electric_current) {
				alarm[0] = 1;
			}
			
			sequence_index = 0;
			current_sequence = scr_Generate_Sequence(sequence_length);
			player_sequence = array_create(sequence_length, [-1]);
			
			// Schedule animation transitions
			alarm_set(1, idle_pause_duration);
		}
	break;
	case BOSS2_STATES.ATTACKING: // Attacking code goes here
		// Check for sequence match
		sprite_index = spr_boss2_sequence_lights;
		if(state_has_changed) {
			alarm_set(4, (12 - (2 * sequence_length)) * room_speed);
			
			with(obj_spikeswing) {
				is_active = true;
			}
			
			with(obj_button) {
				is_active = true;
			}
			
			with(obj_enemy_turret_unkillable) {
				is_active = true;
				sprite_index = default_sprite;
				cooldown_length = (2 - (other.sequence_length / 4)) * room_speed
			}
			
			with(obj_electric_current) {
				is_active = true;
				alarm[0] = room_speed * on_time;
			}
		}
		
		if(sequence_index >= 1 && player_sequence[sequence_index - 1] != current_sequence[sequence_index - 1]) and image_speed = 0 {
			// Create a new sequence
			sequence_failed = true;
			current_frame = 6;
			audio_play_sound(snd_beep_placeholder, 0, false, 1, 0, 0.1);
			current_state = BOSS2_STATES.IDLE;
		}
		
		if(sequence_index >= sequence_length) {
			if(array_equals(player_sequence, current_sequence)) {
				// Allow the player to attack
				current_state = BOSS2_STATES.VULNERABLE;
				sequence_index = 0;
			} else {
				// Create a new sequence
				sequence_failed = true;
				current_frame = 6;
				audio_play_sound(snd_beep_placeholder, 0, false, 1, 0, 0.1);
				current_state = BOSS2_STATES.IDLE;
			}
		}
	break;
	case BOSS2_STATES.VULNERABLE: // Vulnerable code goes here
		//current_frame = 5;
		if sprite_index != spr_boss2_sequence_lights_unlocked {
			sprite_index = spr_boss2_sequence_lights_unlocked;
			image_index = 0;
			image_speed = 1;
		}

		if(body.hp_percent < hp_thresholds[current_hp_segment]) { //previous_hp_percent - 34
			body.hp_percent = hp_thresholds[current_hp_segment];
			previous_hp_percent = body.hp_percent;
			body.hp = body.hp_percent * 3;
			current_state = BOSS2_STATES.IDLE;
			if sprite_index != spr_boss2_sequence_lights_unlocked {
				sprite_index = spr_boss2_sequence_lights_unlocked;
				image_index = 7;
				image_speed = -1;
			}
			alarm_set(2, 0);
			alarm_set(5, idle_pause_duration);
			body.sprite_index = spr_sequence_open_door;
		}
		
		if(state_has_changed) {
			audio_play_sound(snd_door, 0, false);
			
			with(obj_boss_sequence_melee) {
				hp = 0;
				is_dead = true;
			}
			
			with(obj_spikeswing) {
				is_active = false;
			}
			
			with(obj_button) {
				is_active = false;
			}
			
			with(obj_enemy_turret_unkillable) {
				is_active = false;
				alarm_set(2, 0);
			}
			
			with(obj_electric_current) {
				alarm[0] = 1;
			}
			
			alarm_set(2, vulnerable_duration);
			
			body.sprite_index = spr_sequence_close_door;
		}
		break;
	case BOSS2_STATES.INACTIVE: // Inactive code goes here
		if(state_has_changed) {			
			with(obj_spikeswing) {
				is_active = false;
			}
			
			with(obj_enemy_turret_unkillable) {
				is_active = false;
				alarm_set(2, 0);
			}
			
			with(obj_electric_current) {
				alarm[0] = 1;
			}
			
			with(obj_button) {
				is_active = false;
			}
			if sprite_index != spr_boss2_sequence_lights_unlocked and spawned = false and reset = false {
				sprite_index = spr_boss2_sequence_lights_unlocked;
				image_index = 7;
				image_speed = 0;
			}
			//current_frame = 5;
			if instance_exists(body) {
				body.sprite_index = spr_sequence_defeated;
			}
		}
	break;
}

state_has_changed = previous_state != current_state;
previous_state = current_state;
if sprite_index != spr_boss2_sequence_lights_unlocked {
	image_index = current_frame;
}

if spawned = true {
	if white_alpha > 0 {
		white_alpha -= 0.05;
	}
}else {
	if reset = false and spawned = false {
		sprite_index = spr_boss2_sequence_lights_unlocked;
		image_index = 8;
		image_speed = -1;
		reset = true;
	}
	if white_alpha < 1 {
		//white_alpha += 0.05;
	}else {
		spawned = true;
		sprite_index = spr_boss2_sequence_lights;
	}
	
	if image_index <= 1 {
		spawned = true;
		sprite_index = spr_boss2_sequence_lights;
	}
}

if image_index <= 1 and image_speed = -1 {
	sprite_index = spr_boss2_sequence_lights;
}

if instance_exists(obj_boss_sequence_slime) and sprite_index != spr_boss2_sequence_lights_unlocked {
	depth = obj_boss_sequence_slime.depth - 1;
}else if sprite_index = spr_boss2_sequence_lights_unlocked {
	if (scr_Animation_Complete() or image_index >= 7) and image_speed = 1 {
		image_speed = 0;
		image_index = 7;
	}
	if (image_speed = -1 and current_state != BOSS2_STATES.IDLE) {
		depth = obj_player.depth + 10;
	}else {
		depth = obj_boss_sequence_slime.depth - 1;	
	}
}else {
	depth = obj_boss_sequence_slime.depth - 1;
}
if abs(image_index) >= 7 and image_speed = 1 {
	image_speed = 0;
	image_index = 7;
}

if sprite_index != spr_boss2_sequence_lights_unlocked {
	image_index = current_frame;
}
show_debug_message(image_index);
show_debug_message(sprite_get_name(sprite_index));

if sprite_index = spr_boss2_sequence_lights_unlocked {
	//mask_index = spr_nothing;	
}

if(!instance_exists(body) || body.is_dead) {
	depth = obj_player.depth+10;
}

if floor(image_index = 7) and image_speed = 0 and sprite_index = spr_boss2_sequence_lights_unlocked {
	mask_index = spr_nothing;	
}else if floor(image_index = 5 )and image_speed = 0 and sprite_index = spr_boss2_sequence_lights {
	mask_index = spr_nothing;	
}else {
	mask_index = sprite_index;	
}