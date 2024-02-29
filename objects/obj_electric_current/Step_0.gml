/// @description Handle deactivation

if(!is_active) {
	power_on = false;
	sprite_index = spr_electric_current_off;
	alarm[0] = room_speed * initial_delay;
}


