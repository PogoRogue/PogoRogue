/// @description Create coins

//randomize();
randomize();
var random_spawn_x = irandom_range(-16,16);
random_set_seed(global.seed);

if (create_coins = true and num_of_coins > 0) {
	instance_create_depth(x + random_spawn_x,y+8,obj_player.depth-1,obj_coin);
	num_of_coins -= 1;
	alarm[0] = 2;
}else if num_of_coins <= 0 {
	create_coins = false;
}