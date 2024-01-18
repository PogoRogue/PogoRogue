/// @description Remove bricks

// Destroy brick attached to main body
instance_destroy(obj_boss_brick);

//create coins
with instance_create_depth(x,y,depth-1,obj_coin_spawner) {
	num_of_coins = global.combo + (global.added_coins * 2);
}