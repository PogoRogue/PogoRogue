alpha = 2;
depth = -1000;

x_offset = 0;
spd = 0;

if room = room_menu or room = room_items or room = room_settings or room = room_stats {
	alpha = 0;	
}

alarm[0] = 11;

audio_group_set_gain(audiogroup_music, global.music_volume/100, 1);