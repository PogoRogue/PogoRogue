display_set_gui_size(768,432);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(global.uranus);//
if obj_player.dead = false and global.draw_ui and obj_player.table = false and obj_player.state != obj_player.state_pogosmith {
	scr_Draw_Text_Outlined(384,108,"大门已打开",make_color_rgb(138,176,96));
}