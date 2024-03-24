/// @description Insert description here
// You can write your code in this editor
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