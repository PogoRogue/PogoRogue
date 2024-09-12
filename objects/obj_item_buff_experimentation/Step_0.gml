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
	item_tagline = "Replacing an active item or weapon also gives you 2 hearts.";
}else if global.experimentation = 2 or image_index = 4 {
	item_tagline = "Replacing an active item or weapon also gives you 3 hearts.";
}else if global.experimentation = 3 or image_index = 6 {
	item_tagline = "Replacing an active item or weapon also gives you 4 hearts.";
}else if global.experimentation = 4  or image_index = 8 {
	item_tagline = "Replacing an active item or weapon also gives you 5 hearts.";
}