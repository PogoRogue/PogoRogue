image_speed = 0;
follow_player = true;
buff = obj_player.buff_crit;
item_name = "Crit Chance Up";
item_tagline = "Your projectiles have a 5% chance of dealing a critical hit." //"Discarding an item gives you 25% of the discarded item's cost in return."
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 30;
max_uses = 4;
item_stats = "";
index_add = 0; //declare this variable when there are multiple sprites for this item

if global.critchance = 1 {
	item_tagline = "Your projectiles have a 10% chance of dealing a critical hit.";
}else if global.critchance = 2 {
	item_tagline = "Your projectiles have a 15% chance of dealing a critical hit.";
}else if global.critchance = 3 {
	item_tagline = "Your projectiles have a 20% chance of dealing a critical hit.";
}else if global.critchance = 4 {
	item_tagline = "Your projectiles have a 25% chance of dealing a critical hit.";
}


scr_Buff_Stats();

if global.critchance < max_uses {
	image_index = global.critchance*2 + index_add;
}else {
	image_index = (max_uses-1)*2;
}


if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}