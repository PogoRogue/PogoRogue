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
	
if x >= target_x - 64 and centered = false {
	centered = true;
}