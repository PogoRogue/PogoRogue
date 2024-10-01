draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_item_popup);
draw_set_alpha(1); //alpha

if controller = true {
	var code_string_y = -26-16;
	var button_prompt_y = -10-16;
	var code_input_y = -7-16;
	var button_submit_y = 28+17;
}else {
	var code_string_y = -26;
	var button_prompt_y = -10;
	var code_input_y = -7;
	var button_submit_y = 28;
}


var y_offset = 42;


if controller = false {
	y_offset = 18;
}

scr_Draw_Text_Outlined(center_x,center_y+code_string_y-y_offset,"Enter a seed:", c_white);

draw_sprite(spr_button_prompt,0,center_x,center_y+button_prompt_y-y_offset);

draw_set_valign(fa_center);
scr_Draw_Text_Outlined(center_x,center_y+code_input_y-y_offset,code_string, c_white);

if submitted = false and canceled = false {
	draw_sprite(spr_prompt_blinker,blinker_index,center_x+string_width(code_string)/2 + 2,center_y+code_input_y-y_offset);
}

if controller = false {
	draw_sprite(spr_button_submit,submitted,center_x-48,center_y+button_submit_y-16);
	draw_sprite(spr_button_cancel,canceled,center_x+48,center_y+button_submit_y-16);
}else {
	if select_y_max = 5 {
		draw_sprite(spr_button_submit,select_x2 = 1 and select_y = select_y_max,center_x-48,center_y+button_submit_y+(40*floor(12/3))-y_offset);
		draw_sprite(spr_button_cancel,select_x2 = 2 and select_y = select_y_max,center_x+48,center_y+button_submit_y+(40*floor(12/3))-y_offset);
	}
}
	
//buttons
if controller = false {
	scr_Draw_Input_UI(center_x-48,center_y+50-16,18,0,fnt_combo2,fa_center,fa_middle);
	scr_Draw_Input_UI(center_x+48,center_y+50-16,19,0,fnt_combo2,fa_center,fa_middle);
}else {
	//numbers
	for (i = 0; i < 12; i++) {
		if i < 9 {
			draw_sprite(spr_button_number,i,center_x + (((i%3)-1)*40),center_y+12+(40*floor(i/3))-y_offset);	
		}else {
			if i = 9 {
				draw_sprite(spr_button_number,11,center_x + (((i%3)-1)*40),center_y+12+(40*floor(i/3))-y_offset);	
			}else if i = 10 {
				draw_sprite(spr_button_number,9,center_x + (((i%3)-1)*40),center_y+12+(40*floor(i/3))-y_offset);	
			}else if i = 11 {
				draw_sprite(spr_button_number,10,center_x + (((i%3)-1)*40),center_y+12+(40*floor(i/3))-y_offset);	
			}
		}
		if select_y != select_y_max and i = select {
			draw_sprite(spr_button_number_selected,i,center_x + (((i%3)-1)*40),center_y+12+(40*floor(i/3))-y_offset);	
		}else if select_y = select_y_max and i = select {
			if select = 9 {
				draw_sprite(spr_button_number_selected,11,center_x + (((i%3)-1)*40),center_y+12+(40*floor(i/3))-y_offset);	
			}else if select = 10 {
				draw_sprite(spr_button_number_selected,9,center_x + (((i%3)-1)*40),center_y+12+(40*floor(i/3))-y_offset);	
			}else if select = 11 {
				draw_sprite(spr_button_number_selected,10,center_x + (((i%3)-1)*40),center_y+12+(40*floor(i/3))-y_offset);	
			}
		}
	}
	scr_Draw_Input_Prompt(center_x,340,19,"Back",make_color_rgb(180,82,82));
}