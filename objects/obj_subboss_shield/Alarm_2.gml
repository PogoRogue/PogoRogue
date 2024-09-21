/// @description Insert description here
// You can write your code in this editor

power_on = false;
//sprite_index = spr_electric_current_off;

if(is_active) {
	alarm[4] = round(room_speed * off_time);
} else {
	// Wait a full cycle before checking is_active again
	alarm[2] = round(room_speed * (powering_up_time + on_time + off_time));
}


with laser_obj {
	sprite_index = spr_laser_middle_animation;
	image_index = sprite_get_number(spr_laser_middle_animation)-1;
	image_speed = - 1;
}