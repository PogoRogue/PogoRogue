/// @description missle
// You can write your code in this editor

// Inherit the parent event
event_inherited();
repeats=2;
delay=room_speed*1;
player= instance_nearest(x,y,obj_player);
dir_central=point_direction(x,y,player.x,player.y);