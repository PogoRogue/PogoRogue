/// @description play menu music
if !audio_is_playing(snd_music_menu) {
	audio_group_stop_all(audiogroup_music);
	audio_stop_all();
	audio_play_sound(snd_music_menu,0,false);
}
