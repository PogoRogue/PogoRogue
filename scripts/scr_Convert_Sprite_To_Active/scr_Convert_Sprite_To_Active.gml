// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Convert_Sprite_To_Active(spr) {
	var new_pickup = obj_player.pickup_nothing;
	for(i = 0; i < array_length(obj_player.all_pickups_array); i++) {
		if spr = obj_player.all_pickups_array[i].gui_sprite {
			new_pickup = obj_player.all_pickups_array[i];
		}
	}
	return new_pickup;
}