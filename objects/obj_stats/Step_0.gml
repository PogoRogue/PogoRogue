if usable = true { 
	key_left = global.key_left_menu;
	key_right = global.key_right_menu;
	key_up = global.key_up_menu;
	key_down = global.key_down_menu;
	key_select = global.key_select;
	key_back = global.key_back;
}else {
	key_left = 0;
	key_right = 0;
	key_up = 0;
	key_down = 0;
	key_select = 0;
	key_back = 0;
}




if key_back {
	if room != room_stats {
		alarm[0] = 1;
	}else {
		scr_Room_Transition(room_menu);
		audio_play_sound(snd_unavailable,0,false);
	}
}