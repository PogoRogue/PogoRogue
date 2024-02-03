function scr_Load_Real(var_real,key_string,default_value_real){
	ini_open("savedata.ini");
	var_real = ini_read_real("savegame", key_string, default_value_real);
	ini_close();
}