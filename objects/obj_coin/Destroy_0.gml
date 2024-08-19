/// @description increase global.num_of_coins
if room != room_shop and salesman = false {
	global.num_of_coins += 1;
	global.current_total_coins += 1;
	with obj_coincounter {
		coin_alpha = 3;
		current_coins += 1;
		global.total_coins += 1;
		scr_Save_Real("total_coins",global.total_coins);
	}
}
audio_play_sound(snd_coin,0,false);