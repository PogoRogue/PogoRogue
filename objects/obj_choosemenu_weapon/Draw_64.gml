draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_item_popup);
draw_set_alpha(1); //alpha
scr_Draw_Text_Outlined(center_x,center_y-56,"Choose your starting weapon:", c_white); //center_y - 140 //center_y-56

draw_set_font(fnt_itemdescription2);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
	
//item sprites
for (i = 0; i < array_length(weapons_array); i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;
	var yy = (center_y+8) + floor(i / select_x_max) * y_gap; //156 + floor //center_y+8+floor

	//WEAPONS
	if i < array_length(weapons_array) {
		
		draw_sprite(select_sprite,2 + (select = i + 1),xx,yy-27);
		draw_sprite(all_weapons[i].sprite,0,xx,yy-27);
	
		if (i < array_length(all_weapons)) {
			scr_Draw_Text_Outlined(xx,yy-56,scr_Linebreak(all_weapons[i]._name,12,99),c_white);
		}
	}
}

//buttons
for (i = 0; i < array_length(weapons_array); i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;
	var yy = (center_y+8) + floor(i / select_x_max) * y_gap; //156 + floor //center_y+8+floor
	
	if (select = i + 1) {
		scr_Draw_Input_UI(xx,yy+4,18,0,fnt_combo2,fa_center,fa_middle);
		draw_set_font(fnt_itemdescription2);
	}
}

//descriptions
for (i = 0; i < array_length(all_weapons); i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;
	var yy = 295 + floor(i / select_x_max) * y_gap; //226 //295
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
			
		scr_Draw_Weapon_Description(xx,yy+y_offset,all_weapons[i],0,true,all_weapons_costs[i]);
	}
}