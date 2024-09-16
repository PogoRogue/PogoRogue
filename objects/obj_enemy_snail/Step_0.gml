/// @description Move left and right or up and down

// Inherit the parent event
event_inherited();


if(state == SNAIL_STATES.HORIZONTAL) {
	// Move left and right
	at_edge = !collision_point(x + (sign(spd) * 15), y + (sprite_height / 2), obj_ground, false, false) and !collision_point(x + (sign(spd) * 15), y + (sprite_height / 2), obj_ground_oneway, false, false); 
	at_wall = place_meeting(x + spd, y, obj_ground) and !place_meeting(x,y,obj_launchpad);
	
	//at_edge = (!position_meeting(bbox_right,bbox_bottom+2,obj_ground) and !position_meeting(bbox_right,bbox_bottom+2,obj_ground_oneway) and image_xscale = 1) or (!position_meeting(bbox_left,bbox_bottom+2,obj_ground) and !position_meeting(bbox_left,bbox_bottom+2,obj_ground_oneway) and image_xscale = -1);
	//at_wall = place_meeting(x+spd,y,obj_ground) and !place_meeting(x-spd,y-1,obj_ground) and !place_meeting(x,y,obj_launchpad);

	if (at_edge or at_wall) {
		spd *= -1;
	}

	if (spd == 0.5) { image_xscale = -1;}
	if (spd == -0.5) { image_xscale = 1;}

	if(is_dead) {
		spd = 0;	
	}

	x += spd;

	if (alarm[1] < 0) {
		alarm[1] = room_speed * 0.15;
	}
} else if(state == SNAIL_STATES.VERTICAL_LEFT || state == SNAIL_STATES.VERTICAL_RIGHT) {
	// Move up and down
	if(state = SNAIL_STATES.VERTICAL_LEFT) {
		//at_edge = !collision_point(x - (sprite_height / 2), y + (sign(spd) * 15), obj_ground_parent, false, false);
		at_edge = (!position_meeting(bbox_left-2,bbox_bottom+1,obj_ground)) and image_xscale = -1 or (!position_meeting(bbox_left-2,bbox_top-1,obj_ground) and image_xscale = 1)
		if (spd == 0.5) { image_xscale = -1;}
		if (spd == -0.5) { image_xscale = 1;}
	}
	
	else if(state = SNAIL_STATES.VERTICAL_RIGHT) {
		//at_edge = !collision_point(x + (sprite_height / 2), y + (sign(spd) * 15), obj_ground_parent, false, false); 
		at_edge = (!position_meeting(bbox_right+2,bbox_bottom+2,obj_ground)) and image_xscale = 1 or (!position_meeting(bbox_right+2,bbox_top-2,obj_ground) and image_xscale = -1)
		if (spd == 0.5) { image_xscale = 1;}
		if (spd == -0.5) { image_xscale = -1;}
	}

	//at_wall = place_meeting(x, y + spd, obj_ground_parent) and !place_meeting(x,y,obj_launchpad);
	at_wall = place_meeting(x,y+spd,obj_ground) and !place_meeting(x,y-spd,obj_ground) and !place_meeting(x,y,obj_launchpad);;

	if (at_edge || at_wall) {
		spd *= -1;
	}

	if(is_dead) {
		spd = 0;	
	}

	y += spd;


	if(alarm[2] < 0) {
		alarm[2] = room_speed * 0.15;
	}
}