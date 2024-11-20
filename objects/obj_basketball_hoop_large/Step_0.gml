if !instance_exists(obj_boss_ball_trigger) and instance_exists(obj_boss_basketball) {

	if move_left = true and x > 241 + 48 {
		x -= 0.5;
	}else if move_left = true {
		move_left = false;
	}

	if move_left = false and x < 527 - 48 {
		x += 0.5;
	}else if move_left = false {
		move_left = true;
	}

}