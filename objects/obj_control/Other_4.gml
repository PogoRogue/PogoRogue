/// @description Reset variables

//create pause object
if !instance_exists(obj_pause) {
	instance_create_depth(0,0,depth,obj_pause);	
}
if !instance_exists(obj_pausemenu) {
	instance_create_depth(0,0,depth-2,obj_pausemenu);	
}
if !instance_exists(obj_parallax_control) {
	instance_create_depth(x,y,depth,obj_parallax_control);
}

audio_group_stop_all(audiogroup_default);

room_speed = 60;

//reset slow mo effect
var all_music = audio_group_get_assets(audiogroup_music);

for (i=0;i<array_length(all_music);i++) {
	audio_sound_pitch(all_music[i],max(room_speed/60,0.8));
}

var all_sounds = audio_group_get_assets(audiogroup_default);

for (i=0;i<array_length(all_sounds);i++) {
	audio_sound_pitch(all_sounds[i],max(room_speed/60,0.8));
}