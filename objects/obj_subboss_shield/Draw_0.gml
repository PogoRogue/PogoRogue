/// @description Insert description here
// You can write your code in this editor

//laser
if !is_dead and room = room_boss_1 {
	var red = make_color_rgb(180,82,82);
	draw_set_alpha(laser_alpha);
	draw_line_width_color(x+lengthdir_x(0,image_angle+90),y+lengthdir_y(0,image_angle+90),x+lengthdir_x(2500,image_angle+90),y+lengthdir_y(2500,image_angle+90),2,red,red);
	draw_set_alpha(1);
}

// Inherit the parent event
event_inherited();

if sprite_index = spr_B1_Shield_Drop {
	draw_sprite_ext(spr_B1_Shield_Drop_red,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,red_alpha);
}else if sprite_index = spr_B1_Shield_Move {
	draw_sprite_ext(spr_B1_Shield_Move_red,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,red_alpha);
}