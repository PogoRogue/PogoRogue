image_speed = 0;
follow_player = true;
buff = obj_player.buff_recycling;
item_name = "Recycling";
item_tagline = "Discarding an item gives you 25% of the discarded item's cost in return."
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}