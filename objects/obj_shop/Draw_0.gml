if room = room_shop {

var xx = 0;
var yy = 0;

var yellow = make_color_rgb(237,225,158);

for(i = 0; i < num_of_slots; i++) {
	if i % 2 = 0 {
		xx = 272+32;
	}else {
		xx = 338+32;
	}
	yy = 154 + 62 * floor(i / 2); //104
	
	if refresh_button = false {
		if instance_exists(slot_items_array[i]) {
			if global.num_of_coins < round(slot_items_array[i].item_cost * global.sale) or (slot_items_array[i].sold_out = true) {
				if cant_move = false {
					//draw_sprite(spr_item_slot_shop,(i=select-1),xx,yy);
				}else {
					//draw_sprite(spr_item_slot_shop,0,xx,yy);
				}
			}else {
				if cant_move = false {
					//draw_sprite(spr_item_slot_shop,(i=select-1)+2,xx,yy);
				}else {
					//draw_sprite(spr_item_slot_shop,2,xx,yy);
				}
			}
		}else {
			if cant_move = false {
				//draw_sprite(spr_item_slot_shop,i=select-1,xx,yy);
			}else {
				//draw_sprite(spr_item_slot_shop,0,xx,yy);
			}
		}
		//draw_sprite(spr_item_slot_shop,i=select-1,xx,yy);
	}else {
		if instance_exists(slot_items_array[i]) {
			if global.num_of_coins < round(slot_items_array[i].item_cost * global.sale) or (slot_items_array[i].sold_out = true) {
				//draw_sprite(spr_item_slot_shop,0,xx,yy);
			}else {
				//draw_sprite(spr_item_slot_shop,2,xx,yy);
			}
		}else {
			//draw_sprite(spr_item_slot_shop,0,xx,yy);
		}
	}
	
	//draw cost
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(global.lana); //fnt_combo2
	
	if instance_exists(slot_items_array[i]) {
		//draw_sprite(spr_coin,0,xx+10,yy+21);
		
		if global.num_of_coins < round(slot_items_array[i].item_cost * global.sale) or (slot_items_array[i].sold_out = true) {
			scr_Draw_Text_Outlined(xx,yy+14,round(slot_items_array[i].item_cost * global.sale),make_color_rgb(180,82,82));
			draw_set_color(c_white);
		} else {
			scr_Draw_Text_Outlined(xx,yy+14,round(slot_items_array[i].item_cost * global.sale),yellow);
		}
		
		//sold out
		if slot_items_array[i].sold_out = true {
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_font(global.lana);
			//scr_Draw_Text_Outlined(xx,yy-28,"Sold Out",make_color_rgb(180,82,82));
		}else {
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_font(global.lana);
			if global.num_of_coins < round(slot_items_array[i].item_cost * global.sale) {
				//scr_Draw_Text_Outlined(xx,yy-28,scr_Linebreak(slot_items_array[i].item_name,12,99),make_color_rgb(180,82,82));
			}else {
				//scr_Draw_Text_Outlined(xx,yy-28,scr_Linebreak(slot_items_array[i].item_name,12,99),c_white);
			}
		}
	}
	
	if select > 0 {
		last_selected = select;
	}
	
	//draw item descriptions + buy button
	if instance_exists(slot_items_array[last_selected-1]) and !refresh_button {
		if last_selected <= 4 { //passives
			description_x = 440+32;
			description_y = 132;
			
				scr_Draw_Passive_Description(description_x+4+8,description_y+26,slot_items_array[last_selected-1].sprite_index,slot_items_array[last_selected-1].image_index+1,slot_items_array[last_selected-1].item_name,slot_items_array[last_selected-1].item_tagline,string(slot_items_array[last_selected-1].item_stats),true,slot_items_array[last_selected-1].item_cost);
			if too_expensive or sold_out {
				//draw_sprite(spr_item_slot_buy,(select = 0) + (too_expensive and select = 0 or sold_out and select = 0)+3,description_x,description_y+79+26);
			}else {
				draw_sprite(spr_item_slot_buy,(select = 0) + (too_expensive and select = 0 or sold_out and select = 0),description_x+10,description_y+79+26);
			}
			
			//button
			if !sold_out and !too_expensive { //global.use_controller = true and 
				scr_Draw_Input_Prompt(description_x+(11*(global.use_controller = true))+((global.use_controller = false)*2)+10,description_y+92+9+26,18,"",c_white);
				//draw_sprite(spr_controller_button_bottom,0,description_x,description_y+92);
			}
		}else if last_selected <= 6 { //weapons
			description_x = 458+32;
			description_y = 210;
			scr_Draw_Weapon_Description(description_x+8,description_y+26,slot_items_array[last_selected-1].weapon,0,true,slot_items_array[last_selected-1].item_cost);
			
			if too_expensive or sold_out {
				//draw_sprite(spr_item_slot_buy,(select = 0) + (too_expensive and select = 0 or sold_out and select = 0)+3,description_x,description_y+112+26);
			}else {
				draw_sprite(spr_item_slot_buy,(select = 0) + (too_expensive and select = 0 or sold_out and select = 0),description_x+8,description_y+112+26);
			}
			
			//button
			if !sold_out and !too_expensive { //global.use_controller = true and 
				scr_Draw_Input_Prompt(description_x+(11*(global.use_controller = true))+((global.use_controller = false)*2)+8,description_y+125+9+26,18,"",c_white);
				//draw_sprite(spr_controller_button_bottom,0,description_x,description_y+125);
			}
		}else { //actives
			description_x = 458+32;
			description_y = 210;
			scr_Draw_Pickup_Description(description_x+8,description_y+26,slot_items_array[last_selected-1].pickup,0,true,slot_items_array[last_selected-1].item_cost);
			
			if too_expensive or sold_out {
				//draw_sprite(spr_item_slot_buy,(select = 0) + (too_expensive and select = 0 or sold_out and select = 0)+3,description_x,description_y+40+26);
			}else {
				draw_sprite(spr_item_slot_buy,(select = 0) + (too_expensive and select = 0 or sold_out and select = 0),description_x+8,description_y+40+26);
			}
			
			//button
			if !sold_out and !too_expensive { //global.use_controller = true and 
				
				scr_Draw_Input_Prompt(description_x+(11*(global.use_controller = true))+((global.use_controller = false)*2)+8,description_y+51+9+26,18,"",c_white);
				//draw_sprite(spr_controller_button_bottom,0,description_x,description_y+51);
			}
		}
	}
	
	//draw item types
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(global.uranus);//
	
	if i < 2 {
		//scr_Draw_Text_Outlined(304+32,yy-33,"Health",c_white);
	}else if i < 4 {
		//scr_Draw_Text_Outlined(304+32,yy-31,"Passive Items",c_white);
	}else if i < 6 {
		//scr_Draw_Text_Outlined(304+32,yy-31,"Weapons",c_white);
	}else {
		//scr_Draw_Text_Outlined(304+32,yy-31,"Active Items",c_white);
	}
}

xx = 304+32;
xx2 = 376+32;
yy = 144;
yy2 = 336+56;

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_uifont2small);
if global.num_of_coins >= global.refresh_cost {
	draw_sprite(spr_item_slot_refresh,refresh_button + (((global.num_of_coins < global.refresh_cost or refreshes_left <= 0)*refresh_button)),xx,yy2);
}else {
	draw_sprite(spr_item_slot_refresh,(refresh_button + (((global.num_of_coins < global.refresh_cost or refreshes_left <= 0)*refresh_button)))+3,xx,yy2);
}


