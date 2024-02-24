if room = room_shop {
	if object_get_sprite(object_index) != -1 {
		draw_self();
		if (global.num_of_coins < item_cost * global.sale) or (sold_out = true) {
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,0.75);	
		}
	}
}else {
	if object_get_sprite(object_index) != -1 {
		draw_self();
	}
}
draw_set_color(c_white);