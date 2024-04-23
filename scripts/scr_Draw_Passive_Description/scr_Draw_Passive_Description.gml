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
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo2);
			
	//slot
	draw_sprite(spr_itemmenu_passive_slot,bg_spr_index,xx,yy);
			
	//sprite
	if item_image_index = 1 {
		item_image_index = 0;	
	}
	draw_sprite(item_sprite,item_image_index,xx-42,yy-27);
	
	//draw cost
	if unlocked = true {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
	
		draw_sprite(spr_coin,0,xx-42+6,yy-27+12);
		scr_Draw_Text_Outlined(xx-42-4,yy-27+12,item_cost,c_white);
	}
	
	draw_set_font(fnt_combo2);
			
	//name
	var white = make_color_rgb(242,240,229);
	draw_text_color(xx+15,yy-27,scr_Linebreak(item_name,12,99),white,white,white,white,1);
			
	//description
	draw_set_color(white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_itemdescription2);
	draw_text(xx-54,yy-8,scr_Linebreak(item_description,21,99));
			
	//stackability
	draw_set_halign(fa_center);
	draw_text(xx,yy+36,scr_Linebreak(item_stats,21,99));
	draw_set_color(c_white);
}