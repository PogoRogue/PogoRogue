image_speed = 0;
follow_player = true;
buff = obj_player.buff_crit;
item_name = "暴击";
item_tagline = "增加暴击几率" //"Discarding an item gives you 25% of the discarded item's cost in return."
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 25;
max_uses = 4;
item_stats = "";
index_add = 0; //declare this variable when there are multiple sprites for this item

if global.critchance = 1 {
	item_tagline = "增加暴击几率";
}else if global.critchance = 2 {
	item_tagline = "增加暴击几率";
}else if global.critchance = 3 {
	item_tagline = "增加暴击几率";
}else if global.critchance = 4 {
	item_tagline = "增加暴击几率";
}


scr_Buff_Stats();

if global.critchance < max_uses {
	image_index = global.critchance*2 + index_add;
}else {
	image_index = (max_uses-1)*2;
}


if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}