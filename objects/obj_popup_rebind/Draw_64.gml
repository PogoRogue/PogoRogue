/// @description draw self

var xx = camera_get_view_width(view_camera[0])/2;
var yy = camera_get_view_height(view_camera[0])/2;
draw_sprite_ext(sprite_index,image_index,xx,yy,1,1,0,c_white,alpha);

if (image_index = 0) {

	if old_text = "" {
		draw_sprite_ext(old_button_sprite,0,xx-13-(sprite_get_width(old_button_sprite)/2),yy+17,1,1,0,c_white,alpha);
	}

	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo2);
	var white = make_color_rgb(242,240,229);
	draw_text_color(xx-13,yy+17,old_text,white,white,white,white,alpha);

	draw_sprite_ext(spr_arrow_right_long,0,xx,yy+17,1,1,0,c_white,alpha);

	if text = "" {
		draw_sprite_ext(button_sprite,0,xx+13+(sprite_get_width(button_sprite)/2),yy+17,1,1,0,c_white,alpha);
	}

	draw_set_halign(fa_left);
	draw_text_color(xx+13,yy+17,text,white,white,white,white,alpha);
	draw_set_color(c_white);

}