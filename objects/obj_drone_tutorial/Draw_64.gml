display_set_gui_size(768,432);
draw_set_font(fnt_combo2);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
if !(obj_player.table = true and room = room_tutorial) {
	if global.use_controller = true {
		draw_sprite(spr_button_l,0,768-96+8,432-24);
		scr_Draw_Text_Outlined(768-96+12+8,432-24,"Lock Camera",c_white);
	}else if global.use_keyboard = true {
		scr_Draw_Text_Outlined(768-102+8,432-24,"(Z) Lock Camera",c_white);
	}
}