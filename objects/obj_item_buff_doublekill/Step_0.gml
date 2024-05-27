/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if obj_player.double_kill < max_uses {
	image_index = obj_player.double_kill*2;
}else {
	image_index = (max_uses-1)*2;
}

if obj_player.double_kill = 1 {
	item_name = "Triple Kill";
	item_tagline = "If your combo is above 10/20, each kill is worth 2/3 for kill cooldowns.";
}else if obj_player.double_kill >= 2 {
	item_name = "Quadruple Kill";
	item_tagline = "If your combo is above 10/20/30, each kill is worth 2/3/4 for kill cooldowns.";
}