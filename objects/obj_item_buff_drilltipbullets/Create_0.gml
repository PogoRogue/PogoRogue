image_speed = 0;
follow_player = true;
buff = obj_player.buff_drilltipbullets;
item_name = "Drill Tip Bullets";
item_tagline = "All bullets now pass through the ground.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 20;
max_uses = 5;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}