/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

spread = 0;
amount = 1;
repeats = 20;
delay = 1;
player = instance_nearest(x, y, obj_player);
time = 0;
down_spd = 0;
parent = noone;

projectile_sprite = spr_enemy_projectile_slime;

show_debug_message("pattern");