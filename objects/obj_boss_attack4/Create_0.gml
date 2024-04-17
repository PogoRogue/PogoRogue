/// @description Laser
// You can write your code in this editor

// Inherit the parent event
event_inherited();
amount=1;
repeats=4;
spd=10;
delay=room_speed/4;
sprite=spr_projectile_default;
player=instance_nearest(x,y,obj_player);

dir_central = point_direction(x, y, player.x, player.y);