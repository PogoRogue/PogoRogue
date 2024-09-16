// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Save_Load_Variables(){
	//declare variables
	
	//STATS
	
	//runs
	global.total_runs = 0;
	global.area_2_reached = 0;
	global.area_3_reached = 0;
	global.num_of_wins = 0;
	
	//splits
	global.fastest_time_area1 = 0;
	global.fastest_time_boss1 = 0;
	global.fastest_time_boss2 = 0;
	global.fastest_time_area2 = 0;
	global.fastest_time_boss3 = 0;
	global.fastest_time_boss4 = 0;
	global.fastest_time_area3 = 0;
	global.fastest_time_boss5 = 0;
	global.fastest_time_custom = 0;
	global.fastest_time_random = 0;
	
	//enemies
	global.best_enemies = 0;
	global.enemies_killed = 0;
	global.best_combo = 0;
	
	//coins
	global.best_coins = 0;
	global.total_coins = 0;
	
	global.credits_watched = false; //credits are required once
	global.tutorial_completed = false;
	
	//audio settings
	global.sound_volume = 70;
	global.music_volume = 70;
	
	//video settings
	global.fullscreen = true;
	global.resolution_num = 4;
	global.resolution_x = 1920;
	global.resolution_y = 1080;
	global.flash = true;
	
	//gameplay settings
	global.tilt_speed = 4;
	global.screenshake = 60;
	global.controller_vibration = 60;
	global.show_timer = false;
	global.show_splits = false;
	global.show_coins = true;
	global.show_passives = true;
	
	global.random_seed = true;
	
	//load existing data, set default value if doesn't exist
	ini_open("savedata.ini");
	
	//runs
	global.total_runs = ini_read_real("savegame", "total_runs", 0);
	global.area_2_reached = ini_read_real("savegame", "area_2_reached", 0);
	global.area_3_reached = ini_read_real("savegame", "area_3_reached", 0);
	global.num_of_wins = ini_read_real("savegame", "num_of_wins", 0);
	
	//splits
	global.fastest_time_area1 = ini_read_real("savegame", "fastest_time_area1", 0);
	global.fastest_time_boss1 = ini_read_real("savegame", "fastest_time_boss1", 0);
	global.fastest_time_boss2 = ini_read_real("savegame", "fastest_time_boss2", 0);
	global.fastest_time_area2 = ini_read_real("savegame", "fastest_time_area2", 0);
	global.fastest_time_boss3 = ini_read_real("savegame", "fastest_time_boss3", 0);
	global.fastest_time_boss4 = ini_read_real("savegame", "fastest_time_boss4", 0);
	global.fastest_time_area3 = ini_read_real("savegame", "fastest_time_area3", 0);
	global.fastest_time_boss5 = ini_read_real("savegame", "fastest_time_boss5", 0);
	global.fastest_time_custom = ini_read_real("savegame", "fastest_time_custom", 0);
	global.fastest_time_random = ini_read_real("savegame", "fastest_time_random", 0);
	
	//enemies
	global.best_enemies = ini_read_real("savegame", "best_enemies", 0);
	global.enemies_killed = ini_read_real("savegame", "enemies_killed", 0);
	global.best_combo = ini_read_real("savegame", "best_combo", 0);
	
	//coins
	global.best_coins = ini_read_real("savegame", "best_coins", 0);
	global.total_coins = ini_read_real("savegame", "total_coins", 0);
	
	
	global.credits_watched = ini_read_real("savegame", "credits_watched", false);
	global.tutorial_completed = ini_read_real("savegame", "tutorial_completed", false);
	
	global.sound_volume = ini_read_real("savegame", "sound_volume", 100);
	global.music_volume = ini_read_real("savegame", "music_volume", 100);
	
	global.fullscreen = ini_read_real("savegame", "fullscreen", true);
	global.resolution_num = ini_read_real("savegame", "resolution_num", 4);
	global.resolution_x = ini_read_real("savegame", "resolution_x", 1920);
	global.resolution_y = ini_read_real("savegame", "resolution_y", 1080);
	global.flash = ini_read_real("savegame", "flash", true);
	
	global.tilt_speed = ini_read_real("savegame", "tilt_speed", 4);
	global.screenshake = ini_read_real("savegame", "screenshake", 80);
	global.controller_vibration = ini_read_real("savegame", "controller_vibration", 80);
	global.show_timer = ini_read_real("savegame", "show_timer", true);
	global.show_splits = ini_read_real("savegame", "show_splits", false);
	global.show_coins = ini_read_real("savegame", "show_coins", true);
	global.show_passives = ini_read_real("savegame", "show_passives", true);
	
	global.random_seed = ini_read_real("savegame", "random_seed", true);
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