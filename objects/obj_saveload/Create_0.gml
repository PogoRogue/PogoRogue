if (instance_number(obj_saveload) > 1) {
	instance_destroy();	
}else {
	//declare variables
	global.enemies_killed = 0;
	global.best_combo = 0;
	global.resolution_num = 4;
	
	//load existing data, set default value if doesn't exist
	ini_open("savedata.ini");
	global.enemies_killed = ini_read_real("savegame", "enemies_killed", 0);
	global.best_combo = ini_read_real("savegame", "best_combo", 0);
	global.resolution_num = ini_read_real("savegame", "resolution_num", 0);
	ini_close();
	
	show_debug_message("Total Enemies Killed: " + string(global.enemies_killed));
	show_debug_message("Best Combo: " + string(global.best_combo));
	show_debug_message("Resolution Num: " + string(global.resolution_num));
}