follow_player = true;
buff = obj_player.buff_sharpshooter;
item_name = "神枪手";
item_tagline = "你开出的第一枪造成\n更多伤害";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 25;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}