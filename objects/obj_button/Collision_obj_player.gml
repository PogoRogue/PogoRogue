/// @description Press and jump

if(!is_pressed && is_active) {
	if(other.state != other.state_chargejump && other.state != other.state_bouncing) {
		other.state = other.state_bouncing;
	}
		
	if other.vsp_basicjump < -7 { //check if state = state_groundpound
		other.pickup_groundpound.cooldown_time = 0;
	}

	other.speed = 0;

	is_pressed = true;
	alarm_set(0, press_duration);
	
	audio_play_sound(snd_beep_placeholder, 0, false, 1, 0, pitch);
}
