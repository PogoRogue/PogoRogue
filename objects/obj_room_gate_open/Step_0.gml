/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if closed = false and (obj_player.y < y - 1 or obj_player.x < x and obj_player.y < y or obj_player.x > x + sprite_width and obj_player.y < y) {
	closed = true;	
	image_speed = -1;
	mask_index = spr_gate_close_new;
}

if floor(image_index) <= 1 {
	image_index = 0;
	image_speed = 0;
}