/// @description Player collision + button pressed
key_open_door = keyboard_check_pressed(ord("W")) + keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0,gp_face4);

//check for player coliision
if (place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask)) {
	colliding = true;
}else {
	colliding = false;	
}

//check for button press
if (colliding and key_open_door) {
	if room != room_shop {
		room = room_shop;
		global.player_spawn_x_prev = x;
		global.player_spawn_y_prev = y - 64;
	}else {
		room = global.last_room;
		global.player_spawn_x = global.player_spawn_x_prev;
		global.player_spawn_y = global.player_spawn_y_prev;
	}
}