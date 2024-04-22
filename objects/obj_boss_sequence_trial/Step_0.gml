/// @description Handle each state

if(is_done) {
	exit;
}

// Collide with player
/*
if(place_meeting(x, y, obj_player_mask)) {
	with(obj_player) {
		while(place_meeting(x, y, obj_boss_sequence_trial)) {
			y++;
		}
		speed = 0;
	}
}
*/

switch(current_state) {
	case BOSS2_STATES.IDLE:
		// Generate new sequence and animate it
		if(sequence_failed) {			
			sequence_index = 0;
			if(irandom(1) == 0) {
				current_sequence[0] = 4;
				current_sequence[1] = 5;
			} else {
				current_sequence[0] = 5;
				current_sequence[1] = 4;
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
				is_done = true;
				is_done = true;
				//instance_destroy(wall);
			}
		}
	break;
}

image_index = current_frame;

if image_index = 3 {
	mask_index = spr_nothing;	
}