/// @description Shotgun
// You can write your code in this editor

// Inherit the parent event
event_inherited();
amount=5;
spread=40;
repeats=0;
delay=room_speed;
sprite=spr_projectile_nerfdart;
spd=7;
track_player = true;

player = instance_nearest(x,y,obj_player);
dir_central = point_direction(x, y, player.x, player.y);
