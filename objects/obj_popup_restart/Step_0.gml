key_left = global.key_left_menu;
key_right = global.key_right_menu;
key_select = global.key_select;
key_back = global.key_back;

if key_left and selected = false {
	audio_play_sound(snd_menuNavigation,0,false);
	if select > 1 {
		select -= 1;
	}
	selected = true;
}else if key_right and selected = false {
	audio_play_sound(snd_menuNavigation,0,false);
	if select < num_of_options {
		select += 1;
	}
	selected = true;
}else if !key_left and !key_right {
	selected = false;
}

if key_select {
	audio_play_sound(snd_selectOption,0,false);
	if select = 1 {
		alarm[0] = 1;
	}else if select = 2 {
		if global.last_room != room_shop and global.last_room != room_boss_1 {
			//temporarily disabled
			//instance_deactivate_all(false);
			//room_restart();
			game_restart();	
		}else {
			game_restart();	
		}
	}
}

if key_back {
	alarm[0] = 1;	
}

image_index = select-1;