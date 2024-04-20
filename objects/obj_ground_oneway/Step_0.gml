//draw tiles (proc gen)
if (instance_exists(obj_proc_gen_controller) || instance_exists(obj_sprite_test_room_generator)) and object_get_name(object_index) = "obj_ground_oneway" {
	if drawn_tiles = false and distance_to_object(obj_player) < 500 {
		for(i=0;i<abs(image_xscale);i++) {
			tilemap_set_at_pixel(global.tilemap_ground, tile_frame[i], xx[i]*sign(image_xscale), y);
		}
	}
}