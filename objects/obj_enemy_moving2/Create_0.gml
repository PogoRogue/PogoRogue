/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 14; 
hp_max = hp;
hp_percent = (hp / hp_max) * 100;

firing = false;
firing_cooldown = false;

walk_sprite = spr_walk_enemy_walk_1;
idle_sprite = spr_walk_enemy_idle_1;

draw_laser = false;
laser_alpha = 0;

dist_to_wall = 0;

