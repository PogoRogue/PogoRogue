/// @description Player collision + button pressed
if room != room_shop {
	key_open_door = global.key_interact;
}else {
	key_open_door = global.key_interact;
}

//check for player coliision
if (place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask)) {
	colliding = true;
}else {
	colliding = false;	
}

image_index = room = room_shop;

//check for button press
if (colliding and key_open_door) {
	if room != room_shop {
		room_persistent = true;
		room = room_shop;
		global.player_spawn_x_prev = x;
		global.player_spawn_y_prev = y - 64;
		global.shop_index = shop_index;
		if global.shop_num <= global.current_shop_num and shop_used = false {
			global.shop_num += 1;
			shop_used = true;
			instance_destroy(obj_shop);
		}
	}else if !instance_exists(obj_coin_spawner) {
		if global.last_room != room_shop {
			room = global.last_room;
			room_persistent = false;
			global.player_spawn_x = global.player_spawn_x_prev;
			global.player_spawn_y = global.player_spawn_y_prev;
		}else {
			game_restart();	
		}
	}
}