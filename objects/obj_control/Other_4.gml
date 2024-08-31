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

var all_volleyball_sounds = audio_group_get_assets(audiogroup_volleyball);

for (i=0;i<array_length(all_volleyball_sounds);i++) {
	audio_sound_pitch(all_volleyball_sounds[i],max(room_speed/60,0.8));
}

global.enemy_killed = false; //resume combo meter when set to true after killing 1st enemy in room

//set music
if room = room_proc_gen_test {
	switch (global.phase) {
		case 1: global.current_music = snd_music_level1; break;
		case 2: global.current_music = snd_music_level2; global.area_2_reached += 1; scr_Save_Real("area_2_reached",global.area_2_reached); break;	
		case 3: global.current_music = snd_music_level3; global.area_3_reached += 1; scr_Save_Real("area_3_reached",global.area_3_reached); break;	
	}
}else if room = room_boss_1 {
	global.current_music = snd_music_boss1
}else if room = room_boss_2 {
	global.current_music = snd_music_boss2;
}else if room = room_boss_3 {
	global.current_music = snd_music_boss3;
}else if room = room_tutorial {
	global.current_music = snd_music_level1;
}else if room != room_shop {
	global.current_music = snd_music_level1;
}else {
	global.current_music = snd_music_shop;
}

//music test
if !audio_is_playing(global.current_music) {
	audio_stop_all();
	audio_play_sound(global.current_music,0,true);
}