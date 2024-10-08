/// @description create tile object and create walls

//create 16x16 ground objects to check for collisions and draw tiles 
for(i = 0; i < image_xscale; i++) {
	for(j = 0; j < image_yscale; j++) {
		if !instance_exists(obj_boss_sphere) and room != room_tutorial and room != room_gameplay_video and room != room_boss_1 and room != room_boss_2 {
			instance_create_depth(x+(i*16),y+(j*16),depth-1,obj_ground_tiles);
		}
	}
}

sprite_index = spr_groundInnerColor;
image_index = global.phase - 1;
//create collision walls
scr_Create_Collision_Walls();
created_walls = false;

drawn_tiles = false;
tile_frame = 0;
if room != room_tutorial {
	depth += 1000;
}