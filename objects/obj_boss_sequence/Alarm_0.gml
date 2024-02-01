/// @description Animate current sequence then transition to attack state

if(sequence_index < sequence_length) {
	current_frame = current_sequence[sequence_index];
	sequence_index++;
	alarm_set(1, light_duration);
} else {
	sequence_index = 0;
	current_frame = 4;
	current_state = STATES.ATTACKING;
}