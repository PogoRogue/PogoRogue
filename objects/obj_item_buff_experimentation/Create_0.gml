spr_image_speed = 0;
follow_player = true;
buff = obj_player.buff_experimentation;
item_name = "替换试验";
item_tagline = "替换手中的武器或者物\n品时，回复一颗红心。"; //+ string(global.experimentation_coins) + " coins in return.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 25;
max_uses = 5;
item_stats = "";
index_add = 0; //declare this variable when there are multiple sprites for this item


if global.experimentation = 1 {
	item_tagline = "替换手中的武器或者物\n品时，回复一颗红心。";
}else if global.experimentation = 2 {
	item_tagline = "替换手中的武器或者物\n品时，回复一颗红心。";
}else if global.experimentation = 3 {
	item_tagline = "替换手中的武器或者物\n品时，回复一颗红心。";
}else if global.experimentation = 4 {
	item_tagline = "替换手中的武器或者物\n品时，回复一颗红心。";
}

scr_Buff_Stats();

if global.experimentation < max_uses {
	image_index = global.experimentation*2 + index_add;
}else {
	image_index = (max_uses-1)*2;
}

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}