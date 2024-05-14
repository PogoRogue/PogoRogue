/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if sprite_index = spr_B1_Shield_Drop {
	draw_sprite_ext(spr_B1_Shield_Drop_red,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,red_alpha);
}else if sprite_index = spr_B1_Shield_Move {
	draw_sprite_ext(spr_B1_Shield_Move_red,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,red_alpha);
}