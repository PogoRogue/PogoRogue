// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Draw_Synergy_Description(xx,yy,synergy) {
	
	var item_name = synergy._name;

	//slot
	draw_sprite(spr_itemmenu_synergy_slot,0,xx,yy);
	
	//sprites
	draw_sprite(spr_synergy_animation,global.synergy_frame,xx,yy+13);
	draw_sprite(synergy.gui_sprite,0,xx,yy+13);
	
	//Powerup Name
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_itemdescription2);
	var _color = synergy.text_color;
	scr_Draw_Text_Outlined(xx,yy+13-21,scr_Linebreak(item_name,16,99),_color);
}