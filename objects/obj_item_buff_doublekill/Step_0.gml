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
	item_name = "双杀";
	item_tagline = "若连击数在10以上,\n你在连击条消耗时的\n每个击杀都算做2个.";
}else if obj_player.double_kill >= 2 or image_index = 4 {
	item_name = "双杀";
	item_tagline = "若连击数在10以上,\n你在连击条消耗时的\n每个击杀都算做2个.";
}