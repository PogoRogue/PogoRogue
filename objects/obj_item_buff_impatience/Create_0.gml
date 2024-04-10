follow_player = true;
buff = obj_player.buff_impatience;
item_name = "Impatience";
item_tagline =  "Reduce all active item cooldown times by 25%. Reduce bounce/kill cooldowns by 1.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}