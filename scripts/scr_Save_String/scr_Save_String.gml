function scr_Save_String(key_string,var_string) {
	ini_open("savedata.ini");
	ini_write_real("savegame", key_string, var_string);
	ini_close();
}