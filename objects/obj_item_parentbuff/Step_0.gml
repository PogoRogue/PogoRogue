/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if room != room_shop {
	if scr_In_Array(global.all_buffs, object_index) {
		scr_Buff_Replace();
	}
}

if (scr_In_Array(global.boss_rooms,room)) and slot_machine = false {
	//instance_destroy();
	follow_player = false;
}

if slot_machine = true {
	follow_player = true;
}