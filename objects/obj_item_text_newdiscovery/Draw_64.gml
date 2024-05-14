draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_itemdescription2);
draw_set_alpha(1);

scr_Draw_Text_Outlined((camera_get_view_width(view_camera[0])/2),80-y_subtract,"New discovery!",make_color_rgb(237,225,158));

draw_set_alpha(1);
draw_set_color(c_white);