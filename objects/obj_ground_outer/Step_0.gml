/// @description create walls
var padding = camera_get_view_width(view_camera[0])/2 + 64;
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

if drawn_tiles = false and distance_to_object(obj_player) < 500 and (instance_exists(obj_proc_gen_controller) || instance_exists(obj_sprite_test_room_generator)) {
	drawn_tiles = true;
	//set tiles
	if image_xscale = 1 and image_yscale = 1 {
		scr_Draw_Tiles(x, y, 16,global.tileset,obj_ground_outer);
		tilemap_set_at_pixel(global.tilemap_ground, tile_frame, x, y);
	}else {
		sprite_index = spr_groundInnerColor;
		image_index = global.phase - 1;
		//only do edges
		for (xx = 0; xx < abs(image_xscale); xx++) {
			scr_Draw_Tiles(x + xx*16, bbox_top,16,global.tileset,obj_ground_outer);
			tilemap_set_at_pixel(global.tilemap_ground, tile_frame, x + xx*16*sign(image_xscale), bbox_top);
			scr_Draw_Tiles(x + xx*16, bbox_bottom-16,16,global.tileset,obj_ground_outer);
			tilemap_set_at_pixel(global.tilemap_ground, tile_frame, x + xx*16*sign(image_xscale), bbox_bottom-16);
		}
		
		for (yy = 0; yy < abs(image_yscale); yy++) {
			scr_Draw_Tiles(bbox_left, y + yy*16,16,global.tileset,obj_ground_outer);
			tilemap_set_at_pixel(global.tilemap_ground, tile_frame, bbox_left, y + yy*16*sign(image_yscale));
			scr_Draw_Tiles(bbox_right-16, y + yy*16,16,global.tileset,obj_ground_outer);
			tilemap_set_at_pixel(global.tilemap_ground, tile_frame, bbox_right-16, y + yy*16*sign(image_yscale));
		}/*
		
		for (xx = 1; xx < abs(image_xscale-1); xx++) {
			for (yy = 1; yy < 2; yy++) {
				scr_Draw_Tiles(x + xx*16, y + yy*16,16,global.tileset,obj_ground_outer);
				tilemap_set_at_pixel(global.tilemap_ground, 2, x + xx*16*sign(image_xscale), y + yy*16*sign(image_yscale));
			}	
		}
		
		for (yy = 1; yy < abs(image_yscale-1); yy++) {
			for (xx = 1; xx < 2; xx++) {
				scr_Draw_Tiles(x + xx*16, y + yy*16,16,global.tileset,obj_ground_outer);
				tilemap_set_at_pixel(global.tilemap_ground, 2, x + xx*16*sign(image_xscale), y + yy*16*sign(image_yscale));
			}	
		}
		*/
		
		for (xx = 1; xx < abs(image_xscale-1); xx++) {
			for (yy = 1; yy < abs(image_yscale-1); yy++) {
				if xx < 2 or yy < 2 or xx >= abs(image_xscale-2) or yy >= abs(image_yscale-2) {
					scr_Draw_Tiles(x + xx*16, y + yy*16,16,global.tileset,obj_ground_outer);
					tilemap_set_at_pixel(global.tilemap_ground, tile_frame, x + xx*16*sign(image_xscale), y + yy*16*sign(image_yscale));
				}else {
					tilemap_set_at_pixel(global.tilemap_ground, 2, x + xx*16*sign(image_xscale), y + yy*16*sign(image_yscale));
				}
			}	
		}
	}
}