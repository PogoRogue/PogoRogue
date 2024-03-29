/// @description Instantiate variables
//This is a duplication of obj_enemy_moving but inherit from exploding enemy instead of generic.
// Inherit the parent event
event_inherited();

// Instantiate additional variables
spd = 0.5;
at_edge = false;
at_wall = false;
player = instance_find(obj_player, 0);
aggro_range = 200;
aggro=false;
chase_spd=2;