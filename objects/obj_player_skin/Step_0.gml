key_interact = global.key_interact;

//run state machine
state();

//close enough to switch?
if distance_to_object(obj_player) < 110 and obj_player.x > init_x - 64 and obj_player.x <= init_x + 64 
and (obj_player.state = obj_player.state_free or obj_player.state = obj_player.state_bouncing) {
	colliding = true;
}else {
	colliding = false;
}

if skin_num != 0 {
	unlocked = global.skins_unlocked_array[skin_num-1];
}else {
	unlocked = true;
}

if unlocked = false {
	bounce_speed = -3.5;
}else {
	bounce_speed = -5;
}

//switch
if (colliding and key_interact and unlocked = true) {
	audio_play_sound(snd_selectOption,0,false);
	var temp_skin = global.current_skin;
	var temp_x = obj_player.x;
	var temp_y = obj_player.y;
	var temp_image_index = obj_player.image_index;
	var temp_angle = obj_player.angle;
	var temp_vspeed = obj_player.vspeed;
	if obj_player.state = obj_player.state_bouncing {
		var temp_bouncing = true;
	}else {
		var temp_bouncing = false;
	}
	global.current_skin = skin_num;
	with obj_player {
		//reset skin sprites
		player_sprite = bouncing_array[global.current_skin];
		falling_sprite = falling_array[global.current_skin];
		charging_sprite = charging_array[global.current_skin];
		portal_sprite = portal_array[global.current_skin];
		face_sprite = face_array[global.current_skin];
		red_sprite = red_array[global.current_skin];
		white_sprite = white_array[global.current_skin];
		revive_sprite = revive_array[global.current_skin];
		revive_white_sprite = revive_white_array[global.current_skin];
		body_sprite = body_array[global.current_skin];
		pogostick_sprite = pogostick_array[global.current_skin];
		
		//take place of skin
		x = other.x;
		y = other.y;
		speed = 0;
		angle = 0;
		image_xscale = 1;
		if other.shop_bouncing = true {
			state = state_bouncing;
		}else {
			state = state_free;
		}
		vspeed = other.vspeed;
		sprite_index = other.sprite_index;
		image_index = other.image_index;
		
		scr_Get_Skin_Loadout();
		other.loadout_yscale = 0;
	}
	
	//set this object to player's old skin/position
	skin_num = temp_skin;
	player_sprite = bouncing_array[skin_num];
	falling_sprite = falling_array[skin_num];
	face_sprite = face_array[skin_num];
	centering = true;
	
	if shop_bouncing = true {
		sprite_index = player_sprite;
	}else {
		sprite_index = falling_sprite;
	}
	
	x = temp_x;
	y = temp_y;
	image_index = temp_image_index;
	image_angle = temp_angle;
	speed = 0;
	vspeed = temp_vspeed;
	if temp_bouncing = true {
		shop_bouncing = true;
	}else {
		shop_bouncing = false;	
	}
}

//re-center
if centering = true and unlocked = true {
	if image_angle >= rotation_speed or image_angle <= -rotation_speed {
		image_angle += rotation_speed * -sign(image_angle);
	}else {
		image_angle = 0;
		centering = false;
	}
}else {
	//move back to initial position
	if x > init_x + 20 {
		if image_angle < 5 {
			image_angle += 1;
		}
	}else if x < init_x - 20 {
		if image_angle > -5 {
			image_angle -= 1;
		}
	}else {
		centering = true;
	}	
}

if colliding and unlocked {
	if loadout_yscale < 1 {
		loadout_yscale += 0.1;
	}
}else if unlocked {
	if loadout_yscale > 0 {
		loadout_yscale -= 0.1;
	}
}