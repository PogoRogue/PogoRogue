//audio pitch for slow mo
var all_music = audio_group_get_assets(audiogroup_music);

for (i=0;i<array_length(all_music);i++) {
	audio_sound_pitch(all_music[i],max(room_speed/60,0.8));
}

var all_sounds = audio_group_get_assets(audiogroup_default);

for (i=0;i<array_length(all_sounds);i++) {
	audio_sound_pitch(all_sounds[i],max(room_speed/60,0.8));
}