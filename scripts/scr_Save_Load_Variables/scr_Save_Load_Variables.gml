// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Save_Load_Variables(){
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
	
	//gameplay settings
	global.tilt_speed = 3;
	global.screenshake = 60;
	global.controller_vibration = 60;
	global.show_timer = false;
	global.show_coins = true;
	global.show_passives = true;
	
	//load existing data, set default value if doesn't exist
	ini_open("savedata.ini");
	global.enemies_killed = ini_read_real("savegame", "enemies_killed", 0);
	global.best_combo = ini_read_real("savegame", "best_combo", 0);
	
	global.sound_volume = ini_read_real("savegame", "sound_volume", 100);
	global.music_volume = ini_read_real("savegame", "music_volume", 100);
	
	global.fullscreen = ini_read_real("savegame", "fullscreen", true);
	global.resolution_num = ini_read_real("savegame", "resolution_num", 4);
	global.resolution_x = ini_read_real("savegame", "resolution_x", 1920);
	global.resolution_y = ini_read_real("savegame", "resolution_y", 1080);
	
	global.tilt_speed = ini_read_real("savegame", "tilt_speed", 3);
	global.screenshake = ini_read_real("savegame", "screenshake", 60);
	global.controller_vibration = ini_read_real("savegame", "controller_vibration", 60);
	global.show_timer = ini_read_real("savegame", "show_timer", false);
	global.show_coins = ini_read_real("savegame", "show_coins", true);
	global.show_passives = ini_read_real("savegame", "show_passives", true);
	ini_close();
	
	show_debug_message("Total Enemies Killed: " + string(global.enemies_killed));
	show_debug_message("Best Combo: " + string(global.best_combo));
	
	show_debug_message("Sound Volume: " + string(global.sound_volume));
	show_debug_message("Music Volume: " + string(global.music_volume));
	
	show_debug_message("Fullscreen: " + string(global.fullscreen));
	show_debug_message("Resolution Num: " + string(global.resolution_num));
	show_debug_message("Resolution X: " + string(global.resolution_x));
	show_debug_message("Resolution Y: " + string(global.resolution_y));
	
	show_debug_message("Tilt Speed: " + string(global.tilt_speed));
	show_debug_message("Screen Shake: " + string(global.screenshake));
	show_debug_message("Controller Vibration: " + string(global.controller_vibration));
	show_debug_message("Show Timer: " + string(global.show_timer));
	show_debug_message("show Coins: " + string(global.show_coins));
	show_debug_message("Show Passives: " + string(global.show_passives));
}