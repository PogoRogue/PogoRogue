/// @description Override parent event
if audio_is_playing(snd_sniper) and cut_sound = true {
	audio_stop_sound(snd_sniper);
}