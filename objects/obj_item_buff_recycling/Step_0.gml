/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.recycling < max_uses {
	image_index = global.recycling*2 + index_add;
}else {
	image_index = (max_uses-1)*2;
}

if global.recycling = 1 or image_index = 2 {
	item_tagline = "回收一个物品，然后\n会给你返还少量\n的金币";
}else if global.recycling = 2 or image_index = 4 {
	item_tagline = "回收一个物品，然后\n会给你返还少量\n的金币";
}else if global.recycling = 3 or image_index = 6 {
	item_tagline = "回收一个物品，然后\n会给你返还少量\n的金币";
}