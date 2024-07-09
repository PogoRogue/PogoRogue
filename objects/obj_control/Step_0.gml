restart_button = 0;//keyboard_check_pressed(ord("R")); //press R key to restart room (temporary)
screenshake_button = 0;//keyboard_check_pressed(vk_backspace); //press escape key to restart room (temporary)
mute_button = 0;//keyboard_check_pressed(ord("M")); //press M to mute audio (temporary)
itemmenu_button = global.key_item_menu; 
skiplevel_button = keyboard_check_pressed(vk_f1); // skip room shortcut (temporary)

if (restart_button) {
	room_persistent = false;
	scr_Room_Restart(true);
	with obj_pause {
		item_swap = false;
		paused_outside = true;
	}
}

if (mute_button) {
	global.mute = not global.mute;
	var num = audio_get_listener_count();
	for( var i = 0; i < num; i++;)
	{
	    var info = audio_get_listener_info(i);
		if global.mute = true {
			audio_set_master_gain(info[? "index"], 0);
		}else {
			audio_set_master_gain(info[? "index"], 1);
		}
	    ds_map_destroy(info);
	}
}

if (itemmenu_button) and obj_pause.pause = false {
	instance_create_depth(x,y,depth-1,obj_items);
}


if (screenshake_button) {
	global.allow_screenshake = not global.allow_screenshake;
}

if (skiplevel_button) {
	if (room == room_proc_gen_test) {
		room_persistent = false;
		switch (global.phase) {
			case 1:
				scr_Room_Transition(room_boss_1);
				break;
			case 2:
				scr_Room_Transition(room_boss_2);
				break;
			case 3:
				scr_Room_Transition(room_boss_3);
				break;
		}	
	}else if room = room_boss_1 or room = room_boss_2 or room = room_boss_3 {
		room_persistent = false;
		if room != room_boss_3 {
			global.phase++;
			scr_Room_Transition(room_proc_gen_test);
		}else {
			global.phase = 1;
			room_persistent = false;
			scr_Room_Transition(room_menu);
		}
		if global.phase = 2 {
			global.tileset = tl_ground2;
		}
		if global.phase = 3 {
			global.tileset = tl_ground3;
		}
	}
}

//last room
if room != room_shop {
	global.last_room = room;	
}

//update items list in new phases
scr_All_Actives_Array();

scr_All_Weapons_Array();

if instance_exists(obj_pause) {
	if audio_is_playing(snd_laser) and !instance_exists(obj_laser) and obj_pause.pause = false {
		audio_stop_sound(snd_laser);
	}else if audio_is_playing(snd_laser) and !instance_exists(obj_laser) {
		audio_pause_sound(snd_laser);
	}else if obj_pause.pause = false {
		if audio_is_paused(snd_laser) = true {
			audio_resume_sound(snd_laser);
		}
	}
	if audio_is_playing(snd_laser_enemy) and !instance_exists(obj_enemy_laser) and obj_pause.pause = false {
		audio_stop_sound(snd_laser_enemy);
	}else if audio_is_playing(snd_laser_enemy) and !instance_exists(obj_enemy_laser) {
		audio_pause_sound(snd_laser_enemy);
	}else if obj_pause.pause = false {
		if audio_is_paused(snd_laser_enemy) = true {
			audio_resume_sound(snd_laser_enemy);
		}
	}
}