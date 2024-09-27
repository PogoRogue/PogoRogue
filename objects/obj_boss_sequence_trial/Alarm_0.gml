/// @description Animate current sequence then transition to attack state

if(sequence_index < sequence_length) {
	if sprite_index != spr_boss2_sequence_lights_trial_unlocked {
		current_frame = current_sequence[sequence_index] - 4;
	}
	alarm_set(1, light_duration);
	var _pitch = current_sequence[sequence_index] * 0.15;
	audio_play_sound(snd_beep_placeholder, 0, false, 1, 0, _pitch);
	sequence_index++;
	if current_frame = 3 {
	if sprite_index != spr_boss2_sequence_lights_trial_unlocked {
		sprite_index = spr_boss2_sequence_lights_trial_unlocked;
		image_index = 0;
		image_speed = 1;
	}
}
} else {
	sequence_index = 0;
	current_frame = 2;
	sequence_failed = false;
	current_state = BOSS2_STATES.VULNERABLE;
	
	with(obj_button) {
		is_active = true;
	}
}