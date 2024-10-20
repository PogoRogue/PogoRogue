/// @description Player collision + button pressed
if room != room_shop {
	key_open_door = global.key_interact;
	sprite_index = spr_portal_shop_new;
}else {
	key_open_door = global.key_interact;
	sprite_index = spr_portal_shop_new2;
}

//check for player coliision
if (place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask)) {
	colliding = true;
}else {
	colliding = false;	
}

//image_index = room = room_shop;

if (colliding and key_open_door) {
	if obj_player.state != obj_player.state_shop_portal {
		obj_player.speed = 0;
		obj_player.portal_object = self;
		obj_player.portal_speed = obj_player.speed/2;
		obj_player.portal_angle_speed = 0;
		obj_player.portal_rot_distance = 0;
		obj_player.state = obj_player.state_shop_portal;
		obj_player.used_shop_portal = false;
	}
}

/*
//check for button press
if (colliding and key_open_door) {
	if room != room_shop {
		room_persistent = true;
		room = room_shop;
		//scr_Room_Transition(room_shop);
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
			scr_Game_Restart();
		}
	}
}