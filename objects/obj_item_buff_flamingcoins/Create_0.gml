follow_player = true;
buff = obj_player.buff_flamingcoins;
item_name = "Flaming Coins";
item_tagline = "Coins damage enemies on contact.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 20;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}