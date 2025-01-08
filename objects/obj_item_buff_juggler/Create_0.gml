image_speed = 0;
follow_player = true;
buff = obj_player.buff_juggler;
item_name = "杂耍艺人";
item_tagline = "如果两把武器弹药全部\n耗尽，重新填装那把未\n装备的武器"
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 40;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}