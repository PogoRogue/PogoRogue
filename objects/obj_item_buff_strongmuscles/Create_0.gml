image_speed = 0;
follow_player = true;
buff = obj_player.buff_strongmuscles;
item_name = "Strong Muscles";
item_tagline = "Limited-range projectiles now travel further.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 30;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}