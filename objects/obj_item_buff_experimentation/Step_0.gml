/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.experimentation < max_uses {
	image_index = global.experimentation*2 + index_add;
}else {
	image_index = (max_uses-1)*2;
}

if global.experimentation = 1 or image_index = 2 {
	item_tagline = "替换手中的武器或者物\n品时，回复一颗红心。";
}else if global.experimentation = 2 or image_index = 4 {
	item_tagline = "替换手中的武器或者物\n品时，回复一颗红心。";
}else if global.experimentation = 3 or image_index = 6 {
	item_tagline = "替换手中的武器或者物\n品时，回复一颗红心。";
}else if global.experimentation = 4  or image_index = 8 {
	item_tagline = "替换手中的武器或者物\n品时，回复一颗红心。";
}