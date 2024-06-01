spr_image_speed = 0;
follow_player = true;
buff = obj_player.buff_experimentation;
item_name = "Experimenting";
item_tagline = "Replacing an active item or weapon also gives you 1 heart."; //+ string(global.experimentation_coins) + " coins in return.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 35;
max_uses = 5;
item_stats = "";

if global.experimentation = 1 {
	item_tagline = "Replacing an active item or weapon also gives you 2 hearts.";
}else if global.experimentation = 2 {
	item_tagline = "Replacing an active item or weapon also gives you 3 hearts.";
}else if global.experimentation = 3 {
	item_tagline = "Replacing an active item or weapon also gives you 4 hearts.";
}else if global.experimentation = 4 {
	item_tagline = "Replacing an active item or weapon also gives you 5 hearts.";
}

scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}