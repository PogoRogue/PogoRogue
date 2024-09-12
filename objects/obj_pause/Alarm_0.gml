

//Deactivate all objects far from the player for performance reasons using the 
//obj_proc_gen_location_analysis object. Do this in an alarm because that object
//won't be loaded until after this event.	

//This function checks if things are meant to be loaded or unloaded to prevent duplicate object existence check code
scr_Unload_Inactive_Region_List();