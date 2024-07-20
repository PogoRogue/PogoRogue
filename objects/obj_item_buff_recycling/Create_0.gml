image_speed = 0;
follow_player = true;
buff = obj_player.buff_recycling;
item_name = "Recycling";
item_tagline = "Replacing an item gives you 25% of the replaced item's cost in return." //"Discarding an item gives you 25% of the discarded item's cost in return."
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 4;
item_stats = "";
index_add = 0; //declare this variable when there are multiple sprites for this item

if global.recycling = 1 {
	item_tagline = "Replacing an item gives you 50% of the replaced item's cost in return.";
}else if global.recycling = 2 {
	item_tagline = "Replacing an item gives you 75% of the replaced item's cost in return.";
}else if global.recycling = 3 {
	item_tagline = "Replacing an item gives you 100% of the replaced item's cost in return.";
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