draw_set_color(make_color_rgb(242,240,229));
draw_set_alpha(alpha);
if global.flash = true {
	draw_rectangle(0,0,camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]),false);
}
draw_set_color(c_white);
draw_set_alpha(1);