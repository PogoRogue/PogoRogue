follow_player = true;
buff = obj_player.buff_portablecharger;
item_name = "充电宝";
item_tagline = "未装备的物品的冷却\n仍会减少";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}