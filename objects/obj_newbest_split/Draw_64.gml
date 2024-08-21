/// @description draw choice
var yy = y;
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_combo2);
draw_set_alpha(1); //alpha

split_time = global.new_best_split;

scr_Draw_Text_Outlined(x,y-72,"New Best Split!",make_color_rgb(138,176,96));
scr_Draw_Text_Outlined(x,y+12-72,scr_Convert_Frames_To_Time(global.new_best_split),c_white);	