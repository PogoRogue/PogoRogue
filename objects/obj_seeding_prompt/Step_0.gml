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
	if controller = true {
		if select_y = 1 {
			if key_left and !key_right and select_x > 0 and selected_x = false {
				select_x -= 1;
				audio_play_sound(snd_menuNavigation,0,false);
				selected_x = true;
				alarm[3] = alarm3_time;
			}
			if key_right and !key_left and select_x < 10 and selected_x = false {
				select_x += 1;
				audio_play_sound(snd_menuNavigation,0,false);
				selected_x = true;
				alarm[3] = alarm3_time;
			}
		}else if select_y = 2 {
			if key_left and !key_right and select_x2 = 2 {
				select_x2 -= 1;
				audio_play_sound(snd_menuNavigation,0,false);
			}
			if key_right and !key_left and select_x2 = 1 {
				select_x2 += 1;
				audio_play_sound(snd_menuNavigation,0,false);
			}
		}
	
		if key_up and !key_down and select_y = 2 {
			select_y -= 1;
			audio_play_sound(snd_menuNavigation,0,false);
			blinker_index = 0;
		}
		if key_down and !key_up and select_y = 1 {
			select_y += 1;
			audio_play_sound(snd_menuNavigation,0,false);
			blinker_index = 0;
		}
	}else {
		if(keyboard_string != "") and no_key_pressed and string_length(seed_string) < 10 {
			switch(keyboard_string) {
				case "1":  seed_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "2":  seed_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "3":  seed_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "4":  seed_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "5":  seed_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "6":  seed_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "7":  seed_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "8":  seed_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "9":  seed_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "0":  seed_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
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
			audio_play_sound(snd_unavailable,0,false);
		}
		if string_length(seed_string) > 10 {
		    seed_string = string_copy(seed_string, 1, 10);
			audio_stop_sound(snd_selectOption);
		}
	}
	
	if !key_left and !key_right {
		selected_x = false;
		alarm3_time = 30;
		alarm[3] = alarm3_time;
	}
}

if controller = true {
	//select
	if key_select and centered = true and fade_away = false {
		if select_y = 1 {
			if select_x != 10 {
				audio_play_sound(snd_selectOption,0,false);
			}else {
				audio_play_sound(snd_unavailable,0,false);
			}
			switch(select_x) {
				case 0:  seed_string += "1"; break;
				case 1:  seed_string += "2"; break;
				case 2:  seed_string += "3"; break;
				case 3:  seed_string += "4"; break;
				case 4:  seed_string += "5"; break;
				case 5:  seed_string += "6"; break;
				case 6:  seed_string += "7"; break;
				case 7:  seed_string += "8"; break;
				case 8:  seed_string += "9"; break;
				case 9:  seed_string += "0"; break;
				case 10: seed_string = string_copy(seed_string, 1, string_length(seed_string)-1); break;
			}
			if string_length(seed_string) > 10 {
			    seed_string = string_copy(seed_string, 1, 10);
			}
		}else if select_y = 2 {
			if select_x2 = 1 {
				audio_play_sound(snd_selectOption,0,false);
				alarm[0] = 1;
				fade_away = true;
				submitted = true;
				//do seed apply code here
				if seed_string != "" {
					global.seed_switched = true;
					global.seed = real(seed_string);
					global.random_seed = false;
					scr_Save_Real("random_seed",global.random_seed);
					random_set_seed(global.seed);
					scr_Restart_Level();
				}
			}else if select_x2 = 2 {
				audio_play_sound(snd_unavailable,0,false);
				alarm[0] = 1;
				fade_away = true;
				canceled = true;
			}
		}
	}
}else {
	
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
}

//back
if key_back and centered = true and fade_away = false and !instance_exists(obj_fade_in) {
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