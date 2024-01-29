key_left = global.key_left_menu;
key_right = global.key_right_menu;
key_up = global.key_up_menu;
key_down = global.key_down_menu;
key_select = global.key_select;
key_back = global.key_back;

if select_y = 0 { //top row, change between setting types
	select_x = 1;
	if key_left and select > 1 and selected_x = false {
		select -= 1;
		selected_x = true;
		audio_play_sound(snd_menuNavigation,0,false);
	}
	if key_right and select < select_max and selected_x = false {
		select += 1;
		selected_x = true;
		audio_play_sound(snd_menuNavigation,0,false);
	}
	//down
	if select = 1 and key_down and select_y < select_y_max and selected_y = false {
		select_y += 1;
		selected_y = true;
		audio_play_sound(snd_menuNavigation,0,false);
	}
	if select = 2 and key_down and select_y < select_y_max and selected_y = false {
		select_y += 1;
		selected_y = true;
		audio_play_sound(snd_menuNavigation,0,false);
	}
}else {
	//navigate up and down
	if key_up and select_y > 0 and selected_y = false {
		select_y -= 1;
		selected_y = true;
		alarm2_time = 30;
		audio_play_sound(snd_menuNavigation,0,false);
	}
	if key_down and select_y < select_y_max and selected_y = false {
		select_y += 1;
		selected_y = true;
		alarm2_time = 30;
		audio_play_sound(snd_menuNavigation,0,false);
	}
}

#region //AUDIO
if select = 1 { //video
	
	select_y_max = menu_audio.num_of_options;
	
	if select_y > 0 {
		for(i = 0; i < menu_audio.num_of_options; i++) {
			if menu_audio.options_array[i]._type = "slider" {
				if i = select_y-1 {
					//navigate left and right
					if key_left and menu_audio.options_array[i].current_value > 0 and selected_x = false {
						menu_audio.options_array[i].current_value -= menu_audio.options_array[i].increment;
						selected_x = true;
						menu_audio.options_array[i].on_select();
						alarm[2] = alarm2_time;
					}
					if key_right and menu_audio.options_array[i].current_value < menu_audio.options_array[i].highest_value and selected_x = false {
						menu_audio.options_array[i].current_value += menu_audio.options_array[i].increment;
						selected_x = true;
						menu_audio.options_array[i].on_select();
						alarm[2] = alarm2_time;
					}
				}
			}
		}
	}
}
#endregion

#region //VIDEO
if select = 2 { //video
	
	select_y_max = menu_video.num_of_options;
	
	//specific option type things
	for(i = 0; i < menu_video.num_of_options; i++) {
		if menu_video.options_array[i]._type = "list_slider" {
			menu_video.options_array[i].on_existing();
		}
	}

	//if selected... do whatever for each option type
	if select_y > 0 {
		for(i = 0; i < menu_video.num_of_options; i++) {
			if menu_video.options_array[i]._type = "checkbox" {
				if i = select_y-1 and key_select {
					menu_video.options_array[i].current_mode = not menu_video.options_array[i].current_mode;
					if menu_video.options_array[i].current_mode = true {
						global.fullscreen = true;
						scr_Save_Real("fullscreen",global.fullscreen);
						menu_video.options_array[i].do_on_true();
						audio_play_sound(snd_selectOption,0,false);
					}else {
						global.fullscreen = false;
						scr_Save_Real("fullscreen",global.fullscreen);
						menu_video.options_array[i].do_on_false();
						audio_play_sound(snd_selectOption,0,false);
					}
				}
			}
			if menu_video.options_array[i]._type = "list_slider" {
				if i = select_y-1 {
					//navigate left and right
					if key_left and menu_video.options_array[i].current_selection > 0 and selected_x = false {
						global.resolution_num -= 1;
						scr_Save_Real("resolution_num",global.resolution_num);
						menu_video.options_array[i].current_selection -= 1;
						selected_x = true;
						global.resolution_x = menu_video.options_array[i].list_of_options[menu_video.options_array[i].current_selection][0];
						global.resolution_y = menu_video.options_array[i].list_of_options[menu_video.options_array[i].current_selection][1];
						scr_Save_Real("resolution_x",global.resolution_x);
						scr_Save_Real("resolution_y",global.resolution_y);
						audio_play_sound(snd_menuNavigation,0,false);
					}
					if key_right and menu_video.options_array[i].current_selection < menu_video.options_array[i].num_of_values - 1 and selected_x = false {
						global.resolution_num += 1;
						scr_Save_Real("resolution_num",global.resolution_num);
						menu_video.options_array[i].current_selection += 1;
						selected_x = true;
						global.resolution_x = menu_video.options_array[i].list_of_options[menu_video.options_array[i].current_selection][0];
						global.resolution_y = menu_video.options_array[i].list_of_options[menu_video.options_array[i].current_selection][1];
						scr_Save_Real("resolution_x",global.resolution_x);
						scr_Save_Real("resolution_y",global.resolution_y);
						audio_play_sound(snd_menuNavigation,0,false);
					}
					//select
					if (key_select and !window_get_fullscreen()) {
						window_set_size(menu_video.options_array[i].list_of_options[menu_video.options_array[i].current_selection][0],menu_video.options_array[i].list_of_options[menu_video.options_array[i].current_selection][1]);
						alarm[1] = 10;
						global.resolution_x = menu_video.options_array[i].list_of_options[menu_video.options_array[i].current_selection][0];
						global.resolution_y = menu_video.options_array[i].list_of_options[menu_video.options_array[i].current_selection][1];
						scr_Save_Real("resolution_x",global.resolution_x);
						scr_Save_Real("resolution_y",global.resolution_y);
						audio_play_sound(snd_selectOption,0,false);
					}
				}
			}
		}
	}
}
#endregion


//end settings code
if !key_left and !key_right {
	selected_x = false;
	alarm2_time = 30;
}

if !key_up and !key_down {
	selected_y = false;
}

if key_back {
	if room != room_settings {
		alarm[0] = 1;
	}else {
		room = room_menu;	
	}
}