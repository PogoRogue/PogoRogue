if room = room_shop {
	if object_get_sprite(object_index) != -1 {
		draw_self();
		if ((global.num_of_coins < item_cost * global.sale) or (sold_out = true)) and room = room_shop {
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,0.75);	
			draw_set_color(c_white);
		}
	}
}else if created_in_room = false or salesman = true {
	if object_get_sprite(object_index) != -1 {
		draw_self();
	}
}

//salesman
if salesman = true and created_in_room = true {
	draw_set_font(fnt_itemdescription2);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	if global.num_of_coins >= item_cost and sold_out = false {
		scr_Draw_Text_Outlined(x,y-10,item_cost,make_color_rgb(237,225,158));
	}else {
		scr_Draw_Text_Outlined(x,y-10,item_cost,make_color_rgb(180,82,82));
	}
}

if room != init_room and salesman = true and room != room_shop {
	instance_destroy();
}

draw_set_color(c_white);