/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if room != room_shop {
	if scr_In_Array(global.all_buffs, object_index) {
		scr_Buff_Replace();
	}
}

if room = room_boss_1 or room = room_boss_2 or room = room_boss_2 {
	//instance_destroy();
	follow_player = false;
}