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
		if select_y < 5 {
			if key_left and !key_right and select_x > 1 and selected_x = false {
				select_x -= 1;
				select -= 1;
				audio_play_sound(snd_menuNavigation,0,false);
				selected_x = true;
				alarm[3] = alarm3_time;
			}else if key_left and !key_right and select_x = 1 and selected_x = false {
				select_x = select_x_max;
				select += 2;
				audio_play_sound(snd_menuNavigation,0,false);
				selected_x = true;
				alarm[3] = alarm3_time;
			}
			
			if key_right and !key_left and select_x < select_x_max and selected_x = false {
				select_x += 1;
				select += 1;
				audio_play_sound(snd_menuNavigation,0,false);
				selected_x = true;
				alarm[3] = alarm3_time;
			}else if key_right and !key_left and select_x = select_x_max and selected_x = false {
				select_x = 1;
				select -= 2;
				audio_play_sound(snd_menuNavigation,0,false);
				selected_x = true;
				alarm[3] = alarm3_time;
			}
			
		}else if select_y = 5 {
			if key_left and !key_right and select_x2 = 2 {
				select_x2 -= 1;
				audio_play_sound(snd_menuNavigation,0,false);
			}
			if key_right and !key_left and select_x2 = 1 {
				select_x2 += 1;
				audio_play_sound(snd_menuNavigation,0,false);
			}
		}
	
		if key_up and !key_down and select_y != 1 and selected_y = false {
			select -= 3
			select_y -= 1;
			audio_play_sound(snd_menuNavigation,0,false);
			blinker_index = 0;
			selected_y = true;
			alarm[4] = alarm3_time;
		}
		if key_down and !key_up and select_y != select_y_max and selected_y = false {
			select_y += 1;
			select += 3;
			audio_play_sound(snd_menuNavigation,0,false);
			blinker_index = 0;
			selected_y = true;
			alarm[4] = alarm3_time;
		}
	}else {
		if(keyboard_string != "") and no_key_pressed and string_length(code_string) < 8 {
			switch(keyboard_string) {
				case "1":  code_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "2":  code_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "3":  code_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "4":  code_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "5":  code_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "6":  code_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "7":  code_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "8":  code_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "9":  code_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
				case "0":  code_string += keyboard_string; audio_play_sound(snd_selectOption,0,false); break;
			}
	   
		    keyboard_string = "";
		}
		if !keyboard_check(vk_anykey) and no_key_pressed = false {
			no_key_pressed = true;	
			keyboard_string = "";
		}
		if keyboard_check_pressed(vk_backspace) and string_length(code_string) > 0 {
			code_string = string_copy(code_string, 1, string_length(code_string)-1);
			alarm[2] = 30;
			audio_play_sound(snd_unavailable,0,false);
		}
		if string_length(code_string) > 8 {
		    code_string = string_copy(code_string, 1, 8);
			audio_stop_sound(snd_selectOption);
		}
	}
	
	if !key_left and !key_right {
		selected_x = false;
		alarm3_time = 30;
		alarm[3] = alarm3_time;
	}
	if !key_up and !key_down {
		selected_y = false;
		alarm3_time = 30;
		alarm[4] = alarm3_time;
	}
}

