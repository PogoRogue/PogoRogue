randomize();
image_index = choose(0,1,2,2,3,3);
image_speed = 0;
x_add = random_range(-2,2);
y_add = random_range(-2,2);
damage = 4-image_index;
alarm[0] = 600;
random_set_seed(global.seed);

instance_create_depth(x+32,y-32,depth+1,obj_snowball_bg);