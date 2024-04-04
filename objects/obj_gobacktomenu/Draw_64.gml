draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_combo2);

if global.use_controller = true {
	scr_Draw_Text_Outlined(384,416,"Press         To Go Back",c_white);
	draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[19][0]),0,384-14,416);
}else {
	var keyboard_array_value = global.keyboard_array[19][0];
	var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
	if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
		if is_string(keyboard_text) {
			scr_Draw_Text_Outlined(384,416,"Press " + string(keyboard_text) + " To Go Back",c_white);
		}else {
			scr_Draw_Text_Outlined(384,416,"Press         To Go Back",c_white);
			draw_sprite(keyboard_text,0,384-14,416);
		}
	}else {
		var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
		scr_Draw_Text_Outlined(384,416,"Press         To Go Back",c_white);
		draw_sprite(mouse_sprite,0,384-14,416);
	}
}