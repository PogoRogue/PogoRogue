/// @description Create coins

with instance_create_depth(x,y,depth-1,obj_coin_spawner) {
	num_of_coins = 100;
}

// Inherit the parent event
event_inherited();

if (room == room_boss_2) {
 instance_create_layer(272, 560, "hazards", obj_shop_door);
 instance_create_layer(800, 464, "hazards", obj_boss_door);
}