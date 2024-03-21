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

if(place_meeting(x, y + 12, obj_ground_outer)) {
	state = SNAIL_STATES.HORIZONTAL;
	while(!place_meeting(x, y + 1, obj_ground_outer)) {
		y++;
	}
} else if(place_meeting(x - 12, y, obj_ground_outer)) {
	state = SNAIL_STATES.VERTICAL_LEFT;
	image_angle -= 90;
	while(!place_meeting(x - 1, y, obj_ground_outer)) {
		x--;
	}
} else if(place_meeting(x + 12, y, obj_ground_outer)) {
	state = SNAIL_STATES.VERTICAL_RIGHT;
	image_angle += 90;
	while(!place_meeting(x + 1, y, obj_ground_outer)) {
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
