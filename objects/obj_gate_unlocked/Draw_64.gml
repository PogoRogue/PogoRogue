draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_item_popup);
if obj_player.dead = false and global.draw_ui {
	scr_Draw_Text_Outlined(384,96,"Gate Opened",make_color_rgb(138,176,96));
}