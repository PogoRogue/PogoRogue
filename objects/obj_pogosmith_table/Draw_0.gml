/// @description draw UI when colliding
draw_self();
if (colliding) {
	image_index = 1;
	
	//check if we should draw controller UI or keyboard UI
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo2);
	
	//check if we should draw controller UI or keyboard UI
	if global.use_controller = true {
		draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[6][0]),0,x,bbox_top+40);
	}else {
		var keyboard_array_value = global.keyboard_array[6][0];
		var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
		if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
			if is_string(keyboard_text) {
				scr_Draw_Text_Outlined(x,bbox_top+40,string(keyboard_text),c_white);
			}else {
				draw_sprite(keyboard_text,0,x,bbox_top+40);
			}
		}else {
			var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
			draw_sprite(mouse_sprite,0,x,bbox_top+40);
		}
	}
}else {
	image_index = 0;	
}