draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_item_popup);
draw_set_alpha(1); //alpha

if controller = true {
	var seed_string_y = -26-16;
	var button_prompt_y = -10-16;
	var seed_input_y = -7-16;
	var button_submit_y = 28+17;
}else {
	var seed_string_y = -26;
	var button_prompt_y = -10;
	var seed_input_y = -7;
	var button_submit_y = 28;
}

scr_Draw_Text_Outlined(center_x,center_y+seed_string_y,"Enter a seed:", c_white);

draw_sprite(spr_button_prompt,0,center_x,center_y+button_prompt_y);

draw_set_valign(fa_center);
scr_Draw_Text_Outlined(center_x,center_y+seed_input_y,seed_string, c_white);

if submitted = false and canceled = false {
	draw_sprite(spr_prompt_blinker,blinker_index,center_x+string_width(seed_string)/2 + 2,center_y+seed_input_y);
}

if controller = false {
	draw_sprite(spr_button_submit,submitted,center_x-48,center_y+button_submit_y);
	draw_sprite(spr_button_cancel,canceled,center_x+48,center_y+button_submit_y);
}else {
	draw_sprite(spr_button_submit,select_x2 = 1 and select_y = 2,center_x-48,center_y+button_submit_y);
	draw_sprite(spr_button_cancel,select_x2 = 2 and select_y = 2,center_x+48,center_y+button_submit_y);
}
	
//buttons
if controller = false {
	scr_Draw_Input_UI(center_x-48,center_y+50,18,0,fnt_combo2,fa_center,fa_middle);
	scr_Draw_Input_UI(center_x+48,center_y+50,19,0,fnt_combo2,fa_center,fa_middle);
}else {
	//numbers
	for (i = 0; i < 11; i++) {
		draw_sprite(spr_button_number,i,center_x + ((i-5)*40),center_y+12);	
		if select_y = 1 and i = select_x {
			draw_sprite(spr_button_number_selected,i,center_x + ((i-5)*40),center_y+12);	
		}
	}
}