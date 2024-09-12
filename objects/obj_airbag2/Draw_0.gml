var y_add_range = y_add;
if y_add_range < -4 {
	y_add_range = -4;
}
if y_add_range > 4 {
	y_add_range = 4;
}
draw_sprite(sprite_index,image_index,x,y+y_add);
draw_sprite(spr_airbag_propeller,propeller_index,x,y+y_add);