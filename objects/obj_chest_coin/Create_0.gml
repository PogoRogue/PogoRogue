/// @description Inherit the parent event
event_inherited();

num_of_coins = irandom_range(min_num_of_coins,max_num_of_coins);

heart_chance = 0;
buff_chance = 0;
weapon_chance = 0;
pickup_chance = 0;

random_items = scr_Random_Item_Drops()