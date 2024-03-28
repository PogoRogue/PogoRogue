/// @description Instantiate variables

// Inherit the parent event
event_inherited();

if(!instance_exists(obj_slime_outline)) {
	instance_create_layer(0, 0, "enemies", obj_slime_outline);
}

enum SNAIL_STATES {
	HORIZONTAL,
	VERTICAL_LEFT,
	VERTICAL_RIGHT,
}


state = SNAIL_STATES.HORIZONTAL;
alarm[3] = 1;

// Instantiate additional variables
depth = 5;
spd = 0.5;
at_edge = false;
at_wall = false;
