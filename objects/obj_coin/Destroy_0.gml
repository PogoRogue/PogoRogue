/// @description increase global.num_of_coins
if room != room_shop {
	global.num_of_coins += 1;
	global.current_total_coins += 1;
	with obj_coincounter {
		coin_alpha = 3;
		current_coins += 1;
	}
}
audio_play_sound(snd_coin,0,false);