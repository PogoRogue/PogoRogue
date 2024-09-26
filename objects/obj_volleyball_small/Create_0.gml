randomize();
angle_speed = 5;
grav = 0.21;
hspeed = random_range(1,3) * choose(1,-1);
vspeed = random_range(-4,-2);
bounce_decay = 1;
rot_angle = 0;
random_set_seed(global.seed);
spawning = false;
image_index = 1;
alpha = 1;
alpha_up = false;
scale = 1;
damage = 8;
enemy_object = noone;
enemies_array = [];
despawn = false;

free = true;