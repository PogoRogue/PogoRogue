depth = -1001;

x_offset = 384;
spd = 8;
transitioned = false;

if !audio_is_playing(snd_uidoor_close) {
	audio_play_sound(snd_uidoor_close,0,false);
}

scr_Tips();
randomize();
global.current_tip = global.tips_array[irandom_range(0,array_length(global.tips_array)-1)];
random_set_seed(global.seed);

if room != room_starting_area and room != room_menu and room != room_stats
and room != room_settings and room != room_items and next_room != room {
	audio_group_set_gain(audiogroup_music, 0, 1000);
}