// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Draw_Passive_Description(xx,yy,item_sprite,item_image_index,item_name,item_description,item_stats,unlocked,item_cost) {
	
	var bg_spr_index = 1;
	
	if unlocked = false {
		bg_spr_index = 0;
		item_image_index = sprite_get_number(item_sprite)-1;
		item_name = "?????";
		item_description = "This item has not been discovered yet.";
		item_stats = "Stackable: ???";
	}
	
	//special cases
	if item_name = "Strong Muscles" {
		item_name = "Strong\nMuscles"
	}
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo2);

	if item_name = "Heart" {
		draw_sprite(spr_itemmenu_passive_slot,bg_spr_index+2,xx,yy);
	}else {
		//slot
		draw_sprite(spr_itemmenu_passive_slot,bg_spr_index,xx,yy);
	}
			
	//sprite
	if item_image_index = 1 {
		item_image_index = 0;	
	}
	draw_sprite(item_sprite,item_image_index,xx-47,yy-26);
	
	//draw cost
	if unlocked = true {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
	
		//draw_sprite(spr_coin,0,xx-42+6,yy-27+12);
		scr_Draw_Text_Outlined(xx-47,yy-25+12,item_cost,make_color_rgb(237,225,158)); //43 - 4
	}
	
	draw_set_font(fnt_combo2);
			
	//name
	var white = make_color_rgb(242,240,229);
	scr_Draw_Text_Outlined(xx+17,yy-27,scr_Linebreak(item_name,13,99),c_white);
			
	//description
	draw_set_color(white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_itemdescription2);
	scr_Draw_Text_Outlined(xx-58,yy-5,scr_Linebreak(item_description,21,99),c_white);
			
	//stackability
	draw_set_halign(fa_center);
	scr_Draw_Text_Outlined(xx,yy+41,scr_Linebreak(item_stats,21,99),c_white);
	draw_set_color(c_white);
}