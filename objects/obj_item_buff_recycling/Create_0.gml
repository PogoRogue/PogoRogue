image_speed = 0;
follow_player = true;
buff = obj_player.buff_recycling;
item_name = "回收利用";
item_tagline = "回收一个物品，然后会给\n你返还少量的金币" //"Discarding an item gives you 25% of the discarded item's cost in return."
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 25;
max_uses = 4;
item_stats = "";
index_add = 0; //declare this variable when there are multiple sprites for this item

if global.recycling = 1 {
	item_tagline = "回收一个物品，然后会给\n你返还少量的金币";
}else if global.recycling = 2 {
	item_tagline = "回收一个物品，然后会给\n你返还少量的金币";
}else if global.recycling = 3 {
	item_tagline = "回收一个物品，然后会给\n你返还少量的金币";
}

scr_Buff_Stats();

if global.recycling < max_uses {
	image_index = global.recycling*2 + index_add;
}else {
	image_index = (max_uses-1)*2;
}


if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}