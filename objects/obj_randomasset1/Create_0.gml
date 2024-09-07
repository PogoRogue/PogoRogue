randomize();
if room != room_tutorial {
	sprite_index = choose(spr_junkyard_asset1,spr_junkyard_asset2,spr_junkyard_asset3,spr_junkyard_asset6,spr_junkyard_asset7);
}
delete_chance = choose(true,false);
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
