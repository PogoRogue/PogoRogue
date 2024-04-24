/// @description Deactivate shield

if(is_active){
	obj_player.state = obj_player.state_bouncing;
	obj_player.speed = 0;
	parent.speed = 0;
	is_active = false;
	alarm_set(0, restore_duration); // Reactivate shield after 12 seconds
	parent.current_iframes = 25;
	
	with(obj_boss_marionette) {
		if(!collision_detected) {
			angle_velocity *= -1;
			collision_detected = true;
			alarm_set(1, room_speed);
		}
	}
	
	if audio_is_playing(snd_shieldBubble_enemy) {
		audio_stop_sound(snd_shieldBubble_enemy);
	}
}
