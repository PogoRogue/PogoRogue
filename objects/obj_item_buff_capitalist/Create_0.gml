image_speed = 0;
follow_player = true;
buff = obj_player.buff_capitalist;
item_name = "Capitalist";
item_tagline = "If you have more than 200 coins, deal 0.5% more weapon damage for every coin above 200.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 30;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}