randomize();
delete_chance = choose(false,false);
if delete_chance = true {
	instance_destroy();	
}
vspeed = 0;//random_range(2,3);
hspeed = 0;
bounces_left = 5;
bounced = false;
init_speed = speed;
damaged = false;
collided = false;
angle = 0;
rotate = true;
random_set_seed(global.seed);
