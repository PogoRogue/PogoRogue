/// @description Return to idle

if(instance_exists(body)) {
	previous_hp_percent = body.hp_percent;
}
current_state = STATES.IDLE;