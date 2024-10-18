if place_meeting(x,y,obj_ground) {
	var freeze_fix = 0;
	while collision_line(x-24,y-16,x-24,y+16,obj_ground,false,true) != noone {
		x += 1;
		if freeze_fix > 100 {
			break;	
		}
	}
	freeze_fix = 0;
	while collision_line(x+24,y-16,x+24,y+16,obj_ground,false,true) != noone {
		x -= 1;
		if freeze_fix > 100 {
			break;	
		}
	}
	freeze_fix = 0;
	while collision_line(x-16,y-24,x+16,y-24,obj_ground,false,true) != noone {
		y += 1;
		if freeze_fix > 100 {
			break;	
		}
	}
	freeze_fix = 0;
	while collision_line(x-16,y+24,x+16,y+24,obj_ground,false,true) != noone {
		y -= 1;
		if freeze_fix > 100 {
			break;	
		}
	}
}