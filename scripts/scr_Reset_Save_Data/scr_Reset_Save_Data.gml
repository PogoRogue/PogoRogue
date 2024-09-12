// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Reset_Save_Data(){
	ini_open("savedata.ini");
	
	ini_key_delete("savegame", "enemies_killed");
	ini_key_delete("savegame", "best_combo");
	ini_key_delete("savegame", "best_coins");
	ini_key_delete("savegame", "total_coins");
	ini_key_delete("savegame", "best_enemies");
	
	ini_key_delete("savegame", "total_runs");
	ini_key_delete("savegame", "area_2_reached");
	ini_key_delete("savegame", "area_3_reached");
	ini_key_delete("savegame", "num_of_wins");
	
	ini_key_delete("savegame", "fastest_time_custom");
	ini_key_delete("savegame", "fastest_time_random");
	ini_key_delete("savegame", "fastest_time_area1");
	ini_key_delete("savegame", "fastest_time_area2");
	ini_key_delete("savegame", "fastest_time_area3");
	ini_key_delete("savegame", "fastest_time_boss1");
	ini_key_delete("savegame", "fastest_time_boss2");
	ini_key_delete("savegame", "fastest_time_boss3");
	ini_key_delete("savegame", "fastest_time_boss4");
	ini_key_delete("savegame", "fastest_time_boss5");
	
	//ini_key_delete("savegame", "tutorial_completed");
	ini_key_delete("savegame", "credits_watched");
	
	ini_close();
	
	scr_Save_Load_Variables();
}