depth = -1001;

x_offset = 384;
spd = 9;
transitioned = false;

if !audio_is_playing(snd_uidoor_close) {
	audio_play_sound(snd_uidoor_close,0,false);
}

scr_Tips();
randomize();
if !instance_exists(obj_fade_in) {
	global.current_tip = global.tips_array[irandom_range(0,array_length(global.tips_array)-1)];
}
random_set_seed(global.seed);

if (room != room_starting_area or next_room = room_shop or next_room = room_boss_1 or next_room = room_boss_2 or next_room = room_boss_3) 
and room != room_menu and room != room_stats
and room != room_settings and room != room_items
or room = room_shop  {
	audio_group_set_gain(audiogroup_music, 0, 1000);
}

if instance_exists(obj_player) {
	if obj_player.state = obj_player.state_portal
	or obj_player.state = obj_player.state_shop_portal {
		audio_group_set_gain(audiogroup_music, 0, 1000);
	}
}