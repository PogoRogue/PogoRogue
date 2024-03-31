with obj_player {
	pickup_shieldbubble.on_cooldown = true;
	bubble = true;
	if audio_is_playing(snd_shieldBubble) {
		audio_stop_sound(snd_shieldBubble);	
	}
}