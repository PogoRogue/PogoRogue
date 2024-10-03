randomize();
vspd = -random_range(-1,0);
hspd = -random_range(-1,1);
grav = 0.21;
init_y = y;
angle_spd = random_range(0,1.5) * choose(-1,1);
random_set_seed(global.seed);