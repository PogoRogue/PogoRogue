/// @description Player collision + button pressed
if room != room_shop {
	key_interact = global.key_interact;
}else {
	key_interact = global.key_interact;
}

//check for player coliision
if (place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask)) {
	colliding = true;
}else {
	colliding = false;	
}

//image_index = room = room_shop;

if (colliding and key_interact) {
	instance_create_depth(x,y,depth,obj_choosemenu_active);
}