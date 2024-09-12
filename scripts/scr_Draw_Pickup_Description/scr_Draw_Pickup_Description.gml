// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Draw_Pickup_Description(xx,yy,pickup,pickup_num,unlocked,item_cost) {
	
	if unlocked = true {
		var bg_spr_index = 1;
		var img_index = 1;
		var item_name = pickup._name;
		var item_description = pickup.tagline;
		var item_stats = pickup.cooldown_text;
	}else {
		var bg_spr_index = 0;
		var img_index = sprite_get_number(pickup.gui_sprite)-1;
		var item_name = "?????";
		var item_description = "This item has not been discovered yet.";
		var item_stats = "Cooldown: ???";
	}
	if pickup.is_synergy = false {
		var slot_sprite = spr_itemmenu_pickup_slot;
	}else {
		var slot_sprite = spr_itemmenu_pickup_slot_synergy;
	}
	
	//special cases
	if item_name = "Magic Stopwatch" {
		item_name = "Magic\nStopwatch"
	}

	
	//slot
	if pickup.is_synergy = true {
		if instance_exists(obj_items) or instance_exists(obj_item_swap) {
			draw_sprite(slot_sprite,bg_spr_index+2,xx,yy);
		}else {
			draw_sprite(slot_sprite,bg_spr_index,xx,yy);
		}
	}else {
		draw_sprite(slot_sprite,bg_spr_index,xx,yy);
	}
	
	if img_index = 1 {
		img_index = 0;	
	}
	
	//sprites
	if pickup.is_synergy = true and img_index < 2 and unlocked = true {
		draw_sprite(spr_synergy_animation,global.synergy_frame,xx-50,yy-98);
		draw_sprite(pickup.gui_sprite,img_index,xx-50,yy-98);
		if instance_exists(obj_items) or instance_exists(obj_item_swap) {
			draw_sprite(pickup.base_item_sprite_1,3,xx-32+2,yy+46);
			draw_sprite(pickup.base_item_sprite_2,3,xx+32+2,yy+46);
		}else {
			draw_sprite(pickup.base_item_sprite_1,3,xx-32+2,yy-153);
			draw_sprite(pickup.base_item_sprite_2,3,xx+32+2,yy-153);
		}
		
	}
	draw_sprite(pickup.gui_sprite,img_index,xx-50,yy-98);
	
	//draw cost
	
	if unlocked = true and !instance_exists(obj_item_swap) or instance_exists(obj_item_swap) /*and global.recycling = true*/ {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
	
		//draw_sprite(spr_coin,0,xx-49+7,yy-97+23);
		scr_Draw_Text_Outlined(xx-50,yy-97+23,item_cost,make_color_rgb(237,225,158)); //50 - 5
	}
	
	//"Active" text
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(fnt_item_popup);
	if pickup_num = 1 {
		scr_Draw_Text_Outlined(xx,yy-128,"Active 1",c_white);
	}else if pickup_num = 2 {
		scr_Draw_Text_Outlined(xx,yy-128,"Active 2",c_white);
	}
	
	//Powerup Name
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo2);
	var white = make_color_rgb(242,240,229);
	if unlocked = true {
		scr_Draw_Text_Outlined(xx+29,yy-105,scr_Linebreak(item_name,16,99),pickup.text_color);
	}else {
		scr_Draw_Text_Outlined(xx+29,yy-105,scr_Linebreak(item_name,16,99),c_white);
	}
	
	//Powerup Description
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_itemdescription2);
	scr_Draw_Text_Outlined(xx-72,yy-68,scr_Linebreak(item_description,28,99),c_white);
	
	//draw stats
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	scr_Draw_Text_Outlined(xx+2,yy+7,item_stats,c_white);
}