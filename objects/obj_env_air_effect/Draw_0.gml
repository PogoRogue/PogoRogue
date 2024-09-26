/// @description draw self
draw_self();
//overlap same sprite to be more visible
draw_sprite_ext(sprite_index,image_index+2,x + lengthdir_x(2,image_angle),y + lengthdir_y(2,image_angle),image_xscale,image_yscale,image_angle,c_white,image_alpha);
draw_sprite_ext(sprite_index,image_index+4,x + lengthdir_x(4,image_angle),y + lengthdir_y(4,image_angle),image_xscale,image_yscale,image_angle,c_white,image_alpha);
draw_sprite_ext(sprite_index,image_index+8,x + lengthdir_x(6,image_angle),y + lengthdir_y(6,image_angle),image_xscale,image_yscale,image_angle,c_white,image_alpha);
draw_sprite_ext(sprite_index,image_index+6,x + lengthdir_x(8,image_angle),y + lengthdir_y(8,image_angle),image_xscale,image_yscale,image_angle,c_white,image_alpha);
