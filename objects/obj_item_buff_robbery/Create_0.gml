image_speed = 0;
follow_player = true;
buff = obj_player.buff_robbery;
item_name = "Robbery";
item_tagline = "You earn twice as much coins if you kill an enemy by landing on them.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}