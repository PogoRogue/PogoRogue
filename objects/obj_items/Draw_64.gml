center_x = camera_get_view_width(view_camera[0])/2;

//draw UI
if select_y = 0 {
	draw_sprite(spr_itemmenu_passives,select = 1,center_x-96,72);
	draw_sprite(spr_itemmenu_actives,select = 2,center_x,72);
	draw_sprite(spr_itemmenu_weapons,select = 3,center_x+96,72);
}else {
	draw_sprite(spr_itemmenu_passives,(select = 1)*2,center_x-96,72);
	draw_sprite(spr_itemmenu_actives,(select = 2)*2,center_x,72);
	draw_sprite(spr_itemmenu_weapons,(select = 3)*2,center_x+96,72);
}

//PASSIVES
if select = 1 {
	var item_selected = ((select_y-1)*4)+select_x;
	//grid
	for(xx = 0; xx < select_x_max; xx++) {
		for(yy = 0; yy < select_y_max; yy++) {
			var ii = (xx) + ((yy)*4);
			if page_num = 1 {
				draw_sprite(spr_item_slot_shop,(select_x-1 = xx and select_y-1 = yy)+(2*(ii<(array_length(global.all_buff_sprites)))),center_x-90+xx*60,128+yy*60);
			}else if page_num = 2 {
				draw_sprite(spr_item_slot_shop,(select_x-1 = xx and select_y-1 = yy)+(2*((ii+16)<(array_length(global.all_buff_sprites)))),center_x-90+xx*60,128+yy*60);
			}
		}
	}
	
	//draw arrows
	if page_num = 1 and array_length(global.all_buff_sprites) > 16 {
		draw_sprite(spr_settings_rightarrow_big,0,center_x+128,128+1.5*60);
	}else if page_num = 2 and array_length(global.all_buff_sprites) > 16 {
		draw_sprite(spr_settings_leftarrow_big,0,center_x-128,128+1.5*60);
	}
	
	//item sprites
	for (i = 0; i < array_length(global.all_buff_sprites); i++) {
		if page_num = 1 { 
			var xx = (center_x - 90) + (i % 4) * 60;
			var yy = 156 + floor(i / 4) * 60;
		}else if page_num = 2 { 
			var xx = (center_x - 90) + ((i-16) % 4) * 60;
			var yy = 156 + floor((i-16) / 4) * 60;
		}
		
		if page_num = 1 and i <= 15 
		or page_num = 2 and i > 15 {
			//name
			draw_set_font(fnt_itemdescription2);
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			scr_Draw_Text_Outlined(xx,yy-49,scr_Linebreak(global.all_buff_names[i],12,99),c_white);
		
			//sprite
			draw_sprite(global.all_buff_sprites[i],global.all_buff_sprites_index[i]+1,xx,yy-27);
	
			//numbers of each buff
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_font(fnt_itemdescription2);
			if global.all_buff_numbers[i] > 1 {
				scr_Draw_Text_Outlined(xx-8,yy-19,global.all_buff_numbers[i],c_white);
			}
		}
		
		//draw item description
		if i = item_selected-1 and page_num = 1 
		or (i-16) = item_selected-1 and page_num = 2 {
			
			var bubble_x = center_x-190;
			if select_x <= 2 {
				bubble_x = center_x-190;
			}else {
				var bubble_x = center_x+190;
			}
			
			scr_Draw_Passive_Description(bubble_x,yy,global.all_buff_sprites[i],global.all_buff_sprites_index[i]+1,global.all_buff_names[i],global.all_buff_descriptions[i],global.all_buff_stats[i],true);
		}
	}
}

//ACTIVES
if select = 2 {
	var xx1 = center_x-86;
	var xx2 = center_x+86;
	var yy = 234;
	
	if num_of_pickups = 1 {
		scr_Draw_Pickup_Description(center_x,yy,pickup_1,1,true);
	}else if num_of_pickups = 2 {
		scr_Draw_Pickup_Description(xx1,yy,pickup_1,1,true);
		scr_Draw_Pickup_Description(xx2,yy,pickup_2,2,true);
	}
}

//WEAPONS
if select = 3 {
	var xx1 = center_x-86;
	var xx2 = center_x+86;
	var xx3 = center_x+172;
	var yy = 234;
	
	if num_of_weapons = 1 {
		scr_Draw_Weapon_Description(center_x,yy,gun_1,1,true);
	}else if num_of_weapons = 2 {
		scr_Draw_Weapon_Description(xx1,yy,gun_1,1,true);
		scr_Draw_Weapon_Description(xx2,yy,gun_2,2,true);
	}else if num_of_weapons = 3 {
		xx1 = center_x-172;
		scr_Draw_Weapon_Description(xx1,yy,gun_1,1,true);
		scr_Draw_Weapon_Description(center_x,yy,gun_2,2,true);
		scr_Draw_Weapon_Description(xx3,yy,gun_3,3,true);
	}
}