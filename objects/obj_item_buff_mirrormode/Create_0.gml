image_speed = 0;
follow_player = true;
buff = obj_player.buff_mirrormode;
item_name = "镜面反射";
item_tagline = "生命值低时免疫激光伤害";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 40;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}