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
	
	//slot
	draw_sprite(spr_itemmenu_pickup_slot,bg_spr_index,xx,yy);
	
	if img_index = 1 {
		img_index = 0;	
	}
	
	//sprites
	draw_sprite(pickup.gui_sprite,img_index,xx-49,yy-97);
	
	//draw cost
	
	if unlocked = true and !instance_exists(obj_item_swap) or instance_exists(obj_item_swap) /*and global.recycling = true*/ {
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
	
		draw_sprite(spr_coin,0,xx-49+7,yy-97+23);
		scr_Draw_Text_Outlined(xx-49-5,yy-97+23,item_cost,c_white);
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
	draw_text_color(xx+26,yy-105,scr_Linebreak(item_name,16,99),white,white,white,white,draw_get_alpha());
	
	//Powerup Description
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_itemdescription2);
	draw_text_color(xx-72,yy-68,scr_Linebreak(item_description,28,99),white,white,white,white,draw_get_alpha());
	
	//draw stats
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_color(xx,yy+6,item_stats,white,white,white,white,draw_get_alpha());
}