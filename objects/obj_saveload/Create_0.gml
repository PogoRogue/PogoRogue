if (instance_number(obj_saveload) > 1) {
	instance_destroy();	
}else {
	//declare variables
	
	//stats
	global.enemies_killed = 0;
	global.best_combo = 0;
	
	//audio settings
	global.sound_volume = 100;
	global.music_volume = 100;
	
	//video settings
	global.fullscreen = true;
	global.resolution_num = 4;
	global.resolution_x = 1920;
	global.resolution_y = 1080;
	
	//load existing data, set default value if doesn't exist
	ini_open("savedata.ini");
	global.enemies_killed = ini_read_real("savegame", "enemies_killed", 0);
	global.best_combo = ini_read_real("savegame", "best_combo", 0);
	
	global.sound_volume = ini_read_real("savegame", "sound_volume", 100);
	global.music_volume = ini_read_real("savegame", "music_volume", 100);
	
	global.fullscreen = ini_read_real("savegame", "fullscreen", true);
	global.resolution_num = ini_read_real("savegame", "resolution_num", 0);
	global.resolution_x = ini_read_real("savegame", "resolution_x", 1920);
	global.resolution_y = ini_read_real("savegame", "resolution_y", 1080);
	ini_close();
	
	show_debug_message("Total Enemies Killed: " + string(global.enemies_killed));
	show_debug_message("Best Combo: " + string(global.best_combo));
	
	show_debug_message("Sound Volume: " + string(global.sound_volume));
	show_debug_message("Music Volume: " + string(global.music_volume));
	
	show_debug_message("Fullscreen: " + string(global.fullscreen));
	show_debug_message("Resolution Num: " + string(global.resolution_num));
	show_debug_message("Resolution X: " + string(global.resolution_x));
	show_debug_message("Resolution Y: " + string(global.resolution_y));
}

window_set_fullscreen(global.fullscreen);
window_set_size(global.resolution_x,global.resolution_y);
alarm[0] = 10;

if !audio_group_is_loaded(audiogroup_music) {
    audio_group_load(audiogroup_music);
}

audio_group_set_gain(audiogroup_default,global.sound_volume/100,100);
audio_group_set_gain(audiogroup_music,global.music_volume/100,100);