center_x = camera_get_view_width(view_camera[0])/2;

//draw UI
if select_y = 0 {
	draw_sprite(spr_settingsmenu_sound,select = 1,center_x-144,72);
	draw_sprite(spr_settingsmenu_video,select = 2,center_x-48,72);
	draw_sprite(spr_settingsmenu_gameplay,select = 3,center_x+48,72);
	draw_sprite(spr_settingsmenu_bindings,select = 4,center_x+144,72);
}else {
	draw_sprite(spr_settingsmenu_sound,(select = 1)*2,center_x-144,72);
	draw_sprite(spr_settingsmenu_video,(select = 2)*2,center_x-48,72);
	draw_sprite(spr_settingsmenu_gameplay,(select = 3)*2,center_x+48,72);
	draw_sprite(spr_settingsmenu_bindings,(select = 4)*2,center_x+144,72);
}

//background tiles
draw_set_color(c_white);
var temp_select_y_max = select_y_max;
if temp_select_y_max > 8 {
	temp_select_y_max = 8;
}
for (xx = camera_get_view_width(view_camera[0])/2 - 128; xx < camera_get_view_width(view_camera[0])/2 + 128; xx += 16) {
	for (yy = option_1_y-32; yy < option_1_y+(temp_select_y_max*item_height); yy += 16) {
		if (xx = camera_get_view_width(view_camera[0])/2 - 128) {
			if (yy = option_1_y-32) {
				var tile_data = 1;
			}else if (yy = option_1_y+(temp_select_y_max*item_height)-16) {
				var tile_data = 9;
			}else {
				var tile_data = 5;
			}
		}else if (xx = camera_get_view_width(view_camera[0])/2 + 128 - 16) {
			if (yy = option_1_y-32) {
				var tile_data = 3;
			}else if (yy = option_1_y+(temp_select_y_max*item_height)-16) {
				var tile_data = 11;
			}else {
				var tile_data = 7;
			}
		}else {
			if (yy = option_1_y-32) {
				var tile_data = 2;
			}else if (yy = option_1_y+(temp_select_y_max*item_height)-16) {
				var tile_data = 10;
			}else {
				var tile_data = 6;
			}
		}
		draw_tile(tl_settingsbg,tile_data,0,xx,yy);
	}
}

//draw settings options here
if select = 1 { //audio
	for(i = 0; i < menu_audio.num_of_options; i++) {
		var color = c_white;
		if i = select_y-1 {
			draw_set_color(make_color_rgb(211,160,104));
			color = make_color_rgb(211,160,104);
		}else {
			draw_set_color(make_color_rgb(242,240,229));
			color = make_color_rgb(242,240,229);
		}
		
		//text
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_set_font(fnt_combo2);
		scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])/2-104,option_1_y+(item_height*i),menu_audio.options_array[i]._text,color);
		
		draw_set_halign(fa_center);
		if (menu_audio.options_array[i]._type = "slider") {
			var slider_range = menu_audio.options_array[i].highest_value - menu_audio.options_array[i].lowest_value;
			var slider_x = ((menu_audio.options_array[i].highest_value - menu_audio.options_array[i].current_value) / slider_range) * sprite_get_width(spr_slider_bar_settings);
			draw_sprite(spr_slider_bar_settings,(i = select_y-1),camera_get_view_width(view_camera[0])/2+104,option_1_y+(item_height*i));
			draw_sprite(spr_slider_button_settings,(i = select_y-1),camera_get_view_width(view_camera[0])/2+104-slider_x,option_1_y+(item_height*i));
			scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])/2+104-slider_x,option_1_y+(item_height*i)-14,string(menu_audio.options_array[i].current_value) + menu_audio.options_array[i].add_to_string,color);
			
			if (i = select_y-1) {
				draw_sprite(spr_slider_button_outline,(i = select_y-1),camera_get_view_width(view_camera[0])/2+104-slider_x,option_1_y+(item_height*i));	
			}
		}
	}
}

if select = 2 { //video
	for(i = 0; i < menu_video.num_of_options; i++) {
		var color = c_white;
		if i = select_y-1 {
			draw_set_color(make_color_rgb(211,160,104));
			color = make_color_rgb(211,160,104);
		}else {
			draw_set_color(make_color_rgb(242,240,229));
			color = make_color_rgb(242,240,229);
		}
		
		//text
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_set_font(fnt_combo2);
		scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])/2-104,option_1_y+(item_height*i),menu_video.options_array[i]._text,color);
		
		draw_set_halign(fa_right);
		if menu_video.options_array[i]._type = "checkbox" {
			draw_sprite(spr_checkbox,(menu_video.options_array[i].current_mode)+((i = select_y-1) * 2),camera_get_view_width(view_camera[0])/2+104,option_1_y+(item_height*i));
		}
		if menu_video.options_array[i]._type = "list_slider" {
			scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])/2+104,option_1_y+(item_height*i),list_slider_str,color);
			draw_sprite_ext(spr_settings_leftarrow,!(menu_video.options_array[i].current_selection > 0),camera_get_view_width(view_camera[0])/2+104-string_width(list_slider_str)-4,option_1_y+(item_height*i),1,1,0,color,1);
			draw_sprite_ext(spr_settings_rightarrow,!(menu_video.options_array[i].current_selection < menu_video.options_array[i].num_of_values-1),camera_get_view_width(view_camera[0])/2+104+4,option_1_y+(item_height*i),1,1,0,color,1);
		}
	}
}

if select = 3 { //gameplay
	for(i = 0; i < menu_gameplay.num_of_options; i++) {
		var color = c_white;
		if i = select_y-1 {
			draw_set_color(make_color_rgb(211,160,104));
			color = make_color_rgb(211,160,104);
		}else {
			draw_set_color(make_color_rgb(242,240,229));
			color = make_color_rgb(242,240,229);
		}
		
		//text
		
		draw_set_valign(fa_center);
		draw_set_font(fnt_combo2);
		if menu_gameplay.options_array[i]._type != "doonpress" {
			draw_set_halign(fa_left);
			scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])/2-104,option_1_y+(item_height*i),menu_gameplay.options_array[i]._text,color);
		}else {
			draw_set_halign(fa_center);
			if i = menu_gameplay.num_of_options-1 {
				scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])/2,option_1_y+(item_height*i)-16-4,menu_gameplay.options_array[i]._text,color);
			}else if i = menu_gameplay.num_of_options-2 {
				scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])/2,option_1_y+(item_height*i)-4,menu_gameplay.options_array[i]._text,color);
			}else {
				scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])/2,option_1_y+(item_height*i),menu_gameplay.options_array[i]._text,color);
			}
		}
		
		
		draw_set_halign(fa_center);
		if (menu_gameplay.options_array[i]._type = "slider") {
			var slider_range = menu_gameplay.options_array[i].highest_value - menu_gameplay.options_array[i].lowest_value;
			var slider_x = ((menu_gameplay.options_array[i].highest_value - menu_gameplay.options_array[i].current_value) / slider_range) * sprite_get_width(spr_slider_bar_settings);
			draw_sprite(spr_slider_bar_settings,(i = select_y-1),camera_get_view_width(view_camera[0])/2+104,option_1_y+(item_height*i));
			draw_sprite(spr_slider_button_settings,(i = select_y-1),camera_get_view_width(view_camera[0])/2+104-slider_x,option_1_y+(item_height*i));
			scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])/2+104-slider_x,option_1_y+(item_height*i)-14,string(menu_gameplay.options_array[i].current_value) + menu_gameplay.options_array[i].add_to_string,color);
			
			if (i = select_y-1) {
				draw_sprite(spr_slider_button_outline,(i = select_y-1),camera_get_view_width(view_camera[0])/2+104-slider_x,option_1_y+(item_height*i));	
			}
		}
		
		draw_set_halign(fa_right);
		if menu_gameplay.options_array[i]._type = "checkbox" {
			draw_sprite(spr_checkbox,(menu_gameplay.options_array[i].current_mode)+((i = select_y-1) * 2),camera_get_view_width(view_camera[0])/2+104,option_1_y+(item_height*i));
		}
	}
}

if select = 4 { //bindings
	for(i = 0; i < menu_bindings.num_of_options; i++) {
		var color = c_white;
		if i = select_y-1 {
			draw_set_color(make_color_rgb(211,160,104));
			color = make_color_rgb(211,160,104);
		}else {
			draw_set_color(make_color_rgb(242,240,229));
			color = make_color_rgb(242,240,229);
		}
		
		//arrows
		if (select_y_added < menu_bindings.num_of_options-8) {
			//down arrow
			draw_sprite(spr_settings_downarrow,0,camera_get_view_width(view_camera[0])/2,option_1_y+(item_height*8)-20);
		}else {
			//down arrow
			draw_sprite(spr_settings_downarrow,1,camera_get_view_width(view_camera[0])/2,option_1_y+(item_height*8)-20);
		}
		if (select_y_added > 0) {
			//up arrow
			draw_sprite(spr_settings_uparrow,0,camera_get_view_width(view_camera[0])/2,option_1_y-12);
		}
		
		//text
		draw_set_valign(fa_center);
		draw_set_font(fnt_combo2);
		if menu_bindings.options_array[i]._type = "doonpress" {
			if (i - select_y_added >= 0 and i - select_y_added < 8) {
				if (i = 0) {
					draw_set_halign(fa_center);
					scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])/2,option_1_y+(item_height*i)-(select_y_added*item_height),menu_bindings.options_array[i]._text,color);	
				}else {
					draw_set_halign(fa_left);
					scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])/2-104,option_1_y+(item_height*i)-(select_y_added*item_height),menu_bindings.options_array[i]._text,color);
				}

				//icon sprites
				if global.use_controller = true and i != 0 {
					var subtract_rectangle_length = 32*(select_y_added = 0);
					var white = make_color_rgb(242,240,229);
					draw_rectangle_color(camera_get_view_width(view_camera[0])/2+79,option_1_y-8+subtract_rectangle_length,camera_get_view_width(view_camera[0])/2+80,option_1_y+(item_height*7)+8,white,white,white,white,false);
					draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[i-1][0]),(i = select_y-1 and bindings_x = 1),camera_get_view_width(view_camera[0])/2+62,option_1_y+(item_height*i)-(select_y_added*item_height));
					draw_sprite(scr_Gamepad_Get_Button_Sprite(global.gamepad_array[i-1][1]),(i = select_y-1 and bindings_x = 2),camera_get_view_width(view_camera[0])/2+98,option_1_y+(item_height*i)-(select_y_added*item_height));
				}
				
				if (i = 15) {
					//draw line separating gameplay buttons from menu buttons
					draw_rectangle_color(camera_get_view_width(view_camera[0])/2-104,option_1_y+(item_height*i)-(select_y_added*item_height)-16,camera_get_view_width(view_camera[0])/2+104,option_1_y+(item_height*i)-(select_y_added*item_height)-15,white,white,white,white,false);	
				}
				
				if global.use_controller = false and i != 0 {
					var subtract_rectangle_length = 32*(select_y_added = 0);
					var white = make_color_rgb(242,240,229);
					draw_rectangle_color(camera_get_view_width(view_camera[0])/2+79,option_1_y-8+subtract_rectangle_length,camera_get_view_width(view_camera[0])/2+80,option_1_y+(item_height*7)+8,white,white,white,white,false);
					
					var binding1_x = camera_get_view_width(view_camera[0])/2+70;
					var binding2_x = camera_get_view_width(view_camera[0])/2+90;
					var binding_y = option_1_y+(item_height*i)-(select_y_added*item_height);
					//binding 1
					if !scr_In_Array(global.mouse_button_array,global.keyboard_array[i-1][0]) {
						if scr_In_Array(global.keyboard_sprites_array,global.keyboard_array[i-1][0]) {		
							//sprite
							var sprite = scr_Keyboard_Get_Key_String(global.keyboard_array[i-1][0]);
							draw_sprite(sprite,(i = select_y-1 and bindings_x = 1),binding1_x-sprite_get_width(sprite)/2,binding_y);
						}else {
							//color 
							if (i = select_y-1 and bindings_x = 1) {
								draw_set_color(make_color_rgb(211,160,104));
								color = make_color_rgb(211,160,104);
							}else {
								draw_set_color(make_color_rgb(242,240,229));
								color = make_color_rgb(242,240,229);
							}
							//text
							draw_set_font(fnt_combo2);
							draw_set_halign(fa_right);
							draw_set_valign(fa_center);
							scr_Draw_Text_Outlined(binding1_x,binding_y,scr_Keyboard_Get_Key_String(global.keyboard_array[i-1][0]),color);
							draw_set_color(c_white);
						}
					}else {
						var sprite = scr_Mouse_Get_Button_Sprite(global.keyboard_array[i-1][0]);
						draw_sprite(sprite,(i = select_y-1 and bindings_x = 1),binding1_x-sprite_get_width(sprite)/2,binding_y);	
					}
					//binding 2
					if !scr_In_Array(global.mouse_button_array,global.keyboard_array[i-1][1]) {
						if scr_In_Array(global.keyboard_sprites_array,global.keyboard_array[i-1][1]) {		
							//sprite
							var sprite = scr_Keyboard_Get_Key_String(global.keyboard_array[i-1][1]);
							draw_sprite(sprite,(i = select_y-1 and bindings_x = 2),binding2_x+sprite_get_width(sprite)/2,binding_y);
						}else {
							//color 
							if (i = select_y-1 and bindings_x = 2) {
								draw_set_color(make_color_rgb(211,160,104));
								color = make_color_rgb(211,160,104);
							}else {
								draw_set_color(make_color_rgb(242,240,229));
								color = make_color_rgb(242,240,229);
							}
							//text
							draw_set_font(fnt_combo2);
							draw_set_halign(fa_left);
							draw_set_valign(fa_center);
							scr_Draw_Text_Outlined(binding2_x,binding_y,scr_Keyboard_Get_Key_String(global.keyboard_array[i-1][1]),color);
							draw_set_color(c_white);
						}
					}else {
						var sprite = scr_Mouse_Get_Button_Sprite(global.keyboard_array[i-1][1]);
						draw_sprite(sprite,(i = select_y-1 and bindings_x = 2),binding2_x+sprite_get_width(sprite)/2,binding_y);	
					}
				}
			}
		}
	}
}

draw_set_color(c_white);