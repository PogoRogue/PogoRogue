/// @description Fade out

draw_cutin = false;
alarm_set(1, 1 * room_speed);


if !audio_is_playing(global.current_music) {
	audio_play_sound(global.current_music,0,true);
}