/// @description Set rotation

sprite_index = default_sprite;
if!(place_meeting(x - 20, y, obj_ground)) {
	rotation = 180;
	is_vertical = true;
	image_yscale = -1;
	x += 16;
} else if (place_meeting(x, y + 20, obj_ground)) {
	rotation = 90;
	is_vertical = false;
} else if (place_meeting(x, y - 20, obj_ground)) {
	rotation = -90;
	is_vertical = false;
}

image_angle = rotation;

if !place_meeting(x-16,y,obj_ground) and !place_meeting(x+16,y,obj_ground) {
	instance_destroy();	
}