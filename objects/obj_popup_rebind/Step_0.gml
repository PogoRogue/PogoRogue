if scr_Gamepad_Check_Input() = 0 {
	//we want the player to unpress the select button before checking for button presses
	gamepad_released = true;
}

if (scr_Gamepad_Check_Input() > 0 and gamepad = true and gamepad_released = true)
or (keyboard_check_pressed(vk_anykey) and gamepad = false)
or (mouse_check_button_pressed(mb_any) and gamepad = false) {
	if deleted = false {
		deleted = true;
		audio_play_sound(snd_selectOption,0,false);
		alarm[0] = 30;
		
		if (gamepad = true) {
			if !scr_In_Nested_Array(check_array,scr_Gamepad_Get_Button(),array_ignore) {
				button_sprite = scr_Gamepad_Get_Button_Sprite(scr_Gamepad_Get_Button());
				global.gamepad_array[array_index1][array_index2] = scr_Gamepad_Get_Button();
				if (global.gamepad_array[array_index1][0] != global.gamepad_array[array_index1][1]) {
					scr_Save_Controls("gp " + string(array_index1) + "_" + string(array_index2),global.gamepad_array[array_index1][array_index2]);
				}else {
					global.gamepad_array[array_index1][array_index2] = -1;
					scr_Save_Controls("gp " + string(array_index1) + "_" + string(array_index2),global.gamepad_array[array_index1][array_index2]);
				}
			}else {
				image_index = 1;
			}
		}else {
			if scr_In_Array(global.keyboard_sprites_array,keyboard_key) {
				if !scr_In_Nested_Array(check_array,keyboard_key,array_ignore) {
					//sprites
					button_sprite = scr_Keyboard_Get_Key_String(keyboard_key);
					global.keyboard_array[array_index1][array_index2] = keyboard_key;
					if (global.keyboard_array[array_index1][0] != global.keyboard_array[array_index1][1]) {
						scr_Save_Controls("key " + string(array_index1) + "_" + string(array_index2),global.keyboard_array[array_index1][array_index2]);
					}else {
						global.keyboard_array[array_index1][array_index2] = -1;
						scr_Save_Controls("key " + string(array_index1) + "_" + string(array_index2),global.keyboard_array[array_index1][array_index2]);
					}
				}else {
					image_index = 1;
				}
			}else {
				if !scr_In_Array(global.mouse_button_array,mouse_button) {
					if !scr_In_Nested_Array(check_array,keyboard_key,array_ignore) {
						//text
						text = scr_Keyboard_Get_Key_String(keyboard_key);
						global.keyboard_array[array_index1][array_index2] = keyboard_key;
						if (global.keyboard_array[array_index1][0] != global.keyboard_array[array_index1][1]) {
							scr_Save_Controls("key " + string(array_index1) + "_" + string(array_index2),global.keyboard_array[array_index1][array_index2]);
						}else {
							global.keyboard_array[array_index1][array_index2] = -1;
							scr_Save_Controls("key " + string(array_index1) + "_" + string(array_index2),global.keyboard_array[array_index1][array_index2]);
						}
					}else {
						image_index = 1;
					}
				}else {
					if !scr_In_Nested_Array(check_array,mouse_button,array_ignore) {
						button_sprite = scr_Mouse_Get_Button_Sprite(mouse_button);
						global.keyboard_array[array_index1][array_index2] = mouse_button;
						if (global.keyboard_array[array_index1][0] != global.keyboard_array[array_index1][1]) {
							scr_Save_Controls("key " + string(array_index1) + "_" + string(array_index2),global.keyboard_array[array_index1][array_index2]);
						}else {
							global.keyboard_array[array_index1][array_index2] = -1;
							scr_Save_Controls("key " + string(array_index1) + "_" + string(array_index2),global.keyboard_array[array_index1][array_index2]);
						}
					}else {
						image_index = 1;
					}
				}
			}
		}
	}
}

if deleted = true {
	if alpha > 0 {
		alpha -= 0.05;
	}else {
		instance_destroy();
	}
}