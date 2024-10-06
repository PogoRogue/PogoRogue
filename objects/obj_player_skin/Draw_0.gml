if skin_num = 4 {
	draw_sprite_ext(spr_jetpack,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);	
}

draw_self();
draw_sprite_ext(face_sprite,0,x+lengthdir_x(skin_yoffset,image_angle-90),y+lengthdir_y(skin_yoffset,image_angle-90),image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//hat offset
if skin_num = 1 {
	text_offset = 3;
}else if skin_num = 2 {
	text_offset = 5;
}else if skin_num = 3 {
	text_offset = 5;
}else if skin_num = 4 {
	text_offset = 2;
}else if skin_num = 5 {
	text_offset = 3;
}else if skin_num = 6 {
	text_offset = 1;
}else {
	text_offset = 1;
}
text_offset -= 2;

if colliding = true and unlocked = true {
	if loadout_yscale = 1 {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
		draw_set_color(make_color_rgb(33,33,35));
		//draw interact button
		if global.use_controller = true {
			scr_Draw_Text_Outlined(x+10,y-(52+14)-text_offset-125+popup_offset,"Swap",make_color_rgb(237,225,158));
			draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[6][0]),0,x-11,y-(56+14)-text_offset-125+popup_offset);
		}else {
			var keyboard_array_value = global.keyboard_array[6][0];
			var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
			if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
				if is_string(keyboard_text) {
					scr_Draw_Text_Outlined(x,y-(52+14)-text_offset-125+popup_offset,string(keyboard_text) + " Swap",make_color_rgb(237,225,158));
				}else {
					scr_Draw_Text_Outlined(x+10,y-(52+14)-text_offset+popup_offset,"Swap",make_color_rgb(237,225,158));
					draw_sprite(keyboard_text,0,x-11,y-(56+14)-text_offset-125+popup_offset);
				}
			}else {
				var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
				scr_Draw_Text_Outlined(x+10,y-(52+14)-text_offset-125+popup_offset,"Swap",make_color_rgb(237,225,158));
				draw_sprite(mouse_sprite,0,x-11,y-(56+14)-text_offset-125+popup_offset);
			}
		}
	}
	draw_sprite_ext(spr_skin_loadouts,skin_num,x,y-80-text_offset+16-60,loadout_yscale,loadout_yscale,0,c_white,1);
}else if unlocked = true and loadout_yscale > 0 {
	draw_sprite_ext(spr_skin_loadouts,skin_num,x,y-80-text_offset+16-60,loadout_yscale,loadout_yscale,0,c_white,1);
}

if skin_num = 6 {
	//hat gun
	if sprite_index = player_sprite {
		draw_sprite_ext(spr_player_zekai_hat,image_index,x, y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = falling_sprite {
		draw_sprite_ext(spr_player_zekai_hat_falling,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}
}	

//names
if unlocked = true {
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_itemdescription2);
	scr_Draw_Text_Outlined(x,y-(55)-text_offset,global.skins_names[skin_num],make_color_rgb(242,240,229));
}

draw_set_color(c_white);