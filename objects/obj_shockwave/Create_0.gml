/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//adjust position
while(!place_meeting(x, y, obj_ground_parent)) {
	y++;
}

while(place_meeting(x, y, obj_ground_parent)) {
	y--;
}

at_wall = false;
