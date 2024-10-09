if (floor(image_index) = 4 or floor(image_index) = 6 or floor(image_index) = 8)
and !audio_is_playing(snd_bombbeep) {
	if should_beep = true {
		audio_play_sound(snd_bombbeep,0,false);	
	}
}