if controller = true {
	//select
	if key_select and centered = true and fade_away = false {
		if select_y != 5 {
			if select != 11 {
				audio_play_sound(snd_selectOption,0,false);
			}else {
				audio_play_sound(snd_unavailable,0,false);
			}
			switch(select) {
				case 0:  code_string += "1"; break;
				case 1:  code_string += "2"; break;
				case 2:  code_string += "3"; break;
				case 3:  code_string += "4"; break;
				case 4:  code_string += "5"; break;
				case 5:  code_string += "6"; break;
				case 6:  code_string += "7"; break;
				case 7:  code_string += "8"; break;
				case 8:  code_string += "9"; break;
				case 9: alarm[0] = 1; fade_away = true; submitted = true; break; //submit
				case 10:  code_string += "0"; break;
				case 11: code_string = string_copy(code_string, 1, string_length(code_string)-1); break; //backspace
			}
			if string_length(code_string) > 8 {
			    code_string = string_copy(code_string, 1, 8);
			}
		}else if select_y = 5 {
			if select_x2 = 1 {
				audio_play_sound(snd_selectOption,0,false);
				alarm[0] = 1;
				fade_away = true;
				submitted = true;
				//do code apply code here
			}else if select_x2 = 2 {
				audio_play_sound(snd_unavailable,0,false);
				alarm[0] = 1;
				fade_away = true;
				canceled = true;
			}
		}
		
		if submitted = true {
			//do code apply code here
			if code_string = "87435522" {
				//unlock all skins
				for (i=0; i < array_length(global.skins_unlocked_array); i++) {
					ini_open("itemsunlocked.ini");
					global.skins_unlocked_array[i] = true;
					ini_write_real("itemsunlocked", "skin " + string(i+1), global.skins_unlocked_array[i]);
					ini_close();	
				}
				instance_activate_object(obj_code_station);
				obj_code_station.code_accepted = true;
				obj_code_station.code_denied = false;
				obj_code_station.alarm[0] = 300;
			}else if code_string = "55206237" {
				//unlock all items
				for (i=0; i < array_length(global.passive_unlocked_array); i++) {
					ini_open("itemsunlocked.ini");
					global.passive_unlocked_array[i] = true;
					ini_write_real("itemsunlocked", "passive " + string(i), global.passive_unlocked_array[i]);
					ini_close();	
				}
				for (i=0; i < array_length(global.active_unlocked_array); i++) {
					ini_open("itemsunlocked.ini");
					global.active_unlocked_array[i] = true;
					ini_write_real("itemsunlocked", "active " + string(i), global.active_unlocked_array[i]);
					ini_close();	
				}
				for (i=0; i < array_length(global.weapon_unlocked_array); i++) {
					ini_open("itemsunlocked.ini");
					global.weapon_unlocked_array[i] = true;
					ini_write_real("itemsunlocked", "weapon " + string(i), global.weapon_unlocked_array[i]);
					ini_close();	
				}
				instance_activate_object(obj_code_station);
				obj_code_station.code_accepted = true;
				obj_code_station.code_denied = false;
				obj_code_station.alarm[0] = 300;
			}else { //invalid code
				instance_activate_object(obj_code_station);
				obj_code_station.code_accepted = false;
				obj_code_station.code_denied = true;
				obj_code_station.alarm[0] = 120;
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
		//do code apply code here
		if code_string = "87435522" {
			//unlock all skins
			for (i=0; i < array_length(global.skins_unlocked_array); i++) {
				ini_open("itemsunlocked.ini");
				global.skins_unlocked_array[i] = true;
				ini_write_real("itemsunlocked", "skin " + string(i+1), global.skins_unlocked_array[i]);
				ini_close();	
			}

			instance_activate_object(obj_code_station);
			obj_code_station.code_accepted = true;
			obj_code_station.code_denied = false;
			obj_code_station.alarm[0] = 300;
		}else if code_string = "55206237" {
			//unlock all items
			for (i=0; i < array_length(global.passive_unlocked_array); i++) {
				ini_open("itemsunlocked.ini");
				global.passive_unlocked_array[i] = true;
				ini_write_real("itemsunlocked", "passive " + string(i+1), global.passive_unlocked_array[i]);
				ini_close();	
			}
			for (i=0; i < array_length(global.active_unlocked_array); i++) {
				ini_open("itemsunlocked.ini");
				global.active_unlocked_array[i] = true;
				ini_write_real("itemsunlocked", "active " + string(i), global.active_unlocked_array[i]);
				ini_close();	
			}
			for (i=0; i < array_length(global.weapon_unlocked_array); i++) {
				ini_open("itemsunlocked.ini");
				global.weapon_unlocked_array[i] = true;
				ini_write_real("itemsunlocked", "weapon " + string(i), global.weapon_unlocked_array[i]);
				ini_close();
			}
			instance_activate_object(obj_code_station);
			obj_code_station.code_accepted = true;
			obj_code_station.code_denied = false;
			obj_code_station.alarm[0] = 300;
		}else { //invalid code
			instance_activate_object(obj_code_station);
			obj_code_station.code_accepted = false;
			obj_code_station.code_denied = true;
			obj_code_station.alarm[0] = 120;
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