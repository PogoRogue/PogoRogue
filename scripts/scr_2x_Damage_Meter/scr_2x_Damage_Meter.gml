// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_2x_Damage_Meter(yy,draw_meter){
	draw_set_color(make_color_rgb(180,82,82));
	draw_set_font(fnt_combo2);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])-16-(sprite_get_width(spr_2xmeter)/2),yy - 7,"2x Damage",make_color_rgb(180,82,82));
	draw_set_color(c_white);
	
	if draw_meter = true {
		draw_sprite(spr_2xmeter,0,camera_get_view_width(view_camera[0])-16,yy);
		draw_sprite_part(spr_2xmeter,1,0,0,sprite_get_width(spr_2xmeter)*(damage_boost_timer / (180 * global.bar_time_added)),sprite_get_height(spr_2xmeter),camera_get_view_width(view_camera[0])-16-sprite_get_width(spr_2xmeter),yy-4);
	}
}