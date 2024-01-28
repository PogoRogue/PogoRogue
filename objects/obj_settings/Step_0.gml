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
	}
	if key_right and select < select_max and selected_x = false {
		select += 1;
		selected_x = true;
	}
	//down
	if select = 2 and key_down and select_y < select_y_max and selected_y = false {
		select_y += 1;
		selected_y = true;
	}
}

//enter settings code here
if select = 2 { //video
	
	select_y_max = menu_video.num_of_options;
	
	//specific option type things
	for(i = 0; i < menu_video.num_of_options; i++) {
		if menu_video.options_array[i]._type = "list_slider" {
			menu_video.options_array[i].on_existing();
		}
	}
	

	if select_y > 0 {
		
		//navigate up and down
		if key_up and select_y > 0 and selected_y = false {
			select_y -= 1;
			selected_y = true;
		}
		if key_down and select_y < select_y_max and selected_y = false {
			select_y += 1;
			selected_y = true;
		}
	
		//if selected... do whatever for each option type
		for(i = 0; i < menu_video.num_of_options; i++) {
			if menu_video.options_array[i]._type = "checkbox" {
				if i = select_y-1 and key_select {
					menu_video.options_array[i].current_mode = not menu_video.options_array[i].current_mode;
					if menu_video.options_array[i].current_mode = true {
						menu_video.options_array[i].do_on_true();
					}else {
						menu_video.options_array[i].do_on_false();
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
					}
					if key_right and menu_video.options_array[i].current_selection < menu_video.options_array[i].num_of_values - 1 and selected_x = false {
						global.resolution_num += 1;
						scr_Save_Real("resolution_num",global.resolution_num);
						menu_video.options_array[i].current_selection += 1;
						selected_x = true;
					}
					if (key_select and !window_get_fullscreen()) {
						window_set_size(menu_video.options_array[i].list_of_options[menu_video.options_array[i].current_selection][0],menu_video.options_array[i].list_of_options[menu_video.options_array[i].current_selection][1]);
						alarm[1] = 10;
					}
				}
			}
		}
	}
}


//end settings code
if !key_left and !key_right {
	selected_x = false;
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