draw_self();
draw_sprite_ext(face_sprite,0,x+lengthdir_x(skin_yoffset,image_angle-90),y+lengthdir_y(skin_yoffset,image_angle-90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);

if colliding = true {
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_itemdescription2);
	draw_set_color(make_color_rgb(33,33,35));
	//draw interact button
	if global.use_controller = true {
		scr_Draw_Text_Outlined(x+11,y-(55)-text_offset,"Swap",make_color_rgb(242,240,229));
		draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[6][0]),0,x-11,y-(56)-text_offset);
	}else {
		var keyboard_array_value = global.keyboard_array[6][0];
		var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
		if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
			if is_string(keyboard_text) {
				scr_Draw_Text_Outlined(x,y-(52)-text_offset,string(keyboard_text) + " Swap",c_white);
			}else {
				scr_Draw_Text_Outlined(x+11,y-(55)-text_offset,"Swap",make_color_rgb(242,240,229));
				draw_sprite(keyboard_text,0,x-11,y-(56)-text_offset);
			}
		}else {
			var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
			scr_Draw_Text_Outlined(x+11,y-(55)-text_offset,"Swap",make_color_rgb(242,240,229));
			draw_sprite(mouse_sprite,0,x-11,y-(56)-text_offset);
		}
	}
}

draw_set_color(c_white);