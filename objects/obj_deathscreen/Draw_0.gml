//darken screen
draw_set_color(make_color_rgb(33,33,35));
draw_set_alpha(alpha);
draw_rectangle(camera_get_view_x(view_camera[0])-camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0])-camera_get_view_height(view_camera[0]),camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0]),false);
draw_set_alpha(1);

//draw death screen
draw_sprite(spr_deathscreen_bg,0,x,y);
if win = false {
	draw_sprite(spr_deathscreen_buttons,select_x,x,y);
}else {
	draw_sprite(spr_deathscreen_buttons,3,x,y);
}
scr_Death_Screen(win);

draw_set_color(c_white);