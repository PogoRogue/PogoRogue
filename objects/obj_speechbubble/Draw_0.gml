if activated = true or retract = true {
	if bubble_index >= 5 {
		//draw middle piece
		for (i = 0; i <= y_offset*2; i += 1) {
			draw_sprite(spr_speechbubble_middle,floor(bubble_index),x,y+y_offset - i);
		}
	}
	draw_sprite(spr_speechbubble_bottom,floor(bubble_index),x,y+y_offset);
	draw_sprite(spr_speechbubble_top,floor(bubble_index),x,y-y_offset);
}

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_itemdescription2);
draw_set_color(make_color_rgb(33,33,35));

if type_text = true {
	scr_Draw_Text_Outlined(x,y-(24),scr_Linebreak(scrolling_text,chars_per_line,chars_per_line),text_color);
}

if current_text = scrolling_text and current_line < lines_of_text {
	//draw interact button
	if global.use_controller = true {
		scr_Draw_Text_Outlined(x+10,y-(41)-y_offset,"Next",make_color_rgb(237,225,158));
		draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[6][0]),0,x-10,y-(42)-y_offset);
	}else {
		var keyboard_array_value = global.keyboard_array[6][0];
		var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
		if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
			if is_string(keyboard_text) {
				scr_Draw_Text_Outlined(x,y-(38)-y_offset,string(keyboard_text) + " Next",c_white);
			}else {
				scr_Draw_Text_Outlined(x+10,y-(41)-y_offset,"Next",make_color_rgb(237,225,158));
				draw_sprite(keyboard_text,0,x-10,y-(42)-y_offset);
			}
		}else {
			var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
			scr_Draw_Text_Outlined(x+10,y-(41)-y_offset,"Next",make_color_rgb(237,225,158));
			draw_sprite(mouse_sprite,0,x-10,y-(42)-y_offset);
		}
	}
}

draw_set_color(c_white);

//1 lines = 10px high
//2 lines = 20px high
//3 lines = 30px high
//4 lines = 40px high