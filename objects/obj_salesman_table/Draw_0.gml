/// @description draw UI when colliding
draw_self();
if (colliding) and being_used = false {
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo2);
	if all_out = false {
		//draw interact button
		if global.use_controller = true {
			draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[6][0]),0,x,bbox_top+24); //+32
		}else {
			var keyboard_array_value = global.keyboard_array[6][0];
			var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
			if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
				if is_string(keyboard_text) {
					scr_Draw_Text_Outlined(x,bbox_top+24,string(keyboard_text),c_white);
				}else {
					draw_sprite(keyboard_text,0,x,bbox_top+24);
				}
			}else {
				var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
				draw_sprite(mouse_sprite,0,x,bbox_top+24);
			}
		}
		image_index = 1;
		scr_Draw_Text_Outlined(x,bbox_top+40,"Shop",c_white);
	}
}else {
	image_index = 0;
	if being_used = true {
		//draw back button
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
		if global.use_controller = true {
			draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[19][0]),0,x,bbox_top+24);
		}else {
			var keyboard_array_value = global.keyboard_array[19][0];
			var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
			if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
				if is_string(keyboard_text) {
					scr_Draw_Text_Outlined(x,bbox_top+24,string(keyboard_text),c_white);
				}else {
					draw_sprite(keyboard_text,0,x,bbox_top+24);
				}
			}else {
				var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
				draw_sprite(mouse_sprite,0,x,bbox_top+24);
			}
		}
		draw_set_font(fnt_combo2);
		scr_Draw_Text_Outlined(x,bbox_top+40,"Exit",c_white);
		//draw passive outlines
		for (i = 0; i < array_length(passives_array); i++) {
			if instance_exists(passives_array[buff_selected]) {
				draw_set_color(c_white);
				if passives_array[buff_selected].follow_player = false {
					draw_sprite_ext(passives_array[buff_selected].sprite_index,sprite_get_number(passives_array[buff_selected].sprite_index)-1,passives_array_x[buff_selected],y-35,1,1,0,c_white,1);
					draw_sprite_ext(passives_array[buff_selected].sprite_index,sprite_get_number(passives_array[buff_selected].sprite_index)-1,passives_array_x[buff_selected]-1,y-36,1,1,0,c_white,1);
					draw_sprite_ext(passives_array[buff_selected].sprite_index,sprite_get_number(passives_array[buff_selected].sprite_index)-1,passives_array_x[buff_selected]-1,y-35,1,1,0,c_white,1);
					draw_sprite_ext(passives_array[buff_selected].sprite_index,sprite_get_number(passives_array[buff_selected].sprite_index)-1,passives_array_x[buff_selected]-1,y-34,1,1,0,c_white,1);
					draw_sprite_ext(passives_array[buff_selected].sprite_index,sprite_get_number(passives_array[buff_selected].sprite_index)-1,passives_array_x[buff_selected]+1,y-36,1,1,0,c_white,1);
					draw_sprite_ext(passives_array[buff_selected].sprite_index,sprite_get_number(passives_array[buff_selected].sprite_index)-1,passives_array_x[buff_selected]+1,y-35,1,1,0,c_white,1);
					draw_sprite_ext(passives_array[buff_selected].sprite_index,sprite_get_number(passives_array[buff_selected].sprite_index)-1,passives_array_x[buff_selected]+1,y-34,1,1,0,c_white,1);
					draw_sprite_ext(passives_array[buff_selected].sprite_index,sprite_get_number(passives_array[buff_selected].sprite_index)-1,passives_array_x[buff_selected],y-34,1,1,0,c_white,1);
					draw_sprite_ext(passives_array[buff_selected].sprite_index,sprite_get_number(passives_array[buff_selected].sprite_index)-1,passives_array_x[buff_selected],y-36,1,1,0,c_white,1);
				
					if global.num_of_coins >= passives_array[buff_selected].item_cost and passives_array[buff_selected].sold_out = false {
						//draw select button
						draw_set_font(fnt_itemdescription2);
						draw_set_halign(fa_center);
						if global.use_controller = true {
							draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[18][0]),2,passives_array_x[buff_selected],y-18);
						}else {
							var keyboard_array_value = global.keyboard_array[18][0];
							var keyboard_text = scr_Keyboard_Get_Key_String(keyboard_array_value);
			
							if !scr_In_Array(global.mouse_button_array,keyboard_array_value) {
								if is_string(keyboard_text) {
									scr_Draw_Text_Outlined(passives_array_x[buff_selected],y-18,string(keyboard_text),c_white);
								}else {
									draw_sprite(keyboard_text,0,passives_array_x[buff_selected],y-18);
								}
							}else {
								var mouse_sprite = scr_Mouse_Get_Button_Sprite(keyboard_array_value);
								draw_sprite(mouse_sprite,0,passives_array_x[buff_selected],y-18);
							}
						}
					}
				}
			}
		}
	}
}

if usable = true {
	with passives_array[0] {
		if sold_out = true and !follow_player or item_cost > global.num_of_coins and !follow_player {
			image_alpha = 0;
			draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,1);
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,0.75);		
		}
	}
	with passives_array[1] {
		if sold_out = true and !follow_player or item_cost > global.num_of_coins and !follow_player {
			image_alpha = 0;
			draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,1);
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,0.75);		
		}
	}
	//draw 3rd item number
	with passives_array[2] {
		//don't oversell item quantity
		while other.buff_3_number > max_uses and max_uses != 0 {
			other.buff_3_number -= 1;
		}
		image_alpha = 0;
		if sprite_get_number(sprite_index) = 3 {
			draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,1);
		}else {
			index_add = (other.buff_3_number * 2)-2;
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,1);
		}
		
		if sold_out = true and !follow_player or item_cost > global.num_of_coins and !follow_player {
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,0.75);		
		}
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
		if other.buff_3_number > 1 {
			scr_Draw_Text_Outlined(x-6,y+4,"x" + string(other.buff_3_number),c_white);
		}
	}
}