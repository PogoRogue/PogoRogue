follow_player = true;
buff = obj_player.buff_invincibilityup;
item_name = "无敌帧";
item_tagline = "受伤时的无敌时间短暂延长";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 25;
max_uses = 0;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}