/// @description Move onto screen
var distance = distance_to_point(target_x, y);

if(distance <= 100){
	spd_multiply = distance / 100;
}
	
//move onto screen
if (x < target_x and moving_in = true) {
	x += spd * spd_multiply;
}else if x >= target_x and moving_in = true {
	x = target_x;
	moving_in = false;
}
	
if x >= target_x - 256 and centered = false {
	centered = true;
	alarm[0] = 135;
}

if fade_away = true {
	if spd2 < 16 {
		spd2 += 1;
	}
	x += spd2;
	alpha -= 0.025	
	if alpha <= 0 {
		instance_destroy();	
	}
}