/// @description Animate current sequence then transition to attack state

if(sequence_index < sequence_length) {
	current_frame = current_sequence[sequence_index] - 4;
	alarm_set(1, light_duration);
	var _pitch = current_sequence[sequence_index] * 0.15;
	audio_play_sound(snd_beep_placeholder, 0, false, 1, 0, _pitch);
	sequence_index++;
} else {
	sequence_index = 0;
	current_frame = 2;
	sequence_failed = false;
	current_state = STATES.VULNERABLE;
	
	with(obj_button) {
		is_active = true;
	}
}