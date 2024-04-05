follow_player = true;
buff = obj_player.buff_pickybuyer;
item_name = "Picky Buyer";
item_tagline = "Your next shop refresh is free.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 0;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}