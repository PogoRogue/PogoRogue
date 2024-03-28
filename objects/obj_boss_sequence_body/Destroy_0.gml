/// @description Create coins

with instance_create_depth(x,y,depth-1,obj_coin_spawner) {
	num_of_coins = 100;
}

instance_destroy(obj_boss_sequence_health);

// Inherit the parent event
event_inherited();