if refreshes_left > 0 {
	draw_set_font(fnt_uifont2small);
	
	if global.num_of_coins < global.refresh_cost {
		scr_Draw_Text_Outlined(xx,yy2+9,global.refresh_cost,make_color_rgb(180,82,82));
		draw_set_font(global.lana);
		scr_Draw_Text_Outlined(xx,yy2,"刷新货架",make_color_rgb(180,82,82));
		draw_set_color(c_white);
	} else {
		draw_set_font(global.lana);
		scr_Draw_Text_Outlined(xx,yy2+9,global.refresh_cost,yellow);
		draw_set_font(global.lana);
		scr_Draw_Text_Outlined(xx,yy2,"刷新货架",make_color_rgb(242,240,229));
	}
	
	//draw_sprite(spr_coin,0,xx+10,yy2+9);
}
draw_set_font(global.lana);

if global.refreshes_used != 1 {
	scr_Draw_Text_Outlined(xx,yy2+22,"货架已刷新 " + string(global.refreshes_used),c_white);
}else {
	scr_Draw_Text_Outlined(xx,yy2+22,"货架已刷新 "  + string(global.refreshes_used),c_white);
}

//draw slot selected
if select != 0 and refresh_button = false {
	draw_sprite(spr_shop_shelf_selection,select,258,68);
}

}