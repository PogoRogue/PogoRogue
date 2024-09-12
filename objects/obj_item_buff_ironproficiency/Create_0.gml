follow_player = true;
buff = obj_player.buff_ironproficiency;
item_name = "Iron Proficiency";
item_tagline = "If your health bar is full, excess healing becomes an armored heart.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 25;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}