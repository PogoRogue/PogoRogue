/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

start_spd = 6; //starting speed
spd = start_spd;
max_spd = 6; //max speed

if instance_exists(obj_slot_machine) {
	follow_object = obj_slot_machine;
}else {
	follow_object = noone;	
}

damage = 16;
image_speed = 0;