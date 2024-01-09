key_left = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_axis_value(0,gp_axislh) < -0.5;
key_right = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_axis_value(0,gp_axislh) > 0.5;
key_select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0,gp_face1);

if key_left and selected = false {
	audio_play_sound(snd_menuNavigation,0,false);
	if select > 1 {
		select -= 1;
	}
	selected = true;
}else if key_right and selected = false {
	audio_play_sound(snd_menuNavigation,0,false);
	if select < num_of_options {
		select += 1;
	}
	selected = true;
}else if !key_left and !key_right {
	selected = false;
}

if key_select {
	audio_play_sound(snd_selectOption,0,false);
	if select = 1 {
		alarm[0] = 1;
	}else if select = 2 {
		game_end();
	}
}

image_index = select-1;