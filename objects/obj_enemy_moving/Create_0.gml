/// @description Instantiate variables

// Inherit the parent event
event_inherited();

// Instantiate additional variables
/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Stats
walk_speed = 0.75;
x_dir = 1;
at_edge = false;

// State info
current_state = ROBOT_STATES.WALKING;
previous_state = current_state;
state_has_changed = false;

hp = 12; 
hp_max = hp;
hp_percent = (hp / hp_max) * 100;

bullet_defense = 0.5;
stomp_defense = 0.75;

var break_num = 0;
var x_init = x;
while !place_meeting(bbox_right,bbox_bottom+1,obj_ground) and !place_meeting(bbox_right,bbox_bottom+1,obj_ground_oneway)
and (place_meeting(bbox_left,bbox_bottom+1,obj_ground) or place_meeting(bbox_left,bbox_bottom+1,obj_ground_oneway)) {
	x -= 1;
	break_num -= 1;
	if abs(break_num) > 100 {
		x = x_init;
		break;
	}
}

while !place_meeting(bbox_left,bbox_bottom+1,obj_ground) and !place_meeting(bbox_left,bbox_bottom+1,obj_ground_oneway)
and (place_meeting(bbox_right,bbox_bottom+1,obj_ground) or place_meeting(bbox_right,bbox_bottom+1,obj_ground_oneway)) {
	x += 1;
	break_num += 1;
	if abs(break_num) > 100 {
		x = x_init;
		break;
	}
}

if place_meeting(x,y,obj_ground) {
	instance_destroy();	
}