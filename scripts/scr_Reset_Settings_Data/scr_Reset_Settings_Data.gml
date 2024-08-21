// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Reset_Settings_Data(){
	ini_open("savedata.ini");
	
	ini_key_delete("savegame", "sound_volume");
	ini_key_delete("savegame", "music_volume");
	
	ini_key_delete("savegame", "fullscreen");
	ini_key_delete("savegame", "resolution_num");
	ini_key_delete("savegame", "resolution_x");
	ini_key_delete("savegame", "resolution_y");
	
	ini_key_delete("savegame", "tilt_speed");
	ini_key_delete("savegame", "screenshake");
	ini_key_delete("savegame", "controller_vibration");
	ini_key_delete("savegame", "show_timer");
	ini_key_delete("savegame", "show_splits");
	ini_key_delete("savegame", "show_coins");
	ini_key_delete("savegame", "show_passives");
	ini_key_delete("savegame", "flash");
	
	
	ini_close();
	
	scr_Save_Load_Variables();
	
	scr_Settings_Initialize();
	
	with obj_settings {
		scr_Settings_Audio();
		scr_Settings_Video();
		scr_Settings_Gameplay();	
	}
	
	if room != room_menu {
		instance_activate_object(obj_player);
		with obj_player {
			rotation_speed = global.tilt_speed;
			original_rotation_speed = global.tilt_speed;
			current_rotation_speed = 0;
			rotation_delay = rotation_speed / 10; //0.5
		}
		instance_deactivate_object(obj_player);
	}
}