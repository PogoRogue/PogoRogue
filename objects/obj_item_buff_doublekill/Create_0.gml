image_speed = 0;
follow_player = true;
buff = obj_player.buff_doublekill;
item_name = "Double Kill";
item_tagline = "If your combo is above 10, each kill is worth 2 for kill cooldowns.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 40;
max_uses = 3;
item_stats = "";

if obj_player.double_kill = 1 {
	item_name = "Triple Kill";
	item_tagline = "If your combo is above 10/20, each kill is worth 2/3 for kill cooldowns.";
}else if obj_player.double_kill >= 2 {
	item_name = "Quadruple Kill";
	item_tagline = "If your combo is above 10/20/30, each kill is worth 2/3/4 for kill cooldowns.";
}

scr_Buff_Stats();

if obj_player.double_kill < max_uses {
	image_index = obj_player.double_kill*2;
}else {
	image_index = (max_uses-1)*2;
}

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}