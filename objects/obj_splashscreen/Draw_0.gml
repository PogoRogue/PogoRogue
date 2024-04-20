draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_item_popup);

if splash_num = 1 {
	draw_sprite_ext(spr_utah,0,384,216,2,2,0,c_white,alpha);
}else if splash_num = 2 {
	draw_set_alpha(alpha);
	draw_text(384,216,"Bounce Back Games");
}else if splash_num >= 3 {
	draw_set_alpha(alpha);
	draw_text(384,216,"Controller Recommended");
}

draw_set_alpha(1);