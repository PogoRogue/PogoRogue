follow_player = true;
buff = obj_player.buff_armor;
item_name = "白心";
item_tagline = "增加一颗白心（最多5颗）";
item_description = item_tagline;
add_sprite_to_list = false;
item_cost = 15;
max_uses = 5;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	//scr_Buff_Replace();
}

if obj_player.armor_buff >= obj_player.max_armor_buff {
	sold_out = true;
}else {
	sold_out = false;	
}