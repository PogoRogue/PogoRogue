/// @description Instantiate variables

// Inherit the parent event
event_inherited();

enum SNAIL_STATES {
	HORIZONTAL,
	VERTICAL_LEFT,
	VERTICAL_RIGHT,
}

if(place_meeting(x, y + 12, obj_ground_parent)) {
	state = SNAIL_STATES.HORIZONTAL;
	while(!place_meeting(x, y + 1, obj_ground_parent)) {
		y++;
	}
} else if(place_meeting(x - 12, y, obj_ground_parent)) {
	state = SNAIL_STATES.VERTICAL_LEFT;
	image_angle -= 90;
	while(!place_meeting(x - 1, y, obj_ground_parent)) {
		x--;
	}
} else if(place_meeting(x + 12, y, obj_ground_parent)) {
	state = SNAIL_STATES.VERTICAL_RIGHT;
	image_angle += 90;
	while(!place_meeting(x + 1, y, obj_ground_parent)) {
		x++;
	}
} else {
	// Do not allow snails that aren't on a surface
	instance_destroy(self);
}

// Instantiate additional variables
depth = 5;
spd = 0.5;
at_edge = false;
at_wall = false;
