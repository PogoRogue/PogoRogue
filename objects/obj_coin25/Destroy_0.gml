/// @description Don't increase coin totals
audio_play_sound(snd_coin,0,false);
global.num_of_coins -= 25; 

if global.num_of_coins <= 0 {
	global.num_of_coins = 0; 
}
if room != room_shop {
	with follow_object {
		pull_handle = true;	
		audio_play_sound(snd_slotmachine_lever,0,false);
	}
}