/// @description Draw cutin
if free = true {
	if(!triggered) {
		triggered = true;
		draw_cutin = true;
		alarm_set(0, 2 * room_speed); // Initiate despawn
		//room_height = 750;
		audio_play_sound(snd_showdown,0,false);
	}
}