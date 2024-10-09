/// @description Reset variables

if room = room_tutorial {
	global.music_volume_multiplier = 0.3;
	audio_group_set_gain(audiogroup_music, global.music_volume_multiplier*((exp(0.24*((10 / 100) * global.music_volume))-1)/10), 2000);
}else if room = room_starting_area {
	global.music_volume_multiplier = 0.3;
	audio_group_set_gain(audiogroup_music, global.music_volume_multiplier*((exp(0.24*((10 / 100) * global.music_volume))-1)/10), 2000);
}else {
	global.music_volume_multiplier = 1;
	audio_group_set_gain(audiogroup_music, ((exp(0.24*((10 / 100) * global.music_volume))-1)/10), 2000);
}


//create pause object
if !instance_exists(obj_pause) {
	instance_create_depth(0,0,depth,obj_pause);	
}
if !instance_exists(obj_pausemenu) {
	instance_create_depth(0,0,depth-2,obj_pausemenu);	
}
if !instance_exists(obj_parallax_control) {
	instance_create_depth(x,y,depth,obj_parallax_control);
}

audio_group_stop_all(audiogroup_default);

room_speed = 60;

//reset slow mo effect
var all_music = audio_group_get_assets(audiogroup_music);

for (i=0;i<array_length(all_music);i++) {
	audio_sound_pitch(all_music[i],max(room_speed/60,0.8));
}

var all_sounds = audio_group_get_assets(audiogroup_default);

for (i=0;i<array_length(all_sounds);i++) {
	audio_sound_pitch(all_sounds[i],max(room_speed/60,0.8));
}

var all_volleyball_sounds = audio_group_get_assets(audiogroup_volleyball);

for (i=0;i<array_length(all_volleyball_sounds);i++) {
	audio_sound_pitch(all_volleyball_sounds[i],max(room_speed/60,0.8));
}

global.enemy_killed = false; //resume combo meter when set to true after killing 1st enemy in room

//set music
if room = room_proc_gen_test  {
	switch (global.phase) {
		case 1: global.current_music = snd_music_level1; break;
		case 2: global.current_music = snd_music_level2; break;	
		case 3: global.current_music = snd_music_level3; break;	
	}
	
}else if room = room_boss_1 {
	global.current_music = snd_music_boss1
}else if room = room_boss_2 {
	global.current_music = snd_music_boss2;
}else if room = room_boss_3 {
	global.current_music = snd_music_boss3;
}else if room = room_tutorial {
	global.current_music = snd_music_level1;
}else if room != room_shop {
	global.current_music = snd_music_level1;
}else {
	global.current_music = snd_music_shop;
}

//music test
if !audio_is_playing(global.current_music) {
	audio_stop_all();
	if room != room_boss_1 and room != room_boss_2 and room != room_boss_3 {
		alarm[1] = 30;
	}
}

if room = room_proc_gen_test {
	if global.last_room != room_shop and global.shop_num <= global.current_shop_num {
		//global.show_tips_screen = true;	
	}
}else {
	global.show_tips_screen = false;	
}


if room = room_proc_gen_test {
	if global.phase = 1 {
		global.salesman_spawn_area = choose(1,2,2,3); //1 = last combat room, 3 = first
		if global.salesman_spawn_area = 3 {
			global.pogosmith_spawn_area = choose(1,1,2);
		}else if global.salesman_spawn_area = 2 {
			global.pogosmith_spawn_area = 1;
		}else if global.salesman_spawn_area = 1 {
			global.pogosmith_spawn_area = 2;
		}
	}else {
		global.salesman_spawn_area = choose(1,2,2,2); //1 = last combat room, 3 = first
		 if global.salesman_spawn_area = 2 {
			global.pogosmith_spawn_area = 1;
		}else if global.salesman_spawn_area = 1 {
			global.pogosmith_spawn_area = 2;
		}
	}
}else {
	global.pogosmith_spawn_area = 1;
	global.salesman_spawn_area = 1;
}

global.room_width = 768;
global.room_height = 432;
camera_set_view_size(view_camera[0],global.room_width,global.room_height);

//create "now entering" text
if (room = room_proc_gen_test or room = room_starting_area or room = room_tutorial)
and global.last_room != room_shop {
	instance_create_depth(x,y,depth,obj_nowentering_text);
}