if slow_down = false {
	if snowball_alpha < 1 {
		snowball_alpha += 0.05	
	}	
	if white_alpha < 1 {
		white_alpha += 0.01;
	}
}else {
	if snowball_alpha > 0 {
		//snowball_alpha -= 1/60;
	}	
}

if snowball_speed > 0 and slow_down = true {
	snowball_speed -= snowball_speed_max/60;
}else if slow_down = true {
	snowball_speed = 0;
	with obj_snowball {
		//instance_destroy();
	}
	if white_alpha > 0 {
		white_alpha -= 0.005;
	}else {
		instance_destroy();
		slow_down = false;
	}	
}

if slow_down = true {
	if white_alpha > 0 {
		white_alpha -= 0.005;
	}else {
		instance_destroy();	
	}	
}else {
	
}

//set snowball speed
with obj_snowball {
	if other.slow_down = true {
		hspeed = -other.snowball_speed_max*1.5;
		vspeed = (other.snowball_speed_max);
	}else {
		hspeed = -other.snowball_speed*1.5;
		vspeed = (other.snowball_speed);
	}
	x -= x_add;
	y += y_add;
	
	image_alpha  = other.snowball_alpha;
}

with obj_player {
	if state = state_free or state = state_parachute {
		hspeed -= (0.15*other.white_alpha);
		vspeed += (0.06*other.white_alpha);
	}
}