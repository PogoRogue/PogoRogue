background_map = ds_map_create();

if global.phase = 2 and room != room_shop or room = room_boss_2 {
	global.tileset = tl_ground2;
	back_id3 = layer_get_id("bg_background3");
	back_id2 = layer_get_id("bg_background2");
	back_id = layer_get_id("bg_background");
	mid_id = layer_get_id("bg_midground");
	fore_id = layer_get_id("bg_foreground");
	back_background3 = layer_background_get_id(back_id3);
	back_background2 = layer_background_get_id(back_id2);
	back_background = layer_background_get_id(back_id);
	mid_background = layer_background_get_id(mid_id);
	fore_background = layer_background_get_id(fore_id);
	layer_background_sprite(back_background3,spr_background_solid2);
	layer_background_sprite(back_background2,spr_background_back2);
	layer_background_sprite(back_background,spr_background_backclouds2);
	layer_background_sprite(mid_background,spr_background_mid2);
	layer_background_sprite(fore_background,spr_background_fore2);
	
	background_map[? layer_get_id("bg_background3")] = 0.8;
	background_map[? layer_get_id("bg_background2")] = 0.7;
	background_map[? layer_get_id("bg_background")] = 0.6;
	background_map[? layer_get_id("bg_midground")] = 0.5;
	background_map[? layer_get_id("bg_foreground")] = 0.4;
}else if global.phase >= 3 and room != room_shop or room = room_boss_3 {
	global.tileset = tl_ground3;
	back_id6 = layer_get_id("bg_background6");
	back_id5 = layer_get_id("bg_background5");
	back_id4 = layer_get_id("bg_background4");
	back_id3 = layer_get_id("bg_background3");
	back_id2 = layer_get_id("bg_background2");
	back_id = layer_get_id("bg_background");
	mid_id = layer_get_id("bg_midground");
	fore_id = layer_get_id("bg_foreground");
	back_background6 = layer_background_get_id(back_id6);
	back_background5 = layer_background_get_id(back_id5);
	back_background4 = layer_background_get_id(back_id4);
	back_background3 = layer_background_get_id(back_id3);
	back_background2 = layer_background_get_id(back_id2);
	back_background = layer_background_get_id(back_id);
	mid_background = layer_background_get_id(mid_id);
	fore_background = layer_background_get_id(fore_id);
	layer_background_sprite(back_background6,spr_background_3_8);
	layer_background_sprite(back_background5,spr_background_3_7);
	layer_background_sprite(back_background4,spr_background_3_6);
	layer_background_sprite(back_background3,spr_background_3_5);
	layer_background_sprite(back_background2,spr_background_3_4);
	layer_background_sprite(back_background,spr_background_3_3);
	layer_background_sprite(mid_background,spr_background_3_2);
	layer_background_sprite(fore_background,spr_background_3_1);
	
	background_map[? layer_get_id("bg_background6")] = 0.8;
	background_map[? layer_get_id("bg_background5")] = 0.75;
	background_map[? layer_get_id("bg_background4")] = 0.7;
	background_map[? layer_get_id("bg_background3")] = 0.65;
	background_map[? layer_get_id("bg_background2")] = 0.6;
	background_map[? layer_get_id("bg_background")] = 0.5;
	background_map[? layer_get_id("bg_midground")] = 0.4;
	background_map[? layer_get_id("bg_foreground")] = 0.3;
}else  {
	
	background_map[? layer_get_id("bg_background3")] = 0.8;
	background_map[? layer_get_id("bg_background2")] = 0.8;
	background_map[? layer_get_id("bg_background")] = 0.6;
	background_map[? layer_get_id("bg_midground")] = 0.4;
	background_map[? layer_get_id("bg_foreground")] = 0.2;
	
}

