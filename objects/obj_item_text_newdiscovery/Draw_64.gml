draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_itemdescription2);
draw_set_alpha(1);

display_set_gui_size(768,432);

scr_Draw_Text_Outlined((768/2),80-y_subtract,"New discovery!",make_color_rgb(237,225,158));

draw_set_alpha(1);
draw_set_color(c_white);