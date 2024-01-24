center_x = camera_get_view_width(view_camera[0])/2;

//draw UI
if select_y = 0 {
	draw_sprite(spr_settingsmenu_sound,select = 1,center_x-144,72);
	draw_sprite(spr_settingsmenu_video,select = 2,center_x-48,72);
	draw_sprite(spr_settingsmenu_gameplay,select = 3,center_x+48,72);
	draw_sprite(spr_settingsmenu_bindings,select = 4,center_x+144,72);
}else {
	draw_sprite(spr_settingsmenu_sound,(select = 1)*2,center_x-144,72);
	draw_sprite(spr_settingsmenu_video,(select = 2)*2,center_x-48,72);
	draw_sprite(spr_settingsmenu_gameplay,(select = 3)*2,center_x+48,72);
	draw_sprite(spr_settingsmenu_bindings,(select = 4)*2,center_x+144,72);
}

//draw settings options here