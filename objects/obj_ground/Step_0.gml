//only draw if in frame to reduce lags
if (distance_to_object(obj_player) < 96) {
	//create collision walls
	if created_walls = false {
		scr_Create_Collision_Walls();
		created_walls = true;
	}
}else {
	created_walls = false;
}


/*
if drawn_tiles = false and room = room_gameplay_video {
	drawn_tiles = true;
	//set tiles
	if image_xscale != 1 or image_yscale != 1 {
		sprite_index = spr_nothing;
		mask_index = spr_blacksquare;
		
		for (xx = 0; xx < abs(image_xscale); xx++) {
			for (yy = 0; yy < abs(image_yscale); yy++) {
				scr_Draw_Tiles(x + xx*16*sign(image_xscale), y + yy*16*sign(image_yscale), 16,global.tileset,obj_ground);
				tilemap_set_at_pixel(global.tilemap_ground, tile_frame, x + xx*16*sign(image_xscale), y + yy*16*sign(image_yscale));
			}	
		}
	}
}