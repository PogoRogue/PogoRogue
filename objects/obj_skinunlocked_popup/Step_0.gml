if move_up = true {
	if frames_to_move > 0 {
		frames_to_move -= move_spd;
		y -= move_spd;
	}else {
		move_spd = 0;
		move_up = false;
		alarm[0] = 300;
	}
}else {
	if frames_to_move < frames_to_move_max {
		frames_to_move += move_spd;
		y += move_spd;
		if move_spd != 0 {
			move_spd += 0.1;
		}
	}	
}