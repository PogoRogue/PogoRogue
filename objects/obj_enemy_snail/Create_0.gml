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
	while(!place_meeting(x, y + 1, obj_ground_parent)) {
		y++;
	}
} else if(image_angle == -90 || image_angle == 270) {
	state = SNAIL_STATES.VERTICAL_LEFT;
	while(!place_meeting(x - 1, y, obj_ground_parent)) {
		x--;
	}
} else if(image_angle == 90) {
	state = SNAIL_STATES.VERTICAL_RIGHT;
	while(!place_meeting(x + 1, y, obj_ground_parent)) {
		x++;
	}
} else {
	// Do not allow snails of any other orientation
	instance_destroy(self);
}


// Instantiate additional variables
depth = 5;
spd = 0.5;
at_edge = false;
at_wall = false;
