image_speed = 0;
follow_player = true;
buff = obj_player.buff_fastforward;
item_name = "两极反转";
item_tagline = "每次击败敌人可减少物\n品的【时间冷却】1秒";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 40;
max_uses = 3;
item_stats = "";

if global.fast_forward = 1 {
	item_tagline = "每次击败敌人可减少物\n品的【时间冷却】1秒";
}else if global.fast_forward = 2 {
	item_tagline = "每次击败敌人可减少物\n品的【时间冷却】1秒";
}

scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}