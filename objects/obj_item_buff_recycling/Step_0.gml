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
	item_tagline = "Replacing an item gives you 50% of the replaced item's cost in return.";
}else if global.recycling = 2 or image_index = 4 {
	item_tagline = "Replacing an item gives you 75% of the replaced item's cost in return.";
}else if global.recycling = 3 or image_index = 6 {
	item_tagline = "Replacing an item gives you 100% of the replaced item's cost in return.";
}