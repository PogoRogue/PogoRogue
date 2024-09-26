if scr_Animation_Complete() and sprite_index = spr_laser_middle_animation and image_speed = 1 {
	image_speed = 0;
	image_index = sprite_get_number(sprite_index)-1;
	alarm[0] = 15;
}

if floor(image_index) <= 1 and sprite_index = spr_laser_middle_animation and image_speed = -1 {
	instance_destroy();
}

if place_meeting(x,y,obj_ground) {
	depth = 10;
}