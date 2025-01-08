follow_player = true;
buff = obj_player.buff_lasersight;
item_name = "红外瞄准";
item_tagline = "视觉瞄准辅助";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 20;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}