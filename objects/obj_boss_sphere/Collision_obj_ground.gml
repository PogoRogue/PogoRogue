/// @description Bounce off walls

var i = 1;
while(true) {
	if(!place_meeting(x + i, y, obj_ground)) {
		x += i;
		hspeed *= -1;
		num_of_bounces += 1;
		//show_debug_message(num_of_bounces);
		break;
	}else if(!place_meeting(x - i, y, obj_ground)) {
		x -= i;
		hspeed *= -1;
		num_of_bounces += 1;
		//show_debug_message(num_of_bounces);
		break;
	}else if(!place_meeting(x, y + i, obj_ground)) {
		y += i;
		vspeed *= -1;
		num_of_bounces += 1;
		//show_debug_message(num_of_bounces);
		break;
	}else if(!place_meeting(x, y - i, obj_ground)) {
		y -= i;
		vspeed *= -1;
		num_of_bounces += 1;
		//show_debug_message(num_of_bounces);
		break;	
	}
	i++;
}


