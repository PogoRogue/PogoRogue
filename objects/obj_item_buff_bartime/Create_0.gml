follow_player = true;
buff = obj_player.buff_bartime;
item_name = "内存条";
item_tagline = "全部带条类的物品都获\n得增长";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 40;
max_uses = 4;
item_stats = "";
index_add = 0; //declare this variable when there are multiple sprites for this item

if global.bartime = 50 {
	item_tagline = "全部带条类的物品都获\n得增长";
}else if global.bartime = 75 {
	item_tagline = "全部带条类的物品都获\n得增长";
}else if global.bartime = 100 {
	item_tagline = "全部带条类的物品都获\n得增长";
}

scr_Buff_Stats();

if global.bartime < 100 {
	image_index = ((global.bartime-25)/25)*2 + index_add;
}else {
	image_index = (max_uses-1)*2;
}

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}