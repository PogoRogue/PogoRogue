/// @description create collision walls

//randomize();
random_set_seed(global.seed+global.chest_number);
open = false;
colliding = false; //is the player currently colliding with the chest
create_coins = false;
num_of_coins = irandom_range(min_num_of_coins,max_num_of_coins); //created in variable definitions tab
coins_increased = false;
allow_projectile_collision = false;
image_index = 0;
image_speed = 0;
mask_index = spr_treasurechest_new_mask;

//drop chances
heart_chance = 50 - global.luck;
buff_chance = 90;
weapon_chance = 60 + global.luck;
pickup_chance = 60 + global.luck;
destroy_chance = 0; //when active, change to ~80

created_items = false;

destroy = irandom_range(1,100);

global.chest_number += 1;

//Alarm here to allow repositioning of chests. Chest type replacement code moved to alarm 2
alarm[2] = 1;

random_set_seed(global.seed);