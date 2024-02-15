if!(place_meeting(x - 27, y, obj_ground_parent)) {
	rotation = 180;
	is_vertical = true;
	image_yscale = -1;
	x += 16;
	show_debug_message("turret");
} else if (place_meeting(x, y + 20, obj_ground_parent)) {
	rotation = 90;
	is_vertical = false;
} else if (place_meeting(x, y - 20, obj_ground_parent)) {
	rotation = -90;
	is_vertical = false;
}
