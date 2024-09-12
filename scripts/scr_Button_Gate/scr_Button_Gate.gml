// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Button_Gate(){
	with obj_room_gate_open_starting {
		if image_index = 0 {
			image_speed = 1;
		}else if image_index = sprite_get_number(sprite_index)-1 {
			image_speed = -1;
		}
	}
}