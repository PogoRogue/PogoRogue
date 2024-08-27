with obj_player {
	if other.hacker = false {
		pickup_slowmo.cooldown_time = pickup_slowmo.max_cooldown_time;
		pickup_slowmo.on_cooldown = true;
	}else {
		//pickup_hacker.cooldown_time = pickup_slowmo.max_cooldown_time;
		//pickup_hacker.on_cooldown = true;
	}
}