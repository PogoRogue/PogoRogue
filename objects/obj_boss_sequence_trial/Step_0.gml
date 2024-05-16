/// @description Handle each state

if(is_done) {
	exit;
}

switch(current_state) {
	case BOSS2_STATES.IDLE:
		// Generate new sequence and animate it
		if(sequence_failed) {			
			sequence_index = 0;
			if(sequence_toggle) {
				current_sequence[0] = 4;
				current_sequence[1] = 5;
				sequence_toggle = !sequence_toggle;
			} else {
				current_sequence[0] = 5;
				current_sequence[1] = 4;
				sequence_toggle = !sequence_toggle;
			}
			player_sequence = array_create(sequence_length, [-1]);
			
			// Schedule animation transitions
			alarm_set(1, idle_pause_duration);
			
			with(obj_button) {
				is_active = false;
			}
			
			sequence_failed = false;
		}
	break;
	case BOSS2_STATES.VULNERABLE:
		if(sequence_index >= 1 && player_sequence[sequence_index - 1] != current_sequence[sequence_index - 1]) {
			// Create a new sequence
			sequence_failed = true;
			current_state = BOSS2_STATES.IDLE;
			current_frame = 4;
			audio_play_sound(snd_beep_placeholder, 0, false, 1, 0, 0.1);
		} else if(sequence_index >= sequence_length) {
			if(array_equals(player_sequence, current_sequence)) {
				// Allow the player through
				sequence_index = 0;
				current_frame = 3;
				audio_play_sound(snd_door, 0, false);
				is_done = true;
			}
		}
	break;
}

image_index = current_frame;

if image_index = 3 {
	mask_index = spr_nothing;	
}