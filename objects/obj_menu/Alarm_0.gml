/// @description play menu music
if !audio_is_playing(snd_music_menu) {
	audio_play_sound(snd_music_menu,0,true);
}