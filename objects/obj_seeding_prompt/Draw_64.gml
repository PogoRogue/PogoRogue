draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_item_popup);
draw_set_alpha(1); //alpha
scr_Draw_Text_Outlined(center_x,center_y-26,"Enter a seed:", c_white);

draw_sprite(spr_button_prompt,0,center_x,center_y-10);

if select_y = 1 {
	draw_set_valign(fa_center);
	scr_Draw_Text_Outlined(center_x,center_y-7,seed_string, c_white);
	if submitted = false and canceled = false {
		draw_sprite(spr_prompt_blinker,blinker_index,center_x+string_width(seed_string)/2 + 2,center_y-7);
	}	
	draw_sprite(spr_button_submit,submitted,center_x-48,center_y+28);
	draw_sprite(spr_button_cancel,canceled,center_x+48,center_y+28);
}else {
	draw_sprite(spr_button_submit,select_x = 1,center_x-48,center_y+28);
	draw_sprite(spr_button_cancel,select_x = 2,center_x+48,center_y+28);
}
	

//buttons
scr_Draw_Input_UI(center_x-48,center_y+50,18,0,fnt_combo2,fa_center,fa_middle);
scr_Draw_Input_UI(center_x+48,center_y+50,19,0,fnt_combo2,fa_center,fa_middle);