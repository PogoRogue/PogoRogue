if draw_respawn = false and obj_player.image_yscale = 0 {
	draw_self();
	draw_sprite_ext(spr_blink_box_arrows,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,arrows_alpha);

	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_item_popup);
	scr_Draw_Text_Outlined(x,y,string(ceil((time_left+6)/60)-1) + "." + string(ceil(time_left/6)%10),c_white);
}else if obj_player.image_yscale = 0 {
	draw_sprite_ext(obj_player.white_sprite,obj_player.image_index,obj_player.x+lengthdir_x(22,obj_player.angle+90),obj_player.y+lengthdir_y(22,obj_player.angle+90),new_xscale,new_yscale,obj_player.angle,c_white,1);
}