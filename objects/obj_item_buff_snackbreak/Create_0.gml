image_speed = 0;
follow_player = true;
buff = obj_player.buff_snackbreak;
item_name = "蛋白棒";
item_tagline = "在每关和boss战开始时回\n复一颗红心";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 40;
max_uses = 3;
item_stats = "";
index_add = 0; //declare this variable when there are multiple sprites for this item

if global.snackbreak_num = 1 {
	item_tagline = "在每关和boss战开始时回\n复一颗红心";
}else if global.snackbreak_num >= 2 {
	item_tagline = "在每关和boss战开始时回\n复一颗红心";
}

scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}