background_map = ds_map_create();

background_map[? layer_get_id("bg_background")] = 0.6;
background_map[? layer_get_id("bg_midground")] = 0.4;
background_map[? layer_get_id("bg_foreground")] = 0.2;