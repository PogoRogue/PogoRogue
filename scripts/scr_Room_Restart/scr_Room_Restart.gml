// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Room_Restart(deactivate) {
	with instance_create_depth(x,y,-1000,obj_fade_out_restart_room) {
		deactivate_all = deactivate;
		alarm[1] = 1;
	}
}