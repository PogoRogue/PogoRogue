//randomize()
image_angle = random_range(0,360);
vspeed = random_range(2,3);
hspeed = 0;
bounces_left = 3;
bounced = false;
init_speed = speed;
damaged = false;
alarm[1] = 120;
exploded = false;

randomize();
exploding_chance = irandom_range(1,100);
random_set_seed(global.seed);