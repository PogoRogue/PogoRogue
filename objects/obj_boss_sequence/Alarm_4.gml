/// @description Perform melee attack

if(current_state == STATES.ATTACKING) {
	instance_create_depth(slime_melee_pos.x, slime_melee_pos.y, -20, obj_boss_sequence_melee);
	alarm_set(4, (16 - (2 * sequence_length)) * room_speed);
}