/// @description draw choice
var yy = y;
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_item_popup);
draw_set_alpha(1); //alpha
scr_Draw_Text_Outlined(x,yy-44,"Choose an item to replace:", c_white);


//adjust sprite position for pickup sprites
var x_adjust = 0;
var y_adjust = 0;

if global.use_controller = true {
	select_sprite = select_sprite_controller;
}else {
	select_sprite = select_sprite_keyboard;
}
//get current item text
draw_set_font(fnt_itemdescription2);

for(i = 0; i < num_of_slots; i++) {
	if num_of_slots = 3 {
		draw_sprite(spr_item_slot,(i=select-1)+((i = num_of_slots-1)*2),x-64+(64*i),yy-16);
	}else if num_of_slots = 4 {
		draw_sprite(spr_item_slot,(i=select-1)+((i = num_of_slots-1)*2),x-96+(64*i),yy-16);
	}
	if i = num_of_slots-1 {
		if num_of_slots = 3 {
			scr_Draw_Text_Outlined(x-64+(64*i),yy-21-16,"Discard",make_color_rgb(180,82,82));
			draw_sprite(spr_cancel,0,x-64+(64*i),yy-16);
			draw_set_color(c_white);
		}else if num_of_slots = 4 {
			scr_Draw_Text_Outlined(x-96+(64*i),yy-21-16,"Discard",make_color_rgb(180,82,82));
			draw_sprite(spr_cancel,0,x-96+(64*i),yy-16);
			draw_set_color(c_white);
		}
	}else if i = 0 {
		if num_of_slots = 3 {
			draw_set_valign(fa_center);
			if pickups_mode = true {
				draw_sprite(spr_synergy_animation,global.synergy_frame,x-64+(64*i)-x_adjust,yy-y_adjust-16);
			}
			draw_sprite(sprite_1,0,x-64+(64*i)-x_adjust,yy-y_adjust-16);
			scr_Draw_Text_Outlined(x-64+(64*i)-x_adjust,yy-21-16,scr_Linebreak(item1_name,12,99),c_white);
		}else if num_of_slots = 4 {
			draw_set_valign(fa_center);
			draw_sprite(sprite_1,0,x-96+(64*i)-x_adjust,yy-y_adjust-16);
			scr_Draw_Text_Outlined(x-96+(64*i)-x_adjust,yy-21-16,scr_Linebreak(item1_name,12,99),c_white);
		}
	}else if i = 1 {
		if num_of_slots = 3 {
			draw_set_valign(fa_center);
			draw_sprite(spr_synergy_animation,global.synergy_frame,x-64+(64*i)-x_adjust,yy-y_adjust-16);
			draw_sprite(sprite_2,0,x-64+(64*i)-x_adjust,yy-y_adjust-16);
			scr_Draw_Text_Outlined(x-64+(64*i)-x_adjust,yy-21-16,scr_Linebreak(item2_name,12,99),c_white);
		}else if num_of_slots = 4 {
			draw_set_valign(fa_center);
			draw_sprite(sprite_2,0,x-96+(64*i)-x_adjust,yy-y_adjust-16);
			scr_Draw_Text_Outlined(x-96+(64*i)-x_adjust,yy-21-16,scr_Linebreak(item2_name,12,99),c_white);
		}
	}else if i = 2 and num_of_slots > 3 {
		draw_set_valign(fa_center);
		draw_sprite(sprite_3,0,x-96+(64*i)-x_adjust,yy-y_adjust-16);
		scr_Draw_Text_Outlined(x-96+(64*i)-x_adjust,yy-21-16,scr_Linebreak(item3_name,12,99),c_white);
	}
	
	draw_set_font(fnt_itemdescription2);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	//experimentation/recycling
	var item1_recycling_cost = 0;
	var item2_recycling_cost = 0;
	var item3_recycling_cost = 0;
	if global.recycling > 0 { //get recycling costs
		switch(global.recycling) {
			case 1: item1_recycling_cost = round(item1_cost/4); item2_recycling_cost = round(item2_cost/4); item3_recycling_cost = round(item3_cost/4); break;
			case 2: item1_recycling_cost = round(item1_cost/2); item2_recycling_cost = round(item2_cost/2); item3_recycling_cost = round(item3_cost/2); break;
			case 3: item1_recycling_cost = round(item1_cost/2) + round(item1_cost/4); item2_recycling_cost = round(item2_cost/2) + round(item2_cost/4); item3_recycling_cost = round(item3_cost/2) + round(item3_cost/4); break;
			case 4: item1_recycling_cost = item1_cost; item2_recycling_cost = item2_cost; item3_recycling_cost = item3_cost; break;
		}
		if num_of_slots = 3 and fade_away = false {
			if i = 0 {
				coin_string[i] = "+" + string(item1_recycling_cost);
			}else if i = 1 {
				coin_string[i] = "+" + string(item2_recycling_cost);
			}
		}else if num_of_slots = 4 and fade_away = false {
			if i = 0 {
				coin_string[i] = "+" + string(item1_recycling_cost);
			}else if i = 1 {
				coin_string[i] = "+" + string(item2_recycling_cost);
			}else if i = 2 {
				coin_string[i] = "+" + string(item3_recycling_cost);
			}
		}
	}
	
	if global.experimentation > 0 and i < num_of_slots-1 {
		if num_of_slots = 3 {
			draw_sprite(spr_item_slot_healthbonus, global.experimentation-1, x-64+(64*i), yy+21);
		}else if num_of_slots = 4 {
			draw_sprite(spr_item_slot_healthbonus, global.experimentation-1, x-96+(64*i), yy+21);
		}
		if global.recycling > 0 and i < num_of_slots-1 {
			if num_of_slots = 3 {
				draw_sprite(spr_item_slot_coinbonus, global.recycling-1, x-64+(64*i), yy+21+22);
				scr_Draw_Text_Outlined(x-64+(64*i)-4, yy+21+22,coin_string[i],c_white);
				draw_sprite(spr_coin,0,x-64+(64*i)+(string_width(coin_string[i])/2)+1, yy+21+22);
			}else if num_of_slots = 4 {
				draw_sprite(spr_item_slot_coinbonus, global.recycling-1, x-96+(64*i), yy+21+22);
				scr_Draw_Text_Outlined(x-96+(64*i)-4, yy+21+22,coin_string[i],c_white);
				draw_sprite(spr_coin,0,x-96+(64*i)+(string_width(coin_string[i])/2)+1, yy+21+22);
			}
		}
	}else if global.recycling > 0 and i < num_of_slots-1 {
		if num_of_slots = 3 {
			draw_sprite(spr_item_slot_coinbonus, global.recycling-1, x-64+(64*i), yy+21);
			scr_Draw_Text_Outlined(x-64+(64*i)-4, yy+21,coin_string[i],c_white);
			draw_sprite(spr_coin,0,x-64+(64*i)+(string_width(coin_string[i])/2)+1, yy+21);
		}else if num_of_slots = 4 {
			draw_sprite(spr_item_slot_coinbonus, global.recycling-1, x-96+(64*i), yy+21);
			scr_Draw_Text_Outlined(x-96+(64*i)-4, yy+21,coin_string[i],c_white);
			draw_sprite(spr_coin,0,x-96+(64*i)+(string_width(coin_string[i])/2)+1, yy+21);
		}
	}
	
	
	if global.use_controller = true {
		if i = select-1 {
			if num_of_slots = 3 {
				draw_sprite(select_sprite,0,x-64+(64*i),yy+24-16);
			}else if num_of_slots = 4 {
				draw_sprite(select_sprite,0,x-96+(64*i),yy+24-16);
			}
		}
	}else {
		if i = select-1 {
			draw_set_font(fnt_combo2);
			if num_of_slots = 3 {
				scr_Draw_Text_Outlined(x-64+(64*i),yy+21-16,"E",c_white);
			}else if num_of_slots = 4 {
				scr_Draw_Text_Outlined(x-96+(64*i),yy+21-16,"E",c_white);
			}
			draw_set_font(fnt_itemdescription2);
		}
	}
	
}

//draw new item
if global.experimentation = 0 and global.recycling = 0 {
	var y_offset = 40;
}else if global.experimentation = 0 or global.recycling = 0 {
	var y_offset = 16;
}else {
	var y_offset = 0;
}
if pickups_mode = true {
	num_of_slots = 3;
	scr_Draw_Pickup_Description(x,yy+185-y_offset,new_item,0,true,new_item_cost);
	draw_set_font(fnt_item_popup);
}else if weapons_mode = true {
	scr_Draw_Weapon_Description(x,yy+185-y_offset,new_item,0,true,new_item_cost);
	draw_set_font(fnt_item_popup);
}
/*
draw_sprite(spr_item_slot,0,x,yy+64);
draw_sprite(sprite_new,0,x-x_adjust,yy+64-y_adjust);
scr_Draw_Text_Outlined(x,yy+43,scr_Linebreak(item_name,12,99),c_white);*/

draw_set_alpha(1);