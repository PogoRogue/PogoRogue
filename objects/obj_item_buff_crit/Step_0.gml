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
	item_tagline = "Your projectiles have a 10% chance of dealing a critical hit.";
}else if global.critchance = 2 or image_index = 4 {
	item_tagline = "Your projectiles have a 15% chance of dealing a critical hit.";
}else if global.critchance = 3 or image_index = 6 {
	item_tagline ="Your projectiles have a 20% chance of dealing a critical hit.";
}else if global.critchance = 4 or image_index = 8 {
	item_tagline ="Your projectiles have a 25% chance of dealing a critical hit.";
}