if keyboard_check(vk_backspace) and string_length(seed_string) > 0 {
	seed_string = string_copy(seed_string, 1, string_length(seed_string)-1);
	alarm[2] = 2;
}