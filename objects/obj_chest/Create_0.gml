/// @description create collision walls

randomize();
open = false;
colliding = false; //is the player currently colliding with the chest
create_coins = false;
num_of_coins = irandom_range(min_num_of_coins,max_num_of_coins); //created in variable definitions tab
allow_projectile_collision = false;
image_index = 0;