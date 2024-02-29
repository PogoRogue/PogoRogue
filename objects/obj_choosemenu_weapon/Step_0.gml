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

//move around
if fade_away = false {
	if key_left and (select%select_x_max) != 1 and selected_x = false {
		select -= 1;
		select_x -= 1;
		selected_x = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[2] = alarm2_time;
	}
	if key_right and (select%select_x_max) != 0 and select < select_max and selected_x = false {
		select += 1;
		select_x += 1;
		selected_x = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[2] = alarm2_time;
	}
	if key_up and select > select_x_max and selected_y = false {
		select -= select_x_max;
		select_y -= 1;
		selected_y = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[3] = alarm3_time;
	}
	if key_down and select <= select_max-select_x_max and selected_y = false {
		select += select_x_max;
		select_y += 1;
		selected_y = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[3] = alarm3_time;
	}
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

//select
if key_select and centered = true and fade_away = false {
	audio_play_sound(snd_selectOption,0,false);
	
	alarm[0] = 1;
	alarm[4] = 2; //create active item menu
	fade_away = true;
	
	//change weapon
	instance_activate_object(obj_player);
	with obj_player {
		num_of_weapons = 2;
		gun_1 = other.all_weapons[other.select-1];
		gun_2 = all_guns_array[0];
		gun_3 = gun_1;
		gun_array = [gun_1, gun_2, gun_1];
		current_gun = 0;
		gun = gun_array[current_gun];
	}
	//save weapon
	ini_open("itemsunlocked.ini");
	if scr_In_Array(obj_player.all_guns_array,all_weapons[select-1]) {
		for(i = 0; i < array_length(obj_player.all_guns_array);i++) {
			if obj_player.all_guns_array[i] = all_weapons[select-1] {
				global.weapon_unlocked_array[i] = true;
				ini_write_real("itemsunlocked", "weapon " + string(i), global.weapon_unlocked_array[i]);
			}
		}
	}
	ini_close();
	instance_deactivate_object(obj_player);
	instance_deactivate_object(obj_player_mask);
}

//move onto screen
var distance = target_x-center_x;

if(distance <= 100){
	spd_multiply = distance / 100;
}

if (center_x < target_x and moving_in = true) {
	center_x += spd * spd_multiply;
}else if center_x >= target_x and moving_in = true {
	center_x = target_x;
	moving_in = false;
}
	
if center_x >= target_x - 64 and centered = false {
	centered = true;
}

if fade_away = true {
	if spd2 < 16 {
		spd2 += 1;
	}
	center_x += spd2;
	alpha -= 0.025;
	if alpha <= 0 {
		instance_destroy();
	}
}