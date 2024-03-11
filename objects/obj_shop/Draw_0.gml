if room = room_shop {

var xx = 0;
var yy = 0;

for(i = 0; i < num_of_slots; i++) {
	if i % 2 = 0 {
		xx = 272;
	}else {
		xx = 336;
	}
	yy = 104 + 64 * floor(i / 2);
	
	if refresh_button = false {
		if instance_exists(slot_items_array[i]) {
			if global.num_of_coins < round(slot_items_array[i].item_cost * global.sale) or (slot_items_array[i].sold_out = true) {
				draw_sprite(spr_item_slot_shop,i=select-1,xx,yy);
			}else {
				draw_sprite(spr_item_slot_shop,(i=select-1)+2,xx,yy);
			}
		}else {
			draw_sprite(spr_item_slot_shop,i=select-1,xx,yy);
		}
		//draw_sprite(spr_item_slot_shop,i=select-1,xx,yy);
	}else {
		if instance_exists(slot_items_array[i]) {
			if global.num_of_coins < round(slot_items_array[i].item_cost * global.sale) or (slot_items_array[i].sold_out = true) {
				draw_sprite(spr_item_slot_shop,0,xx,yy);
			}else {
				draw_sprite(spr_item_slot_shop,2,xx,yy);
			}
		}else {
			draw_sprite(spr_item_slot_shop,0,xx,yy);
		}
	}
	
	//draw cost
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_uifontsmall);
	
	if instance_exists(slot_items_array[i]) {
		draw_sprite(spr_coin,0,xx+10,yy+21);
		
		if global.num_of_coins < round(slot_items_array[i].item_cost * global.sale) or (slot_items_array[i].sold_out = true) {
			scr_Draw_Text_Outlined(xx-6,yy+21,round(slot_items_array[i].item_cost * global.sale),make_color_rgb(180,82,82));
			draw_set_color(c_white);
		} else {
			scr_Draw_Text_Outlined(xx-6,yy+21,round(slot_items_array[i].item_cost * global.sale),c_white);
		}
		
		//sold out
		if slot_items_array[i].sold_out = true {
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_font(fnt_uifontsmall);
			scr_Draw_Text_Outlined(xx,yy-21,"Sold Out",make_color_rgb(180,82,82));
		}
	}
	
	if select > 0 {
		last_selected = select;
	}
	
	//draw item descriptions + buy button
	if instance_exists(slot_items_array[last_selected-1]) and !refresh_button {
		if last_selected <= 4 { //passives
			description_x = 440;
			description_y = 132;
			scr_Draw_Passive_Description(description_x,description_y,slot_items_array[last_selected-1].sprite_index,slot_items_array[last_selected-1].image_index+1,slot_items_array[last_selected-1].item_name,slot_items_array[last_selected-1].item_tagline,string(slot_items_array[last_selected-1].item_stats),true,slot_items_array[last_selected-1].item_cost);
			if too_expensive or sold_out {
				draw_sprite(spr_item_slot_buy,(select = 0) + (too_expensive and select = 0 or sold_out and select = 0)+3,description_x,description_y+69);
			}else {
				draw_sprite(spr_item_slot_buy,(select = 0) + (too_expensive and select = 0 or sold_out and select = 0),description_x,description_y+69);
			}
			
			//button
			if global.use_controller = true and !sold_out {
				draw_sprite(spr_controller_button_bottom,0,description_x,description_y+81);
			}
		}else if last_selected <= 6 { //weapons
			description_x = 458;
			description_y = 210;
			scr_Draw_Weapon_Description(description_x,description_y,slot_items_array[last_selected-1].weapon,0,true,slot_items_array[last_selected-1].item_cost);
			
			if too_expensive or sold_out {
				draw_sprite(spr_item_slot_buy,(select = 0) + (too_expensive and select = 0 or sold_out and select = 0)+3,description_x,description_y+112);
			}else {
				draw_sprite(spr_item_slot_buy,(select = 0) + (too_expensive and select = 0 or sold_out and select = 0),description_x,description_y+112);
			}
			
			//button
			if global.use_controller = true and !sold_out {
				draw_sprite(spr_controller_button_bottom,0,description_x,description_y+124);
			}
		}else { //actives
			description_x = 458;
			description_y = 210;
			scr_Draw_Pickup_Description(description_x,description_y,slot_items_array[last_selected-1].pickup,0,true,slot_items_array[last_selected-1].item_cost);
			
			if too_expensive or sold_out {
				draw_sprite(spr_item_slot_buy,(select = 0) + (too_expensive and select = 0 or sold_out and select = 0)+3,description_x,description_y+40);
			}else {
				draw_sprite(spr_item_slot_buy,(select = 0) + (too_expensive and select = 0 or sold_out and select = 0),description_x,description_y+40);
			}
			
			//button
			if global.use_controller = true and !sold_out {
				draw_sprite(spr_controller_button_bottom,0,description_x,description_y+52);
			}
		}
	}
}

xx = 304;
xx2 = 376;
yy = 104;
yy2 = 336;

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_uifont2small);
if global.num_of_coins >= global.refresh_cost {
	draw_sprite(spr_item_slot_refresh,refresh_button + (((global.num_of_coins < global.refresh_cost or refreshes_left <= 0)*refresh_button)),xx,yy2);
}else {
	draw_sprite(spr_item_slot_refresh,(refresh_button + (((global.num_of_coins < global.refresh_cost or refreshes_left <= 0)*refresh_button)))+3,xx,yy2);
}


if refreshes_left > 0 {
	draw_set_font(fnt_uifontsmall);
	
	if global.num_of_coins < global.refresh_cost {
		scr_Draw_Text_Outlined(xx-6,yy2+9,global.refresh_cost,make_color_rgb(180,82,82));
		draw_set_font(fnt_uifont2small);
		draw_text_color(xx,yy2,"REFRESH",make_color_rgb(180,82,82),make_color_rgb(180,82,82),make_color_rgb(180,82,82),make_color_rgb(180,82,82),1);
		draw_set_color(c_white);
	} else {
		draw_set_font(fnt_uifontsmall);
		scr_Draw_Text_Outlined(xx-6,yy2+9,global.refresh_cost,c_white);
		draw_set_font(fnt_uifont2small);
		draw_text_color(xx,yy2,"REFRESH",make_color_rgb(242,240,229),make_color_rgb(242,240,229),make_color_rgb(242,240,229),make_color_rgb(242,240,229),1);
	}
	
	draw_sprite(spr_coin,0,xx+10,yy2+9);
}
draw_set_font(fnt_uifont2small);

if global.refreshes_used != 1 {
	scr_Draw_Text_Outlined(xx,yy2+22,string(global.refreshes_used) + " REFRESHES USED",c_white);
}else {
	scr_Draw_Text_Outlined(xx,yy2+22,string(global.refreshes_used) + " REFRESH USED",c_white);
}

}