/// @description Return to idle

if(instance_exists(body)) {
	previous_hp_percent = body.hp_percent;
}
current_state = BOSS2_STATES.IDLE;
alarm_set(5, idle_pause_duration);

if(instance_exists(body)) {
	body.sprite_index = spr_sequence_open_door;
}

