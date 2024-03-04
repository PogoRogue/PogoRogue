if float = true {
	if float_up = true {
		y += float_speed;
		float_speed -= 0.025;
		if float_speed <= -float_max {
			float_up = false;
		}
	}else {
		y += float_speed;
		float_speed += 0.025;
		if float_speed >= float_max {
			float_up = true;
		}
	}
}else {
	//move onto screen
	if y < 102 {
		if point_distance(x,y,x,104) > 64 {
			if move_spd < 4 {
				move_spd += 0.1;	
			}
		}else {
			move_spd = (point_distance(x,y,x,104)/64)*4;
		}
		y += move_spd;	
	}else {
		float = true;	
	}
}