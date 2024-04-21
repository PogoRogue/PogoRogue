follow_player = false;
buff = obj_player.buff_heart;
item_name = "Heart";
item_tagline = "Heal a missing heart.";
item_description = item_tagline;
add_sprite_to_list = false;
item_cost = 25;
max_uses = 0;
item_stats = "";

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}

if obj_player.hp >= obj_player.max_hp {
	sold_out = true;
}else {
	sold_out = false;	
}