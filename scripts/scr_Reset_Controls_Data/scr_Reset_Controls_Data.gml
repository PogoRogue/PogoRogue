// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Reset_Controls_Data(){
	ini_open("controls.ini");
	
	//delete values
	for(i = 0; i < array_length(global.keyboard_array); i++) {
		for (j = 0; j < 2; j++) {
			ini_key_delete("controls", "key " + string(i) + "_" + string(j));
		}
	}
	for(i = 0; i < array_length(global.gamepad_array); i++) {
		for (j = 0; j < 2; j++) {
			ini_key_delete("controls", "gp " + string(i) + "_" + string(j));
		}
	}
	
	ini_close();
	
	scr_Controls();
	
	with obj_settings {
		scr_Settings_Bindings();	
	}
}