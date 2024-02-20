if deleted = false {
	key_left = global.key_left_menu;
	key_right = global.key_right_menu;
	key_select = global.key_select;
	key_back = global.key_back;
}else {
	key_left = 0;
	key_right = 0;
	key_select = 0;
	key_back = 0;
}

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
		scr_Reset_Save_Data();
		
		ini_open("itemsunlocked.ini");
		for(i = 0; i < array_length(global.passive_unlocked_array); i++) { //passives
			ini_key_delete("itemsunlocked", "passive " + string(i));
		}
		for(i = 0; i < array_length(global.active_unlocked_array); i++) { //actives
			ini_key_delete("itemsunlocked", "active " + string(i));
		}
		for(i = 0; i < array_length(global.weapon_unlocked_array); i++) { //weapons
			ini_key_delete("itemsunlocked", "weapon " + string(i));
		}
		ini_close();
		scr_Items_Unlocked();
		
		deleted = true;
		with obj_settings {
			usable = true;	
		}
	}
}

if key_back {
	alarm[0] = 1;	
}

if deleted = false {
	image_index = select-1;
}else {
	image_index = 2;
	if alpha > 0 {
		alpha -= 0.05;
	}else {
		instance_destroy();
	}
}