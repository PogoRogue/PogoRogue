if controller = false {
	if keyboard_check(vk_backspace) and string_length(code_string) > 0 {
		code_string = string_copy(code_string, 1, string_length(code_string)-1);
		alarm[2] = 2;
		audio_play_sound(snd_unavailable,0,false);
	}
}