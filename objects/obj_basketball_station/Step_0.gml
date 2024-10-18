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
	//reset basketballs
	with obj_volleyball_small_2 {
		angle_speed = 5;
		grav = 0.21;
		hspeed = 0;
		vspeed = -2;
		bounce_decay = 1;
		rot_angle = 0;
		spawning = false;
		image_index = 1;
		alpha = 1;
		alpha_up = false;
		scale = 1;
		damage = 8;
		enemy_object = noone;
		enemies_array = [];
		despawn = false;
		depth -= 10;

		free = true;
		x = starting_x;
		y = starting_y;
		hspeed = 0;
		vspeed = -2;
	}
	with obj_basketball {
		x = starting_x;
		y = starting_y;
				grav = 0.21;
		hspeed = 0;
		vspeed = -2;
		bounce_decay = 1;
		rot_angle = 0;
		spawning = false;
		image_index = 1;
		alpha = 1;
		alpha_up = false;
		scale = 1;
		damage = 8;
		enemy_object = noone;
		enemies_array = [];
		despawn = false;
		depth -= 10;

		free = true;
	}
}