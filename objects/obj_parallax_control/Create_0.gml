background_map = ds_map_create();

if global.phase = 2 and room != room_shop {
	global.tileset = tl_ground2;
	back_id = layer_get_id("bg_background");
	mid_id = layer_get_id("bg_midground");
	fore_id = layer_get_id("bg_foreground");
	back_background = layer_background_get_id(back_id);
	mid_background = layer_background_get_id(mid_id);
	fore_background = layer_background_get_id(fore_id);
	layer_background_sprite(back_background,spr_background_solid2);
	layer_background_sprite(mid_background,spr_background_back2);
	layer_background_sprite(fore_background,spr_background_fore2);
}else if global.phase >= 3 and room != room_shop or room = room_boss_3 {
	//phase 3 background code here
	global.tileset = tl_ground2;
	back_id = layer_get_id("bg_background");
	mid_id = layer_get_id("bg_midground");
	fore_id = layer_get_id("bg_foreground");
	back_background = layer_background_get_id(back_id);
	mid_background = layer_background_get_id(mid_id);
	fore_background = layer_background_get_id(fore_id);
	layer_background_sprite(back_background,spr_background_solid2);
	layer_background_sprite(mid_background,spr_background_back2);
	layer_background_sprite(fore_background,spr_background_fore2);
}

background_map[? layer_get_id("bg_background")] = 0.6;
background_map[? layer_get_id("bg_midground")] = 0.4;
background_map[? layer_get_id("bg_foreground")] = 0.2;

