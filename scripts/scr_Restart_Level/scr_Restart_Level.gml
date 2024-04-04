// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Restart_Level() {
	with instance_create_depth(x,y,-1000,obj_fade_out_restart_level) {
		deactivate_all = true;
		alarm[1] = 1;
	}
	
	//Store the randomized seed, and print it to console

	//If you want to manually set the seed to a number, don't call randomize, and instead set seed = ######
	if global.seed_switched = false {
		randomize();
		global.seed = random_get_seed();

		random_set_seed(global.seed);
		show_debug_message("Random seed: " + string(global.seed));
	}else {
		global.seed_switched = false;
	}
	
	/*if room = room_boss_1 or room = room_boss_2 {
		room_persistent = false;
		instance_activate_all();
		room = room_proc_gen_test;
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
	}*/
}