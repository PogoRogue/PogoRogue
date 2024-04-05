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
		audio_play_sound(snd_menuNavigation,0,false);
		select -= 1;
	}
	selected = true;
	alarm[3] = alarm3_time;
}else if key_down and !key_up and selected = false {
	if select < num_of_options {
		audio_play_sound(snd_menuNavigation,0,false);
		select += 1;
	}
	selected = true;
	alarm[3] = alarm3_time;
}
if !key_up and !key_down {
	selected = false;
	alarm3_time = 30;
	alarm[3] = alarm3_time;
}

if key_select {
	if select = 1 {
		with obj_pause { //resume
			audio_play_sound(snd_selectOption,0,false);
			paused_outside = true;
		}
	}else if select = 2 { //items
		audio_play_sound(snd_selectOption,0,false);
		usable = false;
		instance_create_depth(x,y,depth-1,obj_items);
	}else if select = 3 { //restart
		audio_play_sound(snd_selectOption,0,false);
		usable = false;
		instance_create_depth(x,y,depth-1,obj_popup_restart);
	}else if select = 4 { //settings
		audio_play_sound(snd_selectOption,0,false);
		usable = false;
		instance_create_depth(x,y,depth-1,obj_settings);
	}else if select = 5 { //exit
		audio_play_sound(snd_selectOption,0,false);
		usable = false;
		instance_create_depth(x,y,depth-1,obj_popup_menu);
	}
}

if instance_number(obj_pausemenu) > 1 {
	instance_destroy();	
}

image_index = select-1;