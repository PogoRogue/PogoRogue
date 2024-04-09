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
	if select_y = 2 {
		if key_left and select_x = 2 {
			select_x -= 1;
			audio_play_sound(snd_menuNavigation,0,false);
		}
		if key_right and select_x = 1 {
			select_x += 1;
			audio_play_sound(snd_menuNavigation,0,false);
		}
	}
	/*
	if key_up and select_y = 2 {
		select_y -= 1;
		audio_play_sound(snd_menuNavigation,0,false);
		blinker_index = 0;
	}
	if key_down and select_y = 1 {
		select_y += 1;
		audio_play_sound(snd_menuNavigation,0,false);
		blinker_index = 0;
	}*/
	
	if(keyboard_string != "") and no_key_pressed {
		switch(keyboard_string) {
			case "1":  seed_string += keyboard_string; break;
			case "2":  seed_string += keyboard_string; break;
			case "3":  seed_string += keyboard_string; break;
			case "4":  seed_string += keyboard_string; break;
			case "5":  seed_string += keyboard_string; break;
			case "6":  seed_string += keyboard_string; break;
			case "7":  seed_string += keyboard_string; break;
			case "8":  seed_string += keyboard_string; break;
			case "9":  seed_string += keyboard_string; break;
			case "0":  seed_string += keyboard_string; break;
		}
	   
	    keyboard_string = "";
	}
	if !keyboard_check(vk_anykey) and no_key_pressed = false {
		no_key_pressed = true;	
		keyboard_string = "";
	}
	if keyboard_check_pressed(vk_backspace) and string_length(seed_string) > 0 {
		seed_string = string_copy(seed_string, 1, string_length(seed_string)-1);
		alarm[2] = 30;
	}
	if string_length(seed_string) > 10 {
	    seed_string = string_copy(seed_string, 1, 10);
	}
	
}

//select
if key_select and centered = true and fade_away = false 
or keyboard_check_pressed(vk_enter) and centered = true and fade_away = false {
	audio_play_sound(snd_selectOption,0,false);
	alarm[0] = 1;
	fade_away = true;
	submitted = true;
	//do seed apply code here
	if seed_string != "" {
		global.seed_switched = true;
		global.seed = real(seed_string);
		random_set_seed(global.seed);	
		scr_Restart_Level();
	}
}

//back
if key_back and centered = true and fade_away = false {
	audio_play_sound(snd_unavailable,0,false);
	alarm[0] = 1;
	fade_away = true;
	canceled = true;
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


blinker_index += 0.04;