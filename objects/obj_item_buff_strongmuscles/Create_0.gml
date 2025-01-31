image_speed = 0;
follow_player = true;
buff = obj_player.buff_strongmuscles;
item_name = "强健体魄";
item_tagline = "打出的弹药可以飞的\n更远";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 30;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}