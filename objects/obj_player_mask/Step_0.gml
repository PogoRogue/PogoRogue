with parent_index {
	if (place_meeting(x,y+vspeed,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway)) and vspeed > 0 {
		other.player_colliding = true;
	}else if (place_meeting(x,y+vspeed,obj_ground) and vspeed > 0) {
		other.player_colliding = true;
	}else {
		other.player_colliding = false;	
	}
	
	
}

if player_colliding = false {
	//top left corner
	if (place_meeting(x,y+parent_index.vspeed,obj_walltopleftcorner) and parent_index.vspeed >= 0 and left_corner = false and top = false) {
		if (hspeed > 0) {
			parent_index.hspeed *= -0.35;
		}else {
			parent_index.hspeed = -2;
		}
	
		parent_index.vspeed *= -0.5;
	
		left_corner = true;
		alarm[0] = 5;
	
		other.parent_index.dash_time = 0;
	
		//prevent groundpound collision glitch
		if parent_index.state = parent_index.state_groundpound or parent_index.state = parent_index.state_parachute {
			parent_index.state = parent_index.state_free;
		}
	}


	//top right corner
	if (place_meeting(x,y+parent_index.vspeed,obj_walltoprightcorner) and parent_index.vspeed >= 0 and right_corner = false and top = false) {
		if (hspeed < 0) {
			parent_index.hspeed *= -0.35;
		}else {
			parent_index.hspeed = 2;
		}
		parent_index.vspeed *= -0.5;
	
		right_corner = true;
		alarm[0] = 5;
	
		other.parent_index.dash_time = 0;
	
		//prevent groundpound collision glitch
		if parent_index.state = parent_index.state_groundpound or parent_index.state = parent_index.state_parachute {
			parent_index.state = parent_index.state_free;
		}
	}
}

//bottom left corner
if (place_meeting(x,y+parent_index.vspeed-1,obj_wallbottomleftcorner) and parent_index.vspeed < 0 and bottom_left_corner = false) {
	if (hspeed > 0) {
		parent_index.hspeed *= -0.35;
	}
	
	parent_index.vspeed *= -0.5;
	
	bottom_left_corner = true;
	alarm[0] = 2;
	
	other.parent_index.dash_time = 0;
}


//bottom right corner
if (place_meeting(x,y+parent_index.vspeed-1,obj_wallbottomrightcorner) and parent_index.vspeed < 0 and bottom_right_corner = false) {
	if (hspeed < 0) {
		parent_index.hspeed *= -0.35;
	}
	
	parent_index.vspeed *= -0.5;
	
	bottom_right_corner = true;
	alarm[0] = 2;
	
	other.parent_index.dash_time = 0;
}