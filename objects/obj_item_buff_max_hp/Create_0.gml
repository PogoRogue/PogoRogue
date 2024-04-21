follow_player = true;
buff = obj_player.buff_max_hp;
item_name = "Heart Container";
item_tagline = "Increases the player's max HP by 1 heart up to a max of 10.";
item_description = item_tagline;
add_sprite_to_list = false;
item_cost = 50;
max_uses = 5;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}

if obj_player.max_hp >= obj_player.max_max_hp {
	sold_out = true;
}else {
	sold_out = false;
}