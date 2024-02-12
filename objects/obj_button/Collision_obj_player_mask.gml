/// @description Press

if(!is_pressed) {
	other.speed = 0;

	is_pressed = true;
	sprite_index = pressed_sprite;
	alarm_set(0, press_duration);
	
	audio_play_sound(snd_beep_placeholder, 0, false, 1, 0, pitch);
}