y += 16;
instance_create_depth(x+64,y-64,depth-1,obj_salesman);
colliding = false;
being_used = false;
created_items = true;
usable = false;
alarm[0] = 1;

random_set_seed(global.seed+global.salesman_number);

buff_1 = obj_item_buff_lasersight;
buff_2 = obj_item_buff_planetarybullets;
buff_3 = obj_item_buff_armor;
buff_3_number = choose(2,2,2,2,2,2,2+sign(global.luck),3,3+sign(global.luck),4);

buff_selected = 0;
passives_array = [noone,noone,noone];
passives_array_x = [x-30,x,x+30];
selected_x = false;
alarm2_time = 30;
all_out = false;
in_air = false;

random_set_seed(global.seed);