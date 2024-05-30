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

if select_y = 0 { //top row, change between item types
	select_x = 1;
	if key_left and !key_right and select > 1 and selected_x = false {
		select -= 1;
		selected_x = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[2] = alarm2_time;
	}
	if key_right and !key_left and select < select_max and selected_x = false {
		select += 1;
		selected_x = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[2] = alarm2_time;
	}
	//down
	if key_down and !key_up and select_y < select_y_max and selected_y = false {
		select_y += 1;
		selected_y = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[3] = alarm3_time;
	}
}

//move around
if select_y > 0 {
	if key_left and !key_right and select_x > 1 and selected_x = false {
		select_x -= 1;
		selected_x = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[2] = alarm2_time;
	}
	if key_right and !key_left and select_x < select_x_max and selected_x = false {
		select_x += 1;
		selected_x = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[2] = alarm2_time;
	}
	if key_up and !key_down and select_y > 0 and selected_y = false {
		select_y -= 1;
		selected_y = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[3] = alarm3_time;
	}
	if key_down and !key_up and select_y < select_y_max and selected_y = false {
		select_y += 1;
		selected_y = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[3] = alarm3_time;
	}
}

//passives
if select = 1 {
	select_x_max = 8;
	select_y_max = 5;
	select_sprite = spr_item_slot_passives;
	x_gap = 60;
	y_gap = 60;
	current_array = passives_array;
}

//actives
if select = 2 {
	select_x_max = 5;
	select_y_max = 4;
	select_sprite = spr_item_slot_actives;
	x_gap = 72;
	y_gap = 72;
	current_array = actives_array;
	select_y_added = 0;
}

//weapons
if select = 3 {
	select_x_max = 5;
	select_y_max = 4;
	select_sprite = spr_item_slot_actives;
	x_gap = 72;
	y_gap = 72;
	current_array = weapons_array;
	select_y_added = 0;
}

if !key_left and !key_right {
	selected_x = false;
	alarm2_time = 30;
	alarm[2] = alarm2_time;
}

if !key_up and !key_down {
	selected_y = false;
	alarm3_time = 30;
	alarm[3] = alarm3_time;
}

if key_back and !instance_exists(obj_fade_in) {
	if room != room_items {
		alarm[0] = 1;
	}else {
		scr_Room_Transition(room_menu);
		audio_play_sound(snd_unavailable,0,false);
	}
}