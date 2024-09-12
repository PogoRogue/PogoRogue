with obj_player {
	pickup_shieldbubble.on_cooldown = true;
	bubble = true;
	if audio_is_playing(snd_shieldBubble) {
		audio_stop_sound(snd_shieldBubble);	
	}
	audio_play_sound(snd_bubblepop,0,false);
	
	with obj_shieldbubble_mask {
		instance_destroy();
	}
	
	with obj_shieldbubble_mask2 {
		instance_destroy();
	}
	
	obj_player.alarm[7] = room_speed;
}