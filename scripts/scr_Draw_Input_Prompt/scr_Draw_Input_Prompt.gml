// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Draw_Input_Prompt(xx,yy,button_num,text,text_color){
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_itemdescription2);
	draw_set_color(make_color_rgb(33,33,35));
	//draw interact button
	if global.use_controller = true {
		scr_Draw_Text_Outlined(xx+10,yy-4,text,text_color);
		draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[button_num][0]),0,xx-11,yy-4);
	}else {
		var keyboard_array_value = global.keyboard_array[button_num][0];
		var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
		if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
			if is_string(keyboard_text) {
				scr_Draw_Text_Outlined(xx,yy+3,string(keyboard_text) + " " + text,text_color);
			}else {
				scr_Draw_Text_Outlined(xx+10,yy-4,text,text_color);
				draw_sprite(keyboard_text,0,xx-11,yy-4);
			}
		}else {
			var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
			scr_Draw_Text_Outlined(xx+10,yy-4,text,text_color);
			draw_sprite(mouse_sprite,0,xx-11,yy-4);
		}
	}
}