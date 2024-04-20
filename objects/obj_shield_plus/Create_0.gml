/// @description Instantiate variables

parent = noone;
is_active = true;
restore_duration = room_speed * 8;
if(enhanced) {
	restore_duration = room_speed * 6;
	image_blend = c_red;
}
image_speed = 0;
image_alpha = 0;
