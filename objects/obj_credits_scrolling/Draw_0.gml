draw_set_font(fnt_combo2);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var y_offset2 = 0;

for (i = 0; i < array_length(credits_text_array); i++) {
	y_offset2 += string_separation;
	scr_Draw_Text_Outlined(384,yy+y_offset2,credits_text_array[i],c_white);
	y_offset2 += string_height(credits_text_array[i]);
}

draw_set_color(c_white);