if draw_respawn = false and obj_player.image_yscale = 0 {
	draw_self();
	draw_sprite(spr_strike_ui,shots_left,x,y-52)
	draw_sprite_ext(spr_blink_box_arrows_strike,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,arrows_alpha);

	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_item_popup);
	scr_Draw_Text_Outlined(x,y+46,string(ceil((time_left+6)/60)-1) + "." + string(ceil(time_left/6)%10),c_white);
	
	if shots_left > 0 {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
		if global.use_controller = true {
			draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[button_num][0]),0,x,y-60-22);
		}else {
			var keyboard_array_value = global.keyboard_array[button_num][0];
			var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
			if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
				if is_string(keyboard_text) {
					scr_Draw_Text_Outlined(x,y-56-22,string(keyboard_text),c_white);
				}else {
					draw_sprite(keyboard_text,0,x,y-60-22);
				}
			}else {
				var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
				draw_sprite(mouse_sprite,0,x,y-60-22);
			}
		}
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
		scr_Draw_Text_Outlined(x,y-46-22,"Fire",c_white);
	}
}else if obj_player.image_yscale = 0 {
	draw_sprite_ext(obj_player.white_sprite,obj_player.image_index,obj_player.x+lengthdir_x(22,obj_player.angle+90),obj_player.y+lengthdir_y(22,obj_player.angle+90),new_xscale,new_yscale,obj_player.angle,c_white,1);
}