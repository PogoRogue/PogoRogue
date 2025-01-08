follow_player = true;
buff = obj_player.buff_pickybuyer;
item_name = "精挑细选";
item_tagline = "下次商店刷新免费";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 0;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}