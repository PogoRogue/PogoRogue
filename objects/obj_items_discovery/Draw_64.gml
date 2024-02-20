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
		draw_sprite(select_sprite,(select_x-1 = xx and select_y-1 = yy),center_x-((x_gap*select_x_max-x_gap)/2)+xx*x_gap,128+yy*y_gap);
	}
}
	
//item sprites
for (i = 0; i < 32; i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;
	var yy = 156 + floor(i / select_x_max) * y_gap;
	
	//PASSIVES
	if select = 1 {
		draw_sprite(passives_array[i],sprite_get_number(passives_array[i])-1,xx,yy-27);
	}

	//ACTIVES
	if select = 2 and i < array_length(actives_array) {
		draw_sprite(actives_array[i],sprite_get_number(actives_array[i])-1,xx,yy-27);
	}

	//WEAPONS
	if select = 3 and i < array_length(weapons_array) {
		draw_sprite(weapons_array[i],sprite_get_number(weapons_array[i])-1,xx,yy-27);
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
	var yy = 156 + floor(i / select_x_max) * y_gap;
	if (select = 1) {
		if (i = ((select_y-1)*select_x_max)+(select_x-1)) {
			if select_x <= select_x_max/2 {
				var xx = 92;
			}else {
				var xx = room_width - 92;
			}
			scr_Draw_Passive_Description(xx,yy,all_buff_sprites[i],all_buff_sprites_index[i],all_buff_names[i],all_buff_descriptions[i],all_buff_stats[i],false);
		}
	}
}

for (i = 0; i < array_length(global.all_pickups); i++) {
	var yy = 226 + floor(i / select_x_max) * y_gap;
	if (select = 2) {
		if (i = ((select_y-1)*select_x_max)+(select_x-1)) {
			if select_x <= select_x_max/2 {
				var xx = 154;
			}else {
				var xx = room_width - 154;
			}
			
			if select_y > 3 {
				var y_offset = -y_gap;
			}else {
				var y_offset = 0;
			}
			
			scr_Draw_Pickup_Description(xx,yy+y_offset,all_pickups[i],0,false);
		}
	}
}

for (i = 0; i < array_length(global.all_weapons); i++) {
	var xx = (center_x - ((x_gap*select_x_max-x_gap)/2)) + (i % select_x_max) * x_gap;
	var yy = 226 + floor(i / select_x_max) * y_gap;
	if (select = 3) {
		if (i = ((select_y-1)*select_x_max)+(select_x-1)) {
			if select_x <= select_x_max/2 {
				var xx = 154;
			}else {
				var xx = room_width - 154;
			}
			
			if select_y > 2 {
				var y_offset = -y_gap * (select_y-2);
			}else {
				var y_offset = 0;
			}
			
			scr_Draw_Weapon_Description(xx,yy+y_offset,all_weapons[i],0,false);
		}
	}
}