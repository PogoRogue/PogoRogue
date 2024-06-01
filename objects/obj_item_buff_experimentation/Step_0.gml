/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.experimentation = 1 {
	item_tagline = "Replacing an active item or weapon also gives you 2 hearts.";
}else if global.experimentation = 2 {
	item_tagline = "Replacing an active item or weapon also gives you 3 hearts.";
}else if global.experimentation = 3 {
	item_tagline = "Replacing an active item or weapon also gives you 4 hearts.";
}else if global.experimentation = 4 {
	item_tagline = "Replacing an active item or weapon also gives you 5 hearts.";
}