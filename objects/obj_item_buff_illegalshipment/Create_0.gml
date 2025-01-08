follow_player = true;
buff = obj_player.buff_illegalshipment;
item_name = "黑货";
item_tagline = "商店将会售卖融合物品";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 45;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}