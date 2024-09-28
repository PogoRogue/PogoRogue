
vspd = 0;
randomize();
grav = random_range(0.05,0.1);
hspeed = random_range(-3,3);
vspeed = random_range(-1,-1.5);
alarm[0] = irandom_range(60,120);
slow_time = random_range(0.95,0.99);
x += irandom_range(-8,8);
y += irandom_range(8,-16)
image_speed = 0;
image_index = irandom_range(0,sprite_get_number(sprite_index)-1);
image_angle = choose(0,90,180,270);
random_set_seed(global.seed);
