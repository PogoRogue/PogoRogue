/// @description Don't increase coin totals
audio_play_sound(snd_coin,0,false);
global.num_of_coins -= 25; 

if global.num_of_coins <= 0 {
	global.num_of_coins = 0; 
}
if room != room_shop {
	with obj_slot_machine {
		pull_handle = true;	
		audio_play_sound(snd_slotmachine_lever,0,false);
	}
	with obj_slot_machine2 {
		pull_handle = true;	
		audio_play_sound(snd_slotmachine_lever,0,false);
	}
}