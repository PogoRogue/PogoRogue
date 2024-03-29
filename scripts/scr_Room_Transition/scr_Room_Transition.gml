// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Room_Transition(room_name) {
	with instance_create_depth(x,y,-1000,obj_fade_out) {
		next_room = room_name;
	}
}