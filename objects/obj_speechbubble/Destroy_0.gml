if constrain_player = true {
	obj_player.table = false;
	obj_player.can_rotate = true;
	obj_player.lock_unlocked = true;
	obj_player.lock_unlocked_frames = 0;
	
	with obj_drone_tutorial {
		 end_x = 360; 
		 end_y = 5000; 
		 still = false; 
		 y_up = true; 
		 y_add = 0;
		 alarm[0] = 60;
	}
}