draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_item_popup);
draw_set_alpha(1);

draw_set_halign(fa_left);
var str_width = string_width(item_string);
var added_width = 0;

if draw = true {
	for (i= 0; i < string_length(item_string); i++) {
		scr_Draw_Text_Outlined((camera_get_view_width(view_camera[0])/2)-(str_width/2)+added_width,64-((3/(abs(current_effect_char-i)*2))*(abs(current_effect_char-i) <= 3))-y_subtract,string_array[i],c_white);
		added_width += string_width(string_array[i]);
	}
	if new_discovery = true {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
		draw_set_alpha(1);

		scr_Draw_Text_Outlined((camera_get_view_width(view_camera[0])/2),80-y_subtract,"New discovery!",make_color_rgb(237,225,158));

		draw_set_alpha(1);
		draw_set_color(c_white);	
	}
}

draw_set_alpha(1);
draw_set_color(c_white);