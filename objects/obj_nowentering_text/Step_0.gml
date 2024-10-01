if ready = true {
	if alpha > 0 {
		alpha -= 0.02;	
	}else {
		move_off_screen = true;	
	}

	if move_off_screen = true {
		y_subtract += move_spd2;	
		if move_spd2 < 4 {
			move_spd2 += 0.2;
		}
		if y_subtract >= 80 {
			instance_destroy();	
		}
	}else {
		var distance = abs(64 - (64-y_subtract));

		if(distance <= 32){
			spd_multiply = distance / 32;
		}
	
		//move onto screen
		if (y_subtract > 0) {
			y_subtract -= move_spd * spd_multiply;
		}else if y_subtract <= 0 {
			y_subtract = 0;
		}
	}
}