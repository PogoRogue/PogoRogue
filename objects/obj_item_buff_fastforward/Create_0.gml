image_speed = 0;
follow_player = true;
buff = obj_player.buff_fastforward;
item_name = "Fast Forward";
item_tagline = "Every kill, cut 1s off of time-based cooldowns. ";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 40;
max_uses = 3;
item_stats = "";

if global.fast_forward = 1 {
	item_tagline = "Every kill, cut 2s off of time-based cooldowns. ";
}else if global.fast_forward = 2 {
	item_tagline = "Every kill, cut 3s off of time-based cooldowns. ";
}

scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}