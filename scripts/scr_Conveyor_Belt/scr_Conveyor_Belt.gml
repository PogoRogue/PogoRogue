// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Conveyor_Belt(){
	if (place_meeting(x, y+3, obj_conveyor_belt)) and !(place_meeting(x+4*sign(conveyor_speed),y-3,obj_ground)) {
		if (instance_place(x, y+3, obj_conveyor_belt).image_xscale > 0) {
			conveyor_speed = 4;
		}else {
			conveyor_speed = -4;
		}
		x += conveyor_speed;
	}else if (conveyor_speed != 0) and !(place_meeting(x+4*sign(conveyor_speed),y-3,obj_ground)) {
		hspeed = conveyor_speed;
		conveyor_speed = 0;
		state = state_free;
		charge = 0;
		image_index = 0;
		animation_complete = false;
		free = true;
	}else {
		speed = 0;	
	}
	
	if place_meeting(x+conveyor_speed,y-4,obj_ground) and conveyor_speed > 0 {
		x -= conveyor_speed;
	}
	if place_meeting(x+conveyor_speed,y-4,obj_ground) and conveyor_speed < 0 {
		x -= conveyor_speed;
	}
	
	with obj_player_mask {
		if place_meeting(x+other.conveyor_speed,y,obj_ground) and other.conveyor_speed > 0 {
		other.x -= other.conveyor_speed;
		}
		if place_meeting(x+other.conveyor_speed,y,obj_ground) and other.conveyor_speed < 0 {
			other.x -= other.conveyor_speed;
		}	
	}
}