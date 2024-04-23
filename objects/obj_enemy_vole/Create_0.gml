/// @description Instantiate variables

// Inherit the parent event
event_inherited();

hp_max = 40;
depth = 5;
parent = noone; // Will be set on creation to/by the obj_enemy_whack_a_vole
player = instance_find(obj_player, 0);
dist_to_player = distance_to_object(player);
range = 250;
can_see_player = dist_to_player < range;
