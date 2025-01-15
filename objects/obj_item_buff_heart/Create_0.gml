follow_player = false;
buff = obj_player.buff_heart;
item_name = "红心";
item_tagline = "回复失去的1颗红心";
item_description = item_tagline;
add_sprite_to_list = false;
item_cost = 25;
max_uses = 0;
item_stats = "";

if scr_In_Array(global.all_buffs, object_index) {
	//scr_Buff_Replace();
}

if obj_player.hp >= obj_player.max_hp {
	sold_out = true;
}else {
	sold_out = false;	
}