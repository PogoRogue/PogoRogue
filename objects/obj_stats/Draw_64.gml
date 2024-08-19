//text
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_combo2);
draw_set_alpha(1); //alpha
scr_Draw_Text_Outlined(384,72,"Stats", c_white);

//background tiles
draw_set_color(c_white);
var y_max = 8;

for (xx = camera_get_view_width(view_camera[0])/2 - 200; xx < camera_get_view_width(view_camera[0])/2 + 200; xx += 16) {
	for (yy = stat_1_y-32; yy < stat_1_y+(y_max*(stat_height*2)+16); yy += 16) {
		if (xx = camera_get_view_width(view_camera[0])/2 - 200) {
			if (yy = stat_1_y-32) {
				var tile_data = 1;
			}else if (yy = stat_1_y+(y_max*(stat_height*2))) {
				var tile_data = 9;
			}else {
				var tile_data = 5;
			}
		}else if (xx = camera_get_view_width(view_camera[0])/2 + 200 - 16) {
			if (yy = stat_1_y-32) {
				var tile_data = 3;
			}else if (yy = stat_1_y+(y_max*(stat_height*2))) {
				var tile_data = 11;
			}else {
				var tile_data = 7;
			}
		}else {
			if (yy = stat_1_y-32) {
				var tile_data = 2;
			}else if (yy = stat_1_y+(y_max*(stat_height*2))) {
				var tile_data = 10;
			}else {
				var tile_data = 6;
			}
		}
		draw_tile(tl_settingsbg,tile_data,0,xx,yy);
	}
}

var color_grey = make_color_rgb(134,129,136);

//draw stats text
for(i = 0; i < array_length(stats_array_runs); i++) {
	var starting_x = camera_get_view_width(view_camera[0])/2-184;
	var starting_y = 119;
	draw_set_font(fnt_combo2);
	
	if i = 0 {
		//header
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_Draw_Text_Outlined(starting_x+84,starting_y-16+(stat_height*i),stats_array_runs[i],c_white);
	}else {
		//left side
		draw_set_halign(fa_left);
		scr_Draw_Text_Outlined(starting_x,starting_y-16+(stat_height*i),stats_array_runs[i][0],color_grey);
	
		//right side
		draw_set_halign(fa_right);
		scr_Draw_Text_Outlined(starting_x+168,starting_y-16+(stat_height*i),stats_array_runs[i][1],c_white);
	}
}

//draw stats text
for(i = 0; i < array_length(stats_array_splits); i++) {
	var starting_x = camera_get_view_width(view_camera[0])/2-184;
	var starting_y = 119 + (array_length(stats_array_runs)+1)*stat_height;
	draw_set_font(fnt_combo2);
	
	if i = 0 {
		//header
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_Draw_Text_Outlined(starting_x+84,starting_y-16+(stat_height*i),stats_array_splits[i],c_white);
	}else {
		//left side
		draw_set_halign(fa_left);
		scr_Draw_Text_Outlined(starting_x,starting_y-16+(stat_height*i),stats_array_splits[i][0],color_grey);
	
		//right side
		draw_set_halign(fa_right);
		scr_Draw_Text_Outlined(starting_x+168,starting_y-16+(stat_height*i),stats_array_splits[i][1],c_white);
	}
}

//draw enemies text
for(i = 0; i < array_length(stats_array_enemies); i++) {
	var starting_x = camera_get_view_width(view_camera[0])/2+184;
	var starting_y = 119;
	draw_set_font(fnt_combo2);
	
	if i = 0 {
		//header
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_Draw_Text_Outlined(starting_x-84,starting_y-16+(stat_height*i),stats_array_enemies[i],c_white);
	}else {
		//left side
		draw_set_halign(fa_left);
		scr_Draw_Text_Outlined(starting_x-168,starting_y-16+(stat_height*i),stats_array_enemies[i][0],color_grey);
	
		//right side
		draw_set_halign(fa_right);
		scr_Draw_Text_Outlined(starting_x,starting_y-16+(stat_height*i),stats_array_enemies[i][1],c_white);
	}
}

//draw coins text
for(i = 0; i < array_length(stats_array_coins); i++) {
	var starting_x = camera_get_view_width(view_camera[0])/2+184;
	var starting_y = 119 + (array_length(stats_array_enemies)+1)*stat_height+16;
	draw_set_font(fnt_combo2);
	
	if i = 0 {
		//header
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_Draw_Text_Outlined(starting_x-84,starting_y-16+(stat_height*i),stats_array_coins[i],c_white);
	}else {
		//left side
		draw_set_halign(fa_left);
		scr_Draw_Text_Outlined(starting_x-168,starting_y-16+(stat_height*i),stats_array_coins[i][0],color_grey);
	
		//right side
		draw_set_halign(fa_right);
		scr_Draw_Text_Outlined(starting_x,starting_y-16+(stat_height*i),stats_array_coins[i][1],c_white);
	}
}

//draw coins text
for(i = 0; i < array_length(stats_array_items); i++) {
	var starting_x = camera_get_view_width(view_camera[0])/2+184;
	var starting_y = 119 + (array_length(stats_array_enemies)+1)*stat_height + (array_length(stats_array_coins)+1)*stat_height+32;
	draw_set_font(fnt_combo2);
	
	if i = 0 {
		//header
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_Draw_Text_Outlined(starting_x-84,starting_y-16+(stat_height*i),stats_array_items[i],c_white);
	}else {
		//left side
		draw_set_halign(fa_left);
		scr_Draw_Text_Outlined(starting_x-168,starting_y-16+(stat_height*i),stats_array_items[i][0],color_grey);
	
		//right side
		draw_set_halign(fa_right);
		scr_Draw_Text_Outlined(starting_x,starting_y-16+(stat_height*i),stats_array_items[i][1],c_white);
	}
}