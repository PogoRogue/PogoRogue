follow_player = true;
buff = obj_player.buff_laststand;
item_name = "Last Stand";
item_tagline = "Doubles all weapon damage when you have one heart left.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 25;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}