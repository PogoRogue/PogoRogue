follow_player = true;
buff = obj_player.buff_laststand;
item_name = "背水一战";
item_tagline = "当只剩下1颗红心时, \n造成的伤害翻倍";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 25;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}