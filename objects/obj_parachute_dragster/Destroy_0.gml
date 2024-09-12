with obj_player {
	pickup_dragster.on_cooldown = true;	
	if state = state_dragster {
		state = state_free;	
	}
}