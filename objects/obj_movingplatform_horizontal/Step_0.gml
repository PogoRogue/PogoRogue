if move_right = true {
	x += spd;
	if place_meeting(x+spd,y,obj_ground) {
		move_right = false;	
	}
}else {
	x -= spd;
	if place_meeting(x+spd,y,obj_ground) {
		move_right = true;	
	}
}