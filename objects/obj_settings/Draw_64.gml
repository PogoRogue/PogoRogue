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

//draw settings options here
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
		draw_text(camera_get_view_width(view_camera[0])/2-96,option_1_y+(item_height*i),menu_video.options_array[i]._text);
		
		draw_set_halign(fa_right);
		if menu_video.options_array[i]._type = "checkbox" {
			draw_sprite(spr_checkbox,(menu_video.options_array[i].current_mode)+((i = select_y-1) * 2),camera_get_view_width(view_camera[0])/2+96,option_1_y+(item_height*i));
		}
		if menu_video.options_array[i]._type = "list_slider" {
			draw_text(camera_get_view_width(view_camera[0])/2+96,option_1_y+(item_height*i),list_slider_str);
			draw_sprite_ext(spr_settings_leftarrow,!(menu_video.options_array[i].current_selection > 0),camera_get_view_width(view_camera[0])/2+96-string_width(list_slider_str)-4,option_1_y+(item_height*i),1,1,0,color,1);
			draw_sprite_ext(spr_settings_rightarrow,!(menu_video.options_array[i].current_selection < menu_video.options_array[i].num_of_values-1),camera_get_view_width(view_camera[0])/2+96+4,option_1_y+(item_height*i),1,1,0,color,1);
		}
	}
}

draw_set_color(c_white);