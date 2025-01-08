/// @description draw UI when colliding
draw_self();
if (colliding) {
	image_index = 1;
	//check if we should draw controller UI or keyboard U
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(global.uranus);
	
	var temp_x_offset = 0;
	if room = room_shop {
		temp_x_offset = 4;
	}else {
		temp_x_offset = 0;
	}

	if global.use_controller = true {
		scr_Draw_Text_Outlined(x,bbox_top+36,"按         选择武器",c_white);
		//scr_Draw_Text_Outlined(x,bbox_top+48,"Weapon",c_white);
		draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[6][0]),0,x-22+temp_x_offset,bbox_top+36);
	}else {
		var keyboard_array_value = global.keyboard_array[6][0];
		var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
		if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
			if is_string(keyboard_text) {
				scr_Draw_Text_Outlined(x,bbox_top+36,"按 " + string(keyboard_text) + " 选择武器",c_white);
				//scr_Draw_Text_Outlined(x,bbox_top+48,"Weapon",c_white);
			}else {
				scr_Draw_Text_Outlined(x,bbox_top+36,"按         选择武器",c_white);
				//scr_Draw_Text_Outlined(x,bbox_top+48,"Weapon",c_white);
				draw_sprite(keyboard_text,0,x-22+temp_x_offset,bbox_top+36);
			}
		}else {
			var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
			scr_Draw_Text_Outlined(x,bbox_top+36,"按         选择武器",c_white);
			//scr_Draw_Text_Outlined(x,bbox_top+48," Weapon",c_white);
			draw_sprite(mouse_sprite,0,x-22+temp_x_offset,bbox_top+36);
		}
	}
}else {
	image_index = 0;	
}