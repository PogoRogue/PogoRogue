/// @description Handle each state

switch(current_state) {
	case STATES.IDLE: // Idle code goes here
		
		// Generate new sequence and animate it
		if(state_has_changed) {
			if(body.hp_percent >= 100) {
				sequence_length = 2;
			} else if(body.hp_percent >= 66) {
				sequence_length = 3;
			} else if(body.hp_percent >= 33) {
				sequence_length = 4;
			} else {
				sequence_length = 5;
			}
			
			instance_destroy(obj_enemy_turret);
			instance_destroy(obj_spikeswing);
			
			with(obj_electric_current) {
				is_active = false;
			}
			
			current_frame = 4;
			sequence_index = 0;
			current_sequence = scr_Generate_Sequence(sequence_length);
			player_sequence = array_create(sequence_length, [-1]);
			
			// Schedule animation transitions
			alarm_set(0, light_duration * 2);
		}
	break;
	case STATES.ATTACKING: // Attacking code goes here
		// Check for sequence match
		
		if(state_has_changed) {
			instance_destroy(obj_enemy_turret);
			instance_destroy(obj_spikeswing);
			
			instance_create_layer(turret_pos_1.x, turret_pos_1.y, "enemies", obj_enemy_turret);
			instance_create_layer(turret_pos_2.x, turret_pos_2.y, "enemies", obj_enemy_turret);
			instance_create_layer(axe_pos.x, axe_pos.y, "enemies", obj_spikeswing, {distance: 120});
			
			with(obj_electric_current) {
				is_active = true;
			}
		}
		
		if(sequence_index >= sequence_length) {
			if(array_equals(player_sequence, current_sequence)) {
				// Allow the player to attack
				current_state = STATES.VULNERABLE;
				sequence_index = 0;
			} else {
				// Create a new sequence
				current_state = STATES.IDLE;
			}
		}
	break;
	case STATES.VULNERABLE: // Vulnerable code goes here
		current_frame = 5;
		if(state_has_changed) {
			instance_destroy(obj_enemy_turret);
			instance_destroy(obj_spikeswing);
			
			with(obj_electric_current) {
				is_active = false;
			}
			
			alarm_set(2, room_speed * 10);
		}
	break;
	case STATES.DEAD: // Dead code goes here
		image_alpha *= 0.9;
		if(state_has_changed) {
			instance_destroy(obj_enemy_turret);
			instance_destroy(obj_spikeswing);
			with(obj_electric_current) {
				is_active = false;
			}
			alarm_set(3, room_speed * 2);
		}
	break;
}

if(!instance_exists(body) || body.hp <= 0) {
	current_state = STATES.DEAD;
}

state_has_changed = previous_state != current_state;
previous_state = current_state;
image_index = current_frame;

