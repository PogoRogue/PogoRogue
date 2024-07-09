/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if obj_player.double_kill < max_uses {// and salesman = false {
	image_index = obj_player.double_kill*2 + index_add;
}else if salesman = false {
	image_index = (max_uses-1)*2;
}else {
//	image_index = obj_player.double_kill*2 + index_add;
}

if obj_player.double_kill = 1 or image_index = 2 {
	item_name = "Triple Kill";
	item_tagline = "If your combo is above 10/20, each kill is worth 2/3 for kill cooldowns.";
}else if obj_player.double_kill >= 2 or image_index = 4 {
	item_name = "Quadruple Kill";
	item_tagline = "If your combo is above 10/20/30, each kill is worth 2/3/4 for kill cooldowns.";
}