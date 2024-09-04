draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_item_popup);
draw_set_alpha(1); //alpha


if test_mode = false {
	scr_Draw_Text_Outlined(center_x,center_y-60,"Choose an active item:", c_white); //center_y - 140 //center_y-56
}else {
	scr_Draw_Text_Outlined(center_x,center_y-140-32,"Choose an active item:", c_white); //center_y - 140 //center_y-56	
}


draw_set_font(fnt_itemdescription2);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
	
//item sprites
for (i = 0; i < array_length(actives_array); i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;
	
	if test_mode = false {
		var yy = (center_y+8) + floor(i / select_x_max) * y_gap; //156 + floor //center_y+8+floor
	}else {
		var yy = (156)-32 + floor(i / select_x_max) * y_gap - 16; //156 + floor //center_y+8+floor
	}

	//ACTIVES
	if i < array_length(actives_array) {
		
		draw_sprite(select_sprite,(select = (i+1)) + (2 * (global.active_unlocked_array[i] = true)),xx,yy-27);
		if all_actives[i].is_synergy = true and global.active_unlocked_array[i] = true  {
			draw_sprite(spr_synergy_animation,global.synergy_frame,xx,yy-27);
		}
		draw_sprite(all_actives[i].gui_sprite,(sprite_get_number(all_actives[i].gui_sprite)-1)*(global.active_unlocked_array[i] = false),xx,yy-27);
	
		if (i < array_length(all_actives)) and global.active_unlocked_array[i] = true {
			scr_Draw_Text_Outlined(xx,yy-56,scr_Linebreak(all_actives[i]._name,12,99),all_actives[i].text_color);
		}
	}
}

//buttons
for (i = 0; i < array_length(actives_array); i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;
	if test_mode = false {
		var yy = (center_y+8) + floor(i / select_x_max) * y_gap; //156 + floor //center_y+8+floor
	}else {
		var yy = (156)-32 + floor(i / select_x_max) * y_gap - 16; //156 + floor //center_y+8+floor
	}
	
	if (select = i + 1) and global.active_unlocked_array[i] = true {
		scr_Draw_Input_UI(xx,yy+4,18,0,fnt_combo2,fa_center,fa_middle);
		draw_set_font(fnt_itemdescription2);
	}
}

//descriptions
for (i = 0; i < array_length(all_actives); i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;

	if test_mode = false {
		var yy = 295+32 + floor(i / select_x_max) * y_gap; //226 //295
	}else {
		var yy = 226 + floor(i / select_x_max) * y_gap - 16; //226 //295
	}
	
	if (i = select-1) {
		var x_offset = 154 + (((select_x_max-4)*(-x_gap))/2);
		if select_x <= select_x_max/2 {
			var xx = (center_x-384) + x_offset;
		}else {
			var xx = (center_x+380) - x_offset;
		}
			
		if select_y > 4 {
			var y_offset = -y_gap * (select_y-4);
		}else {
			var y_offset = 0;
		}
			
		scr_Draw_Pickup_Description(xx,yy+y_offset-32,all_actives[i],0,global.active_unlocked_array[i],all_pickups_costs[i]);
	}
}

if test_mode = true {
	scr_Draw_Input_Prompt(center_x,432-16,19,"Back",make_color_rgb(180,82,82));
}else {
	scr_Draw_Input_Prompt(center_x,340+52-146,19,"Back",make_color_rgb(180,82,82));
}