/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

sprite_index = spr_enemy_jack_coin;
open_sprite = spr_enemy_jack_coin_open;


random_set_seed(global.seed + global.enemy_number);

enemy_coin_bonus = irandom_range(10,20);
global.coin_chest_num += 1;

heart_chance = 0;
buff_chance = 0;
weapon_chance = 0;
pickup_chance = 0;

random_items = scr_Random_Item_Drops();

random_set_seed(global.seed);
