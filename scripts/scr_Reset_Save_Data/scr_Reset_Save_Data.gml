// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Reset_Save_Data(){
	ini_open("savedata.ini");
	
	ini_key_delete("savegame", "enemies_killed");
	ini_key_delete("savegame", "best_combo");
	ini_key_delete("savegame", "best_coins");
	ini_key_delete("savegame", "best_enemies");
	
	ini_key_delete("savegame", "total_runs");
	ini_key_delete("savegame", "area_2_reached");
	ini_key_delete("savegame", "area_3_reached");
	ini_key_delete("savegame", "num_of_wins");
	ini_key_delete("savegame", "fastest_time");
	ini_key_delete("savegame", "tutorial_completed");
	
	ini_close();
	
	scr_Save_Load_Variables();
}