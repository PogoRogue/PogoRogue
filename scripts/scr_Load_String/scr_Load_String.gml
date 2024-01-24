// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Load_String(var_string,key_string,default_value_string){
	ini_open("savedata.ini");
	var_string = ini_read_real("savegame", key_string, default_value_string);
	ini_close();
}