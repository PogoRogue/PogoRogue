/// @description Instantiate variables

boss = instance_nearest(x, y, obj_boss_marionette);
parent = instance_nearest(x, y, obj_boss_marionette_arm);
target = instance_nearest(x, y, obj_player);
//1=pistol
//2=slime
//3=Javalin
//4=Bouncy
//5=Missle
//6=Bubble
//7=Boomerang
//8=Grenade
weapon=1;
cooldown=room_speed*3;
alarm_set(1,cooldown);
player = instance_find(obj_player, 0);