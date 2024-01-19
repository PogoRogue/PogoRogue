function scr_Save_Real(key_string,var_real) {
	ini_open("savedata.ini");
	ini_write_real("savegame", key_string, var_real);
	ini_close();
}