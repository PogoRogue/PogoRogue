draw_set_halign(fa_center);
draw_set_valign(fa_top);

var y_offset2 = 0;

for (i = 0; i < array_length(credits_text_array); i++) {
	for (j = 0; j <= 1; j++) {
		if j = 0 {
			draw_set_font(fnt_item_popup);
			y_offset2 += string_separation;
		}else {
			draw_set_font(fnt_combo2);
		}
		scr_Draw_Text_Outlined(384,yy+y_offset2,credits_text_array[i][j],c_white);
		y_offset2 += string_height(credits_text_array[i][j]);
	}
}

draw_set_color(c_white);