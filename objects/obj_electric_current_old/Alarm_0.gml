/// @description Floor Off

power_on = false;
sprite_index = spr_electric_current_off;

if(is_active) {
	alarm[2] = room_speed * off_time;
} else {
	// Wait a full cycle before checking is_active again
	alarm[0] = room_speed * (powering_up_time + on_time + off_time);
}
