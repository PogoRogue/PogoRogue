/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.bartime < 100 {
	image_index = ((global.bartime-25)/25)*2 + index_add;
}else {
	image_index = (max_uses-1)*2;
}

if image_index = 2 {
	item_tagline = "Increases the length of all different bar types (Frenzy, 2x Damage, etc.) by 50%.";
}else if image_index = 4 {
	item_tagline = "Increases the length of all different bar types (Frenzy, 2x Damage, etc.) by 75%.";
}else if image_index = 6 {
	item_tagline = "Increases the length of all different bar types (Frenzy, 2x Damage, etc.) by 100%.";
}