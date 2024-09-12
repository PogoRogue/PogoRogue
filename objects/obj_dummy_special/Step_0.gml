/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if bounced_times >= 5 and shot_times >= 10 {
	//unlock gate	
	with obj_room_gate_close_tutorial2 {
		destroy = true;
		sprite_index = spr_gate_open_new;
		image_speed = 1;
	}
}