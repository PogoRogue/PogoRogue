if usable = true {
	key_up = global.key_up_menu;
	key_down = global.key_down_menu;
	key_select = global.key_select;
}else {
	key_up = 0;
	key_down = 0;
	key_select = 0;
}

if key_up and !key_down and selected = false {
	if select > 1 {
		select -= 1;
		audio_play_sound(snd_menuNavigation,0,false);
		frame = 0;
	}
	selected = true;
	alarm[3] = alarm3_time;
}else if key_down and !key_up and selected = false {
	if select < num_of_options {
		select += 1;
		audio_play_sound(snd_menuNavigation,0,false);
		frame = 0;
	}
	selected = true;
	alarm[3] = alarm3_time;
}else if !key_up and !key_down {
	selected = false;
	alarm3_time = 30;
	alarm[3] = alarm3_time;
}

if key_select and !instance_exists(obj_fade_in) {
	if !(select = 1 - options_decrease and global.tutorial_completed = false) {
		audio_play_sound(snd_selectOption,0,false);
	}
	
	if select = 1 - options_decrease {
		if global.tutorial_completed = true {
			scr_Room_Transition(room_starting_area);
		}else {
			//complete tutorial before playing
			audio_play_sound(snd_unavailable,0,false);
			if !instance_exists(obj_tutorial_required_text) {
				instance_create_depth(x,bbox_top-8,depth-1,obj_tutorial_required_text);
			}else {
				obj_tutorial_required_text.alpha = 1.25;
			}
		}
	}else if select = 2 - options_decrease {
		if sprite_index = spr_menu_tutorial {
			scr_Room_Transition(room_tutorial);
		}else {
			scr_Room_Transition(room_gameplay_video);
		}
	}else if select = 3 - options_decrease {
		scr_Room_Transition(room_items);
		//room_persistent = true;
	}else if select = 4 - options_decrease {
		scr_Room_Transition(room_stats);
		//room_persistent = true;
	}else if select = 5 - options_decrease {
		scr_Room_Transition(room_settings);
		//room_persistent = true;
	}else if select = 6 - options_decrease {
		scr_Room_Transition(room_credits);
	}else if select = 7 - options_decrease {
		usable = false;
		instance_create_depth(x,y,depth-1,obj_popup_exit);
	}
}

image_index = select-1;

//move onto screen
if y > 252 {
	if point_distance(x,y,x,252) > 64 {
		if move_spd < 4 {
			move_spd += 0.1;	
		}
	}else {
		move_spd = (point_distance(x,y,x,252)/64)*4;
	}
	y -= move_spd;	
}

frame += (1/3);

global.random_seed = true;
scr_Save_Real("random_seed",global.random_seed);