/// @description Create coins

with instance_create_depth(x, y, depth-1, obj_coin_spawner) {
	num_of_coins = 300;
}

// Inherit the parent event
event_inherited();

instance_destroy(obj_boss_gate_close);
instance_destroy(obj_boss_marionette_health);
