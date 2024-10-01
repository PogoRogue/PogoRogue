// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Settings_Initialize(){
	window_set_fullscreen(global.fullscreen);
	window_set_size(global.resolution_x,global.resolution_y);
	alarm[3] = 10;

	if !audio_group_is_loaded(audiogroup_music) {
	    audio_group_load(audiogroup_music);
	}
	
	if !audio_group_is_loaded(audiogroup_volleyball) {
	    audio_group_load(audiogroup_volleyball);
	}

	audio_group_set_gain(audiogroup_default,global.sound_volume/100,100);
	audio_group_set_gain(audiogroup_music,global.music_volume_multiplier*((exp(0.24*((10 / 100) * global.music_volume))-1)/10),100);
	audio_group_set_gain(audiogroup_volleyball,global.sound_volume/100,100);
}