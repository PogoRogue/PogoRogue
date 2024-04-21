//text
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_item_popup);
draw_set_alpha(1); //alpha
scr_Draw_Text_Outlined(384,72,"Stats:", c_white);

//background tiles
draw_set_color(c_white);
var y_max = 8;

for (xx = camera_get_view_width(view_camera[0])/2 - 128; xx < camera_get_view_width(view_camera[0])/2 + 128; xx += 16) {
	for (yy = stat_1_y-32; yy < stat_1_y+(y_max*stat_height); yy += 16) {
		if (xx = camera_get_view_width(view_camera[0])/2 - 128) {
			if (yy = stat_1_y-32) {
				var tile_data = 1;
			}else if (yy = stat_1_y+(y_max*stat_height)-16) {
				var tile_data = 9;
			}else {
				var tile_data = 5;
			}
		}else if (xx = camera_get_view_width(view_camera[0])/2 + 128 - 16) {
			if (yy = stat_1_y-32) {
				var tile_data = 3;
			}else if (yy = stat_1_y+(y_max*stat_height)-16) {
				var tile_data = 11;
			}else {
				var tile_data = 7;
			}
		}else {
			if (yy = stat_1_y-32) {
				var tile_data = 2;
			}else if (yy = stat_1_y+(y_max*stat_height)-16) {
				var tile_data = 10;
			}else {
				var tile_data = 6;
			}
		}
		draw_tile(tl_settingsbg,tile_data,0,xx,yy);
	}
}

//draw stats text
for(i = 0; i < array_length(stats_array); i++) {
	var color = c_white;
		
	//left side
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo2);
	draw_text(camera_get_view_width(view_camera[0])/2-112,stat_1_y-16+(stat_height*i),stats_array[i][0]);
	
	//right side
	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo2);
	draw_text(camera_get_view_width(view_camera[0])/2+112,stat_1_y-16+(stat_height*i),stats_array[i][1]);
}