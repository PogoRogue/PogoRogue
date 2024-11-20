/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.snackbreak_num = 1 {
	item_tagline = "Heal 2 missing hearts at the beginning of each phase and boss battle.";
}else if global.snackbreak_num >= 2 {
	item_tagline = "Heal 3 missing hearts at the beginning of each phase and boss battle.";
}