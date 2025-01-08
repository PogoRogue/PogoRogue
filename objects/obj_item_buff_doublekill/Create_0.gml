image_speed = 0;
follow_player = true;
buff = obj_player.buff_doublekill;
item_name = "双杀";
item_tagline = "若连击数在10以上, 你在连击条消耗时的每个\n击杀都算做2个.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 40;
max_uses = 3;
item_stats = "";
index_add = 0; //declare this variable when there are multiple sprites for this item

if obj_player.double_kill = 1 {
	item_name = "双杀";
	item_tagline = "若连击数在10以上, 你在连击条消耗时的每个\n击杀都算做2个.";
}else if obj_player.double_kill >= 2 {
	item_name = "双杀";
	item_tagline = "若连击数在10以上, 你在连击条消耗时的每个\n击杀都算做2个.";
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