image_speed = 0;
follow_player = true;
buff = obj_player.buff_righteousrevenge;
item_name = "正当防卫";
item_tagline = "受伤后你造成的伤害将\n短暂翻倍";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 30;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}