/// @description draw UI when colliding
draw_self();
if (colliding) {
	//check if we should draw controller UI or keyboard U
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo2);
	
	var enter_exit_text = "";
	var temp_x_offset = 0;
	if room = room_proc_gen_test {
		enter_exit_text = "Enter Boss Room";
		temp_x_offset = 0;
	}else {
		enter_exit_text = "Proceed";
		temp_x_offset = 23;
	}
	
	var xx = x + 48;
	var yy = bbox_top+28;
	var button_num = 6;
	var text = "Proceed";
	var text_color = make_color_rgb(242,240,229);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(fnt_itemdescription2);
	draw_set_color(make_color_rgb(33,33,35));
	if obj_player.state != obj_player.state_portal {
		//draw interact button
		if global.use_controller = true {
			scr_Draw_Text_Outlined(xx+13-4,yy+3,text,text_color);
			draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[button_num][0]),0,xx-14-4,yy-4);
		}else {
			var keyboard_array_value = global.keyboard_array[button_num][0];
			var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
			if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
				if is_string(keyboard_text) {
					scr_Draw_Text_Outlined(xx,yy+3,string(keyboard_text) + " " + text,text_color);
				}else {
					scr_Draw_Text_Outlined(xx+13-4,yy+3,text,text_color);
					draw_sprite(keyboard_text,0,xx-14-4,yy-4);
				}
			}else {
				var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
				scr_Draw_Text_Outlined(xx+13-4,yy+3,text,text_color);
				draw_sprite(mouse_sprite,0,xx-14-4,yy-4);
			}
		}
	}
	
	
/*
	if global.use_controller = true {
		scr_Draw_Text_Outlined(x+48,bbox_top+16,"Press         To " + enter_exit_text,c_white);
		draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[6][0]),0,x+48-36+temp_x_offset,bbox_top+16);
	}else {
		var keyboard_array_value = global.keyboard_array[6][0];
		var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
		if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
			if is_string(keyboard_text) {
				scr_Draw_Text_Outlined(x+48,bbox_top+16,"Press " + string(keyboard_text) + " To " + enter_exit_text,c_white);
			}else {
				scr_Draw_Text_Outlined(x+48,bbox_top+16,"Press         To " + enter_exit_text,c_white);
				draw_sprite(keyboard_text,0,x+48-36+temp_x_offset,bbox_top+16);
			}
		}else {
			var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
			scr_Draw_Text_Outlined(x+48,bbox_top+16,"Press         To " + enter_exit_text,c_white);
			draw_sprite(mouse_sprite,0,x+48-36+temp_x_offset,bbox_top+16);
		}
	}*/
}