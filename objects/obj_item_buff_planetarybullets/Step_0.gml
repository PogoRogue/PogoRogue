/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if obj_player.planetary_bullets < max_uses and salesman = false {
	image_index = obj_player.planetary_bullets*2 + index_add;
}else if salesman = false {
	image_index = (max_uses-1)*2;
}else {
	image_index = obj_player.planetary_bullets*2 + index_add;
}