/// @description Press and jump

if(!is_pressed) {
	if other.state != other.state_chargejump {
		other.state = other.state_bouncing;
	}
		
	if other.vsp_basicjump < -7 { //check if state = state_groundpound
		other.pickup_groundpound.cooldown_time = 0;
	}

	other.speed = 0;

	is_pressed = true;
	sprite_index = pressed_sprite;
	alarm_set(0, press_duration);
}
