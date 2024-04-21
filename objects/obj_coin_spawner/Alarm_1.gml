/// @description remove coins
if room = room_shop {
	global.num_of_coins -= init_num_of_coins;
	if instance_number(obj_coin_spawner) < 2 {
		obj_shop.cant_move = false;	
	}
}	