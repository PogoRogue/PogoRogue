/// @description Player collision
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

if (colliding and key_open_door) {
	if obj_player.state != obj_player.state_portal {
		obj_player.speed = 0;
		obj_player.portal_object = self;
		obj_player.portal_speed = obj_player.speed/2;
		obj_player.portal_angle_speed = 0;
		obj_player.portal_rot_distance = 0;
		obj_player.state = obj_player.state_portal;
	}
}

//old code 
/*
if (place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask)) {
	
	if obj_player.state != obj_player.state_portal {
		obj_player.portal_object = self;
		obj_player.portal_speed = obj_player.speed/2;
		obj_player.portal_angle_speed = 0;
		obj_player.portal_rot_distance = 0;
		obj_player.state = obj_player.state_portal;
	}
}