/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.aura_num = 1 {
	item_tagline = "Enemies in combat rooms begin with 40% less health.";
}else if global.aura_num >= 2 {
	item_tagline = "Enemies in combat rooms begin with 60% less health.";
}