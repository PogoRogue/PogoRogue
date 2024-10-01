draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_item_popup);
draw_set_alpha(1);

display_set_gui_size(768,432);

var str_width = string_width("Now Entering:\n" + entering_string);
var added_width = 0;

if draw = true {
	scr_Draw_Text_Outlined((768/2),64-y_subtract,"Now Entering:\n" + entering_string,c_white);
}

draw_set_alpha(1);
draw_set_color(c_white);