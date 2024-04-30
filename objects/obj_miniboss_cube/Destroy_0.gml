/// @description Remove bricks

// Destroy brick attached to main body
instance_destroy(obj_boss_brick);

//create coins
/*
with instance_create_depth(x,y,depth-1,obj_coin_spawner) {
	if global.combo < global.combo_max_coins {
		num_of_coins = global.combo + global.added_coins;
	}else {
		num_of_coins = global.combo_max_coins + global.added_coins;
	}
	if(global.robbery == true and obj_player.landed_on_enemy == true){
		num_of_coins *= 2;
		obj_player.landed_on_enemy = false;
	}
}*/

event_inherited();