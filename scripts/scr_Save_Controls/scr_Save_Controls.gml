function scr_Save_Controls(key_string,var_real) {
	ini_open("controls.ini");
	ini_write_real("controls", key_string, var_real);
	ini_close();
}