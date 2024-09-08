if activated = true or retract = true {
	if bubble_index >= 5 + (3*size2) {
		//draw middle piece
		for (i = 0; i <= y_offset*2; i += 1) {
			draw_sprite(middle_sprite,floor(bubble_index),x,y+y_offset - i);
		}
	}else if size2 = true {
		y_offset = 0;
	}
	draw_sprite(bottom_sprite,floor(bubble_index),x,y+y_offset);
	draw_sprite(top_sprite,floor(bubble_index),x,y-y_offset);
}

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_itemdescription2);
draw_set_color(make_color_rgb(33,33,35));

if size2 = true {
	var text_y_offset = 16;
}else {
	var text_y_offset = 0;
}

if type_text = true {
	scr_Draw_Text_Outlined(x,y-(24)-text_y_offset,scr_Linebreak(scrolling_text,chars_per_line,chars_per_line),text_color);
}

if current_text = scrolling_text and (current_line < lines_of_text or current_line >= lines_of_text and retract_distance = 0) {
	if repeat_text = true and current_line >= lines_of_text {
		var _text = "Repeat"
		var _x = 3;
		var _col = make_color_rgb(104,194,211);
	}else {
		var _text = "Next"
		var _x = 0;
		var _col = make_color_rgb(242,240,229);
	}
	//draw interact button
	if global.use_controller = true {
		scr_Draw_Text_Outlined(x+10+_x,y-(41)-y_offset-text_y_offset,_text,_col);
		draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[6][0]),0,x-10-_x,y-(42)-y_offset-text_y_offset);
	}else {
		var keyboard_array_value = global.keyboard_array[6][0];
		var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
		if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
			if is_string(keyboard_text) {
				scr_Draw_Text_Outlined(x+_x,y-(38)-y_offset-text_y_offset,string(keyboard_text) + " " + _text,c_white);
			}else {
				scr_Draw_Text_Outlined(x+10+_x,y-(41)-y_offset-text_y_offset,_text,_col);
				draw_sprite(keyboard_text,0,x-10-_x,y-(42)-y_offset-text_y_offset);
			}
		}else {
			var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
			scr_Draw_Text_Outlined(x+10+_x,y-(41)-y_offset-text_y_offset,_text,_col);
			draw_sprite(mouse_sprite,0,x-10-_x,y-(42)-y_offset-text_y_offset);
		}
	}
}

draw_set_color(c_white);

//1 lines = 10px high
//2 lines = 20px high
//3 lines = 30px high
//4 lines = 40px high