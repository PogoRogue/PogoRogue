draw_set_halign(fa_center);
draw_set_valign(fa_top);

var y_offset2 = 0;

for (i = 0; i < array_length(credits_text_array); i++) {
	for (j = 0; j <= 1; j++) {
		if j = 0 {
			draw_set_font(fnt_item_popup);
			y_offset2 += string_separation;
			scr_Draw_Text_Outlined(384,yy+y_offset2,credits_text_array[i][j],make_color_rgb(237,225,158));
		}else {
			draw_set_font(fnt_combo2);
			if is_string(credits_text_array[i][j]) {
				scr_Draw_Text_Outlined(384,yy+y_offset2,credits_text_array[i][j],c_white);
			}else {
				draw_sprite(credits_text_array[i][j],0,384,yy+y_offset2);
			}
		}
		
		if is_string(credits_text_array[i][j]) {
			y_offset2 += string_height(credits_text_array[i][j]);
		}else if j = 1 {
			y_offset2 += sprite_get_height(credits_text_array[i][j]);
		}
		//y_offset2 += string_height(credits_text_array[i][j]);
	}
}

//scroll button
var xx = room_width-16;
draw_set_halign(fa_right);
draw_set_valign(fa_center);
draw_set_font(fnt_combo2);

if global.use_controller = true {
	scr_Draw_Text_Outlined(xx,416,"Press         To Scroll",c_white);
	draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[16][0]),0,xx-60,416);
}else {
	var keyboard_array_value = global.keyboard_array[16][0];
	var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
	if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
		if is_string(keyboard_text) {
			scr_Draw_Text_Outlined(xx,416,"Press " + string(keyboard_text) + " To Scroll",c_white);
		}else {
			scr_Draw_Text_Outlined(xx,416,"Press         To Scroll",c_white);
			draw_sprite(keyboard_text,0,xx-60,416);
		}
	}else {
		var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
		scr_Draw_Text_Outlined(xx,416,"Press         To Scroll",c_white);
		draw_sprite(mouse_sprite,0,xx-60,416);
	}
}

draw_set_color(c_white);