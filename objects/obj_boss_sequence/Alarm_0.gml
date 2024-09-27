/// @description Animate current sequence then transition to attack state

if(sequence_index < sequence_length) {
	current_frame = current_sequence[sequence_index];
	sprite_index = spr_boss2_sequence_lights;
	alarm_set(1, light_duration);
	var _pitch = 0.5 + (current_sequence[sequence_index] * 0.15);
	audio_play_sound(snd_beep_placeholder, 0, false, 1, 0, _pitch);
	sequence_index++;
} else {
	if sprite_index = spr_boss2_sequence_lights {
		sequence_index = 0;
		current_frame = 4;
		sequence_failed = false;
		current_state = BOSS2_STATES.ATTACKING;
	}else {
		alarm[0] = 1;	
	}
}