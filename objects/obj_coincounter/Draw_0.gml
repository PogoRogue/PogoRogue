if obj_player.state != obj_player.state_blink and obj_player.state != obj_player.state_portal and obj_player.state != obj_player.state_shop_portal {

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_combo2);

var white = make_color_rgb(255,255,255);

if global.combo > 0 {
	with obj_player {
		if room != room_boss_1 and room != room_boss_2 and room != room_boss_3 {
			var distance = 48;
			distance += obj_player.combo_offset;
			
			if instance_exists(obj_shieldbubble) {
				distance += 12; //8
			}else if pickups_array[0] = pickup_hatgun or pickups_array[1] = pickup_hatgun 
			or pickups_array[0] = pickup_grappling or pickups_array[1] = pickup_grappling { 
				distance += 20;
			}

			//text
			white = make_color_rgb(242,240,229);
			draw_set_color(white);
			scr_Draw_Coins(distance+28);
		}else {
			var distance = 52;
			distance += obj_player.combo_offset;
			
			if instance_exists(obj_shieldbubble) {
				distance += 12;
			}else if pickups_array[0] = pickup_hatgun or pickups_array[1] = pickup_hatgun 
			or pickups_array[0] = pickup_grappling or pickups_array[1] = pickup_grappling { 
				distance += 20;
			}
			
			scr_Draw_Coins(distance); //8
		}
	}
}else {
	with obj_player {
		var distance = 54;
		distance += obj_player.combo_offset;
		if pickups_array[0] = pickup_hatgun or pickups_array[1] = pickup_hatgun 
		or pickups_array[0] = pickup_grappling or pickups_array[1] = pickup_grappling { 
			distance += 20;
		}
		if instance_exists(obj_shieldbubble) {
			distance += 14; //10
		}
		scr_Draw_Coins(distance);
	}
}

draw_set_color(c_white);
}