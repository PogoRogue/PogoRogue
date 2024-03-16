// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Draw_Input_UI(x_value,y_value,array_value1,array_value2,font,halign,valign) {
	draw_set_halign(halign);
	draw_set_valign(valign);
	if global.use_controller = true {
		draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[array_value1][array_value2]),2,x_value,y_value);
	}else {
		var keyboard_array_value = global.keyboard_array[array_value1][array_value2];
		var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
		if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
			if is_string(keyboard_text) {
				draw_set_font(font);
				scr_Draw_Text_Outlined(x_value,y_value,keyboard_text,c_white);
			}else {
				draw_sprite(keyboard_text,0,x_value,y_value);
			}
		}else {
			var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
			draw_sprite(mouse_sprite,0,x_value,y_value);	
		}
	}
}