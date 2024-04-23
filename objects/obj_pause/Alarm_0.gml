

//Deactivate all objects far from the player for performance reasons using the 
//obj_proc_gen_location_analysis object. Do this in an alarm because that object
//won't be loaded until after this event.	
scr_Unload_Inactive_Region_List();