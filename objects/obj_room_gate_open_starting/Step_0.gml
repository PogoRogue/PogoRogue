/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if scr_Animation_Complete() and image_speed = 1 {
	image_speed = 0;	
	image_index = sprite_get_number(sprite_index)-1;
}

if floor(image_index) <= 1 and image_speed = -1 {
	image_index = 0;
	image_speed = 0;
}