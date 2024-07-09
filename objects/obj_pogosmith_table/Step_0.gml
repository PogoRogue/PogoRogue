/// @description Player collision + button pressed
key_interact = global.key_interact;

//check for player coliision
if (place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask)) {
	colliding = true;
}else {
	colliding = false;	
}

if (colliding and key_interact) and !instance_exists(obj_fade_in) {
	//do thing
}