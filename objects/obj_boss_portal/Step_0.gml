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
	var nextRoom = room_next(room);

if (room_exists(nextRoom)) {
	room_goto_next();
} else {
   game_restart();
   }
}
