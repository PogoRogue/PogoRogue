/// @description Create coins

with instance_create_depth(x,y,depth-1,obj_coin_spawner) {
	num_of_coins = 100;
}

// Inherit the parent event
event_inherited();
