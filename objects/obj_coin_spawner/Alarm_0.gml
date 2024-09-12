/// @description create extra coins
//randomize();
randomize();
if num_of_coins > 0 {
	instance_create_depth(x+irandom_range(-4,4),y+irandom_range(-4,4),depth,obj_coin, {salesman: salesman_spawner, pogosmith: pogosmith_spawner});
	alarm[0] = time_between_spawns;
	num_of_coins -= 1;
}else {
	instance_destroy();
	if room = room_shop {
		obj_shop.cant_move = false;	
	}
}
random_set_seed(global.seed);