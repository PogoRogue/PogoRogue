/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

sprite_index = spr_enemy_jack_actives;
open_sprite = spr_enemy_jack_actives_open;

random_set_seed(global.seed+global.enemy_number);
heart_chance = 0;
buff_chance = 0;
weapon_chance = 0;
pickup_chance = 100;

random_items = scr_Random_Item_Drops();
random_set_seed(global.seed);