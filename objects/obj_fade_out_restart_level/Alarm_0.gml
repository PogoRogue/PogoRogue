/// @description go to next room
if room = room_boss_1 or room = room_boss_2 or room = room_boss_3 {
	room_persistent = false;
	instance_activate_all();
	global.phase = 1;
	room = room_proc_gen_test;
	global.current_music = snd_music_level1;
	with instance_create_depth(x,y,depth,obj_restart_game2) {
		alarm[0] = 1;	
	}
}else if room = room_proc_gen_test {
	if global.phase > 1 {
		global.phase = 1;	
	}
	room_persistent = false;
	instance_deactivate_all(false);
	room_restart();
	audio_play_sound(snd_selectOption,0,false);
	global.tileset = tl_ground;
}else if room = room_shop {
	if global.last_room = room_proc_gen_test {
		room_persistent = false;
		instance_activate_all();
		global.phase = 1;
		room = room_proc_gen_test;
		with instance_create_depth(x,y,depth,obj_restart_game2) {
			alarm[0] = 1;	
		}
	}else if global.last_room = room_boss_1 or global.last_room = room_boss_2 {
		room_persistent = false;
		instance_activate_all();
		room = global.last_room;
		with instance_create_depth(x,y,depth,obj_restart_game2) {
			alarm[0] = 1;
		}
	}
}else {
	room_persistent = false;
	scr_Room_Restart(true);
	audio_play_sound(snd_selectOption,0,false);
}