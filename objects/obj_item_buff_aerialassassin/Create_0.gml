image_speed = 0;
follow_player = true;
buff = obj_player.buff_aerialassassin;
item_name = "飞天刺客";
item_tagline = "在空中击杀 3 名敌人，\n可短暂获得无限弹药 ";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}