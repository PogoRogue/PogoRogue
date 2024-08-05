// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Draw_Coins(distance) {

	//standard distance: 52
	
	draw_set_color(c_white);
	
	//draw coins
	if (other.current_coins > 0 and global.show_coins) {
		str = "x" + string(other.current_coins);
		text_width = string_width(str);
		spr = spr_coingui_centered;
		spr_width = sprite_get_width(spr);
		width_added = text_width + spr_width + 1;
		
		//sprite
		draw_sprite_ext(spr,1,x + lengthdir_x(width_added/2,angle+180) + lengthdir_x(distance,angle+90),y + lengthdir_y(width_added/2,angle+180) + lengthdir_y(distance,angle+90),1,1,angle,c_white,other.coin_alpha);
		
		//text
		var white = make_color_rgb(242,240,229);
		draw_set_halign(fa_right);
		draw_set_valign(fa_top);
		scr_Draw_Text_Outlined_Transformed(x + lengthdir_x(width_added/2,angle) + lengthdir_x(distance+4,angle+90),y + lengthdir_y(width_added/2,angle) + lengthdir_y(distance+4,angle+90),str,white,1,1,angle,other.coin_alpha);
	}
}