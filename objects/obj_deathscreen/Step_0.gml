key_left = global.key_left_menu;
key_right = global.key_right_menu;
key_select = global.key_select;

if instance_exists(obj_camera) {
	var distance = distance_to_point(obj_camera.x, obj_camera.y);

	if(distance <= 100){
		spd_multiply = distance / 100;
	}
	
	if y < obj_camera.y {
		x = obj_camera.x;
		y += spd * spd_multiply;
	}
	
	if y >= obj_camera.y {
		y = obj_camera.y;
	}
	
	if y >= obj_camera.y - 16 and centered = false {
		centered = true;
		select_x = 1;
	}
}

if centered = true {
	if select_x = 0 {
		select_x = 1;	
	}
	
	if win = false {
		//left/right
		if key_left and select_x > 1 and selected_x = false {
			select_x -= 1;
			selected_x = true;
			audio_play_sound(snd_menuNavigation,0,false);
		}else if key_right and select_x < select_x_max and selected_x = false {
			select_x += 1;
			selected_x = true;
			audio_play_sound(snd_menuNavigation,0,false);
		}
	
		if !key_left and !key_right {
			selected_x = false;
		}
	}
	
	
	//selected
	if win = false {
		if key_select and select_x = 1 { //restart
			scr_Restart_Level();
			global.total_runs += 1;
			scr_Save_Real("total_runs",global.total_runs);
		}
	
		if key_select and select_x = 2 { //main menu
			scr_Game_Restart();
			audio_play_sound(snd_selectOption,0,false);
		}
	}else {
		if key_select {
			scr_Room_Transition(room_credits_scrolling);
			audio_play_sound(snd_selectOption,0,false);
		}
	}
}

//darken screen
if (alpha < 0.75) {
	alpha += 0.01;	
}

if win = true {
	with obj_player {
		if bbox_top > obj_camera.y + (obj_camera.view_h_half) {
			state = state_immobile;
		}
	}
	if win_stat_added = false and global.random_seed = true {
		//check if time is new best
		if global.current_time_elapsed < global.fastest_time_random
		or global.fastest_time_random = 0 { //fastest time across all runs
			global.fastest_time_random = global.current_time_elapsed;
			scr_Save_Real("fastest_time_random",global.fastest_time_random);
			best_time = true;
		}
		win_stat_added = true;
	}else if win_stat_added = false and global.random_seed = false {
		//check if time is new best
		if global.current_time_elapsed < global.fastest_time_custom
		or global.fastest_time_custom = 0 { //fastest time across all runs
			global.fastest_time_custom = global.current_time_elapsed;
			scr_Save_Real("fastest_time_custom",global.fastest_time_custom);
			best_time = true;
		}
		win_stat_added = true;
	}
	//unlock skin
	var skin = 4;
	if global.skins_unlocked_array[skin-1] = false {
		ini_open("itemsunlocked.ini");
		instance_create_depth(x,y,depth,obj_skinunlocked_popup,{skin_num: skin});
		global.skins_unlocked_array[skin-1] = true;
		ini_write_real("itemsunlocked", "skin " + string(skin), global.skins_unlocked_array[skin-1]);
		ini_close();	
	}
}