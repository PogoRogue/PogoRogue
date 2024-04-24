/// @description Create objects and despawn

with(obj_boss_marionette_controller) {
	current_state = BOSS3_STATES.ATTACK_1;
}

with(obj_player) {
	state = state_free;
}

instance_create_depth(x, y, -20, obj_boss_marionette_health);

with obj_boss_marionette_trigger {
	instance_destroy();	
}