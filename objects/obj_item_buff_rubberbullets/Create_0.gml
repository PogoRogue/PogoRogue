follow_player = true;
buff = obj_player.buff_bouncybullets;
item_name = "Rubber Bullets";
item_tagline = "Adds 1 bounce to every bullet.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 40;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}