/// @description Insert description here
// You can write your code in this editor

if !is_dead { 

	var red = make_color_rgb(180,82,82);
	draw_set_alpha(laser_alpha);
	draw_rectangle_color(x+(12*image_xscale),y-22,x+(dist_to_wall),y-22,red,red,red,red,false);
	draw_set_alpha(1);

}

// Inherit the parent event
event_inherited();

if !is_dead { 
	
	var red = make_color_rgb(180,82,82);
	draw_set_alpha(laser_alpha);
	draw_rectangle_color(x+(12*image_xscale),y-21,x+(dist_to_wall),y-21,red,red,red,red,false);
	draw_set_alpha(1);

}