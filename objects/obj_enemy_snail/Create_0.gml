/// @description Instantiate variables

// Inherit the parent event
event_inherited();

enum SNAIL_STATES {
	HORIZONTAL,
	VERTICAL_LEFT,
	VERTICAL_RIGHT,
}


if(image_angle == 0) {
	state = SNAIL_STATES.HORIZONTAL;
} else if(image_angle == -90 || image_angle == 270) {
	state = SNAIL_STATES.VERTICAL_LEFT;
} else if(image_angle == 90) {
	state = SNAIL_STATES.VERTICAL_RIGHT;
} else {
	// Do not allow snails of any other orientation
	instance_destroy(self);
}


// Instantiate additional variables
depth = 5;
spd = 0.5;
at_edge = false;
at_wall = false;
