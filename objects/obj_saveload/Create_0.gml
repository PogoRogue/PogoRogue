if (instance_number(obj_saveload) > 1) {
	instance_destroy();	
}else {
	scr_Save_Load_Variables();
}

scr_Settings_Initialize();