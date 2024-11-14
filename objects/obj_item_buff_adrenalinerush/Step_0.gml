/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.adrenalinerush = 1 {
	item_tagline = "Taking damage reduces kill cooldowns by 3.";
}else if global.adrenalinerush >= 2 {
	item_tagline = "Taking damage reduces kill cooldowns completely.";
}