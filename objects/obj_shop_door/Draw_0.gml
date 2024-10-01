/// @description draw UI when colliding
draw_self();
if (colliding) and global.draw_ui {
	//check if we should draw controller UI or keyboard U
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(fnt_combo2);
	draw_set_color(make_color_rgb(242,240,229));
	
	var enter_exit_text = "";
	var temp_x_offset = 0;
	if obj_player.state != obj_player.state_shop_portal {
		if room = room_shop {
			enter_exit_text = "Exit";
			temp_x_offset = 4;
			scr_Draw_Input_UI(x,bbox_top+20,6,0,fnt_itemdescription2,fa_center,fa_center);
		}else {
			enter_exit_text = "Enter";	
			temp_x_offset = 0;
			scr_Draw_Input_Prompt(x,bbox_top+20,6,"Enter",make_color_rgb(242,240,229));
		}
	}
	
	
	/*
	if global.use_controller = true {
		scr_Draw_Text_Outlined(x,bbox_top+16,"Press         To " + enter_exit_text + " Shop",c_white);
		draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[6][0]),0,x-20+temp_x_offset,bbox_top+16);
	}else {
		var keyboard_array_value = global.keyboard_array[6][0];
		var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
		if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
			if is_string(keyboard_text) {
				scr_Draw_Text_Outlined(x,bbox_top+16,"Press " + string(keyboard_text) + " To " + enter_exit_text + " Shop",c_white);
			}else {
				scr_Draw_Text_Outlined(x,bbox_top+16,"Press         To " + enter_exit_text + " Shop",c_white);
				draw_sprite(keyboard_text,0,x-20+temp_x_offset,bbox_top+16);
			}
		}else {
			var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
			scr_Draw_Text_Outlined(x,bbox_top+16,"Press         To " + enter_exit_text + " Shop",c_white);
			draw_sprite(mouse_sprite,0,x-20+temp_x_offset,bbox_top+16);
		}
	}*/
}

draw_set_color(c_white);