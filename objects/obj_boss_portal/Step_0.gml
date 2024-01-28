<<<<<<< Updated upstream
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
=======
// @description Player collision + button pressed
key_open_door = global.key_interact; 

// 检测玩家碰撞
colliding = place_meeting(x, y, obj_player) or place_meeting(x, y, obj_player_mask);


if (colliding and key_open_door) {
	var nextRoom = room_next(room);
// find if has nextroom
if (room_exists(nextRoom)) {
    room_goto_next();
} else {
    game_restart();
}
} 





    

>>>>>>> Stashed changes
