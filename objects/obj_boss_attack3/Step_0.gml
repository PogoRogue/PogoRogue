/// @description Insert description here
// You can write your code in this editor

// Track the player
dir_central = point_direction(x, y, player.x, player.y);

if(parent != noone) {
    x = parent.x + lengthdir_x(48, parent.image_angle);
    y = parent.y + lengthdir_y(48, parent.image_angle);
	image_angle = parent.image_angle;
}
