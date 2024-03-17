/// @description Code for generic collision control
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if(is_dead) {
	speed = 0;	
}
if (place_meeting(x + hspeed, y, obj_ground)) {
	hspeed=0;
}if (place_meeting(x, y+vspeed, obj_ground)) {
	vspeed=0;
}
if (hspeed >=0) { image_xscale = 1;}
if (hspeed <0) { image_xscale = -1;}
