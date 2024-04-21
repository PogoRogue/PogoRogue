spr_image_speed = 0;
follow_player = true;
buff = obj_player.buff_experimentation;
item_name = "Experimenting";
item_tagline = "Replacing an active item or weapon also heals a missing heart."; //+ string(global.experimentation_coins) + " coins in return.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}