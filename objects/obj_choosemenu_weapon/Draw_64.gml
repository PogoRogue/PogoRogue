draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_item_popup);
draw_set_alpha(1); //alpha
if test_mode = false {
	scr_Draw_Text_Outlined(center_x,center_y-56,"Choose a weapon:", c_white); //center_y - 140 //center_y-56
}else {
	scr_Draw_Text_Outlined(center_x,center_y-140+16,"Choose a weapon:", c_white); //center_y - 140 //center_y-56	
}


draw_set_font(fnt_itemdescription2);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
	
//item sprites
for (i = 0; i < array_length(weapons_array); i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;
	if test_mode = false {
		var yy = (center_y+8) + floor(i / select_x_max) * y_gap; //156 + floor //center_y+8+floor
	}else {
		var yy = (156) + floor(i / select_x_max) * y_gap; //156 + floor //center_y+8+floor
	}

	//WEAPONS
	if i < array_length(weapons_array) {
		
		draw_sprite(select_sprite,(select = (i+1)) + (2 * (global.weapon_unlocked_array[i] = true or test_mode = false)),xx,yy-27);
		draw_sprite(all_weapons[i].sprite,(sprite_get_number(all_weapons[i].sprite)-1)*(global.weapon_unlocked_array[i] = false and test_mode = true),xx,yy-27);
	
		if (i < array_length(all_weapons)) and (global.weapon_unlocked_array[i] = true or test_mode = false) {
			scr_Draw_Text_Outlined(xx,yy-56,scr_Linebreak(all_weapons[i]._name,12,99),c_white);
		}
	}
}

//buttons
for (i = 0; i < array_length(weapons_array); i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;
	if test_mode = false {
		var yy = (center_y+8) + floor(i / select_x_max) * y_gap; //156 + floor //center_y+8+floor
	}else {
		var yy = (156) + floor(i / select_x_max) * y_gap; //156 + floor //center_y+8+floor
	}
	
	if global.weapon_unlocked_array[i] = true or test_mode = false {
		if (select = i + 1) {
			scr_Draw_Input_UI(xx,yy+4,18,0,fnt_combo2,fa_center,fa_middle);
			draw_set_font(fnt_itemdescription2);
		}
	}
}

//descriptions
for (i = 0; i < array_length(all_weapons); i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;
	if test_mode = false {
		var yy = 295 + floor(i / select_x_max) * y_gap; //226 //295
	}else {
		var yy = 226 + floor(i / select_x_max) * y_gap; //226 //295
	}
	if (i = select-1) {
		var x_offset = 154 + (((select_x_max-4)*(-x_gap))/2);
		if select_x <= select_x_max/2 {
			var xx = (center_x-384) + x_offset;
		}else {
			var xx = (center_x+384) - x_offset;
		}
			
		if select_y > 2 {
			var y_offset = -y_gap * (select_y-2);
		}else {
			var y_offset = 0;
		}
			
		scr_Draw_Weapon_Description(xx,yy+y_offset,all_weapons[i],0,(global.weapon_unlocked_array[i] or test_mode = false),all_weapons_costs[i]);
	}
}

if test_mode = true {
	scr_Draw_Input_Prompt(center_x,340+52,19,"Back",make_color_rgb(180,82,82));
}else {
	scr_Draw_Input_Prompt(center_x,340+52-146,19,"Back",make_color_rgb(180,82,82));
}