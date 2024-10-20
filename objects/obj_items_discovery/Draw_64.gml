center_x = camera_get_view_width(view_camera[0])/2;

//draw UI
if select_y = 0 {
	draw_sprite(spr_itemmenu_passives,select = 1,center_x-96,56);
	draw_sprite(spr_itemmenu_actives,select = 2,center_x,56);
	draw_sprite(spr_itemmenu_weapons,select = 3,center_x+96,56);
}else {
	draw_sprite(spr_itemmenu_passives,(select = 1)*2,center_x-96,56);
	draw_sprite(spr_itemmenu_actives,(select = 2)*2,center_x,56);
	draw_sprite(spr_itemmenu_weapons,(select = 3)*2,center_x+96,56);
}

//PASSIVES
var item_selected = ((select_y-1)*select_x_max)+select_x;

//grid
for(xx = 0; xx < select_x_max; xx++) {
	for(yy = 0; yy < select_y_max; yy++) {
		draw_sprite(select_sprite,(select_x-1 = xx and select_y-1 = yy),center_x-((x_gap*select_x_max-x_gap)/2)+xx*x_gap,128+yy*y_gap+1-(24*(select = 1))-(16*(select = 2)));
	}
}

//draw area indicators
if select= 3 {
	draw_sprite(spr_item_menu_areas,0,center_x-140-36,128+36);
	draw_sprite(spr_item_menu_areas,1,center_x+140+36,128+36+72);
	draw_sprite(spr_item_menu_areas,2,center_x-140-36,128+36+144);
}

draw_set_font(fnt_itemdescription2);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
	
//item sprites
for (i = 0; i < 40; i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;
	var yy = 156 + floor(i / select_x_max) * y_gap - (24*(select = 1));
	//PASSIVES
	if select = 1 {
		if global.passive_unlocked_array[i] = true {
			draw_sprite(select_sprite,2 + ((i = (select_x-1)+((select_y-1)*select_x_max))),xx,yy-27);
		}
		draw_sprite(passives_array[i],(sprite_get_number(passives_array[i])-1)*(global.passive_unlocked_array[i] = false) /*+ (global.passive_unlocked_array[i] = true)*/,xx,yy-27);

		if (i < array_length(global.all_buffs) and global.passive_unlocked_array[i]= true) {
			scr_Draw_Text_Outlined(xx,yy-49,scr_Linebreak(all_buff_names[i],12,99),c_white);
		}
	}
	

	//ACTIVES
	if select = 2 and i < array_length(actives_array) {
		if global.active_unlocked_array[i] = true {
			draw_sprite(select_sprite,2 + ((i = (select_x-1)+((select_y-1)*select_x_max))),xx,yy-27-16);
			if i = 12 or i > 19 {
				draw_sprite(spr_synergy_animation,global.synergy_frame,xx,yy-27-16);
			}
		}
		draw_sprite(actives_array[i],(sprite_get_number(actives_array[i])-1)*(global.active_unlocked_array[i] = false) /*+ (global.active_unlocked_array[i] = true)*/,xx,yy-27-16);
	
		if (i < 30 and global.active_unlocked_array[i]= true) {
			scr_Draw_Text_Outlined(xx,yy-48-16,scr_Linebreak(all_pickups[i]._name,12,99),c_white);
		}
	}

	//WEAPONS
	if select = 3 and i < array_length(weapons_array) {
		if global.weapon_unlocked_array[i] = true {
			draw_sprite(select_sprite,2 + ((i = (select_x-1)+((select_y-1)*select_x_max))),xx,yy-27);
		}
		draw_sprite(weapons_array[i],(sprite_get_number(weapons_array[i])-1)*(global.weapon_unlocked_array[i] = false) /*+ (global.weapon_unlocked_array[i] = true)*/,xx,yy-27);
	
		if (i < 20 and global.weapon_unlocked_array[i]= true) {
			scr_Draw_Text_Outlined(xx,yy-56,scr_Linebreak(all_weapons[i]._name,12,99),c_white);
		}
	}
		
	//draw item description
	if i = item_selected-1 {
		var bubble_x = center_x-181;
		if select_x <= 2 {
			bubble_x = center_x-181;
		}else {
			var bubble_x = center_x+181;
		}
	}
}

//descriptions
for (i = 0; i < array_length(global.all_buffs); i++) {
	var yy = 156 + floor(i / select_x_max) * y_gap - 24;
	if (select = 1) {
		if (i = ((select_y-1)*select_x_max)+(select_x-1)) {
			if select_x <= select_x_max/2 {
				var xx = 74;
			}else {
				var xx = room_width - 74;
			}
			scr_Draw_Passive_Description(xx,yy,all_buff_sprites[i],all_buff_sprites_index[i],all_buff_names[i],all_buff_descriptions[i],all_buff_stats[i],global.passive_unlocked_array[i],all_buff_costs[i]);
		}
	}
}


for (i = 0; i < 30; i++) {
	var yy = 226 + floor(i / select_x_max) * y_gap-6;
	if (select = 2) {
		if (i = ((select_y-1)*select_x_max)+(select_x-1)) {
			var x_offset = 154 + (((select_x_max-4)*(-x_gap))/2);
			if select_x <= select_x_max/2 {
				var xx = (center_x-364) + x_offset;
			}else {
				var xx = (center_x+360) - x_offset;
			}
			
			if select_y > 4 {
				var y_offset = -y_gap * (select_y-4);
			}else {
				var y_offset = 0;
			}
			
			scr_Draw_Pickup_Description(xx,yy+y_offset,all_pickups[i],0,global.active_unlocked_array[i],all_pickups_costs[i]);
		}
	}
}

for (i = 0; i < 20; i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;
	var yy = 226 + floor(i / select_x_max) * y_gap;
	if (select = 3) {
		if (i = ((select_y-1)*select_x_max)+(select_x-1)) {
			if select_x <= select_x_max/2 {
				var xx = 154 - 54;
			}else {
				var xx = room_width - 154 + 54;
			}
			
			if select_y > 2 {
				var y_offset = -y_gap * (select_y-2);
			}else {
				var y_offset = 0;
			}
			
			scr_Draw_Weapon_Description(xx,yy+y_offset,all_weapons[i],0,global.weapon_unlocked_array[i],all_weapons_costs[i]);
		}
	}
}

//Draw number of items found
draw_set_font(fnt_combo2);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
if select = 1 {
	var y_text_offset = 39;
}else {
	var y_text_offset = 31;
}
scr_Draw_Text_Outlined(room_width/2,416-y_text_offset,string(total_items_unlocked) + "/" + string(array_length(global.all_buffs) + array_length(global.all_weapons_list) + array_length(global.all_pickups_list)) + " Items Found",make_color_rgb(237,225,158));