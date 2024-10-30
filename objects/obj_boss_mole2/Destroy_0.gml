//instance_create_layer(x, y, "enemies", obj_explosion,{mask_index: spr_nothing});
if !instance_exists(obj_boss_mole1) and !instance_exists(obj_boss_mole3) {
	//create coins
	if global.phase = 1 {
		with instance_create_depth(x,y,depth-1,obj_coin_spawner) {
			num_of_coins = 50;
		}
	}else {
		with instance_create_depth(x,y,depth-1,obj_coin_spawner) {
			num_of_coins = 100;
		}
	}
}