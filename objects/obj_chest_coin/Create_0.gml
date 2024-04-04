/// @description Inherit the parent event
event_inherited();
random_set_seed(global.seed+global.coin_chest_num);
num_of_coins = irandom_range(min_num_of_coins,max_num_of_coins);
global.coin_chest_num += 1;
random_set_seed(global.seed);
heart_chance = 0;
buff_chance = 0;
weapon_chance = 0;
pickup_chance = 0;

random_items = scr_Random_Item_Drops()