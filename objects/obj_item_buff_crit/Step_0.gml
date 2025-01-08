/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.critchance < max_uses {
	image_index = global.critchance*2 + index_add;
}else {
	image_index = (max_uses-1)*2;
}

if global.critchance = 1 or image_index = 2 {
	item_tagline = "增加暴击几率";
}else if global.critchance = 2 or image_index = 4 {
	item_tagline = "增加暴击几率";
}else if global.critchance = 3 or image_index = 6 {
	item_tagline ="增加暴击几率";
}else if global.critchance = 4 or image_index = 8 {
	item_tagline ="增加暴击几率";
}