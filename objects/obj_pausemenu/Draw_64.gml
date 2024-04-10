/// @description draw self
if !instance_exists(obj_popup_restart) and !instance_exists(obj_popup_exit) and !instance_exists(obj_items) and !instance_exists(obj_settings) and !instance_exists(obj_popup_menu) {
	
	var xx = camera_get_view_width(view_camera[0])/2;
	var yy = camera_get_view_height(view_camera[0])/2;
	draw_sprite(sprite_index,image_index,xx,yy);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_item_popup);
	if room = room_proc_gen_test or room = room_shop or room = room_boss_1 or room = room_boss_2 or room = room_boss_3 {
		scr_Draw_Text_Outlined(xx,yy-88,"Seed: " + string(global.seed),c_white);
	}
}
	