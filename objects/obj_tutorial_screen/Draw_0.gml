draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_item_popup);
draw_set_alpha(image_alpha);

draw_self();

draw_sprite(animation_sprite,animation_frame,x,y);

if changesprite = true or changesprite_frame > 0 {
	draw_sprite(spr_tutorial_off,changesprite_frame,x,y);
}

draw_set_alpha(1);
draw_set_color(c_white);