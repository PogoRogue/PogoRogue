if instance_exists(worm) {
	if(!worm.is_dead) {
		//show_message("1");
		if (alarm[0] < 0) {
		  alarm[0] = room_speed * 10 ;
		}
	}
}