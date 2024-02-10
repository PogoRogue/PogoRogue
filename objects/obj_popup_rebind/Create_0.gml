deleted = false;
alpha = 3;
gamepad = global.use_controller;
gamepad_released = false;
button_sprite = spr_nothing;
text = "";
array_index1 = obj_settings.select_y-2;
array_index2 = obj_settings.bindings_x-1;
old_button_sprite = spr_button_empty;
old_text = "";

//gamepad
//icon sprites
if (gamepad = true) {
	old_button_sprite = scr_Gamepad_Get_Button_Sprite(global.gamepad_array[array_index1][array_index2]);
}

//keyboard
if (gamepad = false and !scr_In_Array(global.mouse_button_array,global.keyboard_array[array_index1][array_index2])) {
	if scr_In_Array(global.keyboard_sprites_array,global.keyboard_array[array_index1][array_index2]) {		
		//sprite
		old_button_sprite = scr_Keyboard_Get_Key_String(global.keyboard_array[array_index1][array_index2]);
	}else {
		//text
		old_text = scr_Keyboard_Get_Key_String((global.keyboard_array[array_index1][array_index2]));
	}
}else if (gamepad = false) {
	old_button_sprite = scr_Mouse_Get_Button_Sprite(global.keyboard_array[array_index1][array_index2]);	
}

//get array to check for duplicates with
array_ignore = array_index1;
if (!gamepad) {
	if (array_index1 <= 13) {
		check_array = global.keyboard_gameplay_array;
	}else {
		check_array = global.keyboard_menu_array;
		array_ignore -= 14;
	}
}else {
	if (array_index1 <= 13) {
		check_array = global.gamepad_gameplay_array;
	}else {
		check_array = global.gamepad_menu_array;
		array_ignore -= 14;
	}
}