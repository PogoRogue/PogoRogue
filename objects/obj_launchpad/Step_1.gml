/// @description Insert description here
// You can write your code in this editor

//activated_sound = snd_carhorn;

y += vspd;
 
if vspd > 0 {
	vspd -= 0.25;
	x += obj_player.hspeed;
	if obj_player.vspeed > 0 {
		y += obj_player.vspeed;
	}
}

if vspd < 2 and animating = false {
	//mask_index = spr_launchpad_mask;
}

if not_meeting_enemy = true {
	alpha += 0.1;	
	if scale < 1 {
		scale += 1/15;
	}
}
if rockets_spawned = false and scale = 1 {
	rocket_1 = instance_create_depth(x-56,y-14,depth-1,obj_rocket);
	rocket_2 = instance_create_depth(x+55,y-14,depth-1,obj_rocket);	
	rockets_spawned = true;
}

if sprite_index = spr_launchpad_white and alpha >= 1.5 {
	sprite_index = spr_launchpad_left;
	mask_index = spr_launchpad_mask;
	spawned = true;
}

flames_index += 0.5;

//bob up and down
if sprite_index != spr_launchpad_white {
	if y_add > -2 and y_up = true {
		y_add_spd = (2 - abs(y_add))/8 + 0.025;
		y_add -= y_add_spd;

	}else if y_up = true {
		y_up = false;
		y_add_spd = 0;
	}
	if y_add < 2 and y_up = false {
		y_add_spd = (2 - abs(y_add))/8 + 0.025;
		y_add += y_add_spd;
	}else if y_up = false {
		y_up = true;
		y_add_spd = 0;
	}
}

if !place_meeting(x,y,obj_player) and !place_meeting(x,y,obj_player_mask) and mask_index = spr_launchpad_mask and spawned = true {
	not_meeting = true;
}

while position_meeting(x,y+20,obj_ground) or position_meeting(x,y+20,obj_ground_oneway)
or position_meeting(x,y+20,obj_room_gate_open) {
	y -= 1;
}

while position_meeting(bbox_left-1,y,obj_ground) and !position_meeting(bbox_right+1,y,obj_ground) {
	x += 1;
}

while !position_meeting(bbox_left-1,y,obj_ground) and position_meeting(bbox_right+1,y,obj_ground) {
	x -= 1;
}

if place_meeting(x,y,obj_room_gate_open) {
	depth = instance_place(x,y,obj_room_gate_open).depth - 1;
}

if place_meeting(x,y,obj_boss_brick) {
	depth = instance_place(x,y,obj_boss_brick).depth + 20;
}

if animating = true and scale = 1 {
	if instance_exists(topleft_corner) {
		instance_destroy(topleft_corner);
	}
	if instance_exists(topright_corner) {
		instance_destroy(topright_corner);
	}
	if instance_exists(bottomleft_corner) {
		instance_destroy(bottomleft_corner);
	}
	if instance_exists(bottomright_corner) {
		instance_destroy(bottomright_corner);
	}
	created_walls = false;
	
	image_speed = 1;
	obj_player.launchpad = true;
	if missiles_left = 1 {
		sprite_index = spr_launchpad_left;
	}else if missiles_left = 0 and sprite_index != spr_launchpad_both {
		sprite_index = spr_launchpad_right;
	}else if sprite_index != spr_launchpad_both {
		sprite_index = spr_launchpad_none;
	}
	
	mask_index = spr_nothing;
	
	if obj_player.state = obj_player.state_bouncing or obj_player.state = obj_player.state_groundpound
	or obj_player.state = obj_player.state_megabounce {
		switch (floor(image_index)) {
			case 0: obj_player.y = player_y; break;
			case 1: obj_player.y = player_y+4; break;
			case 2: obj_player.y = player_y+8; break;
			case 3: obj_player.y = player_y+11; break;
			case 4: obj_player.y = player_y+11; break;
			case 5: obj_player.y = player_y+11; break;
			case 6: obj_player.y = player_y+11; break;
		}
	}else {
		image_speed = -1;	
		animating = false;
	}
	
	image_speed = 1;
}else if image_speed = 0 and created_walls = false and scale = 1 {
	if distance_to_object(obj_player) > 64 {
		mask_index = spr_nothing;
	}else {
		mask_index = spr_launchpad_mask;
	}
	
	/*topleft_corner = instance_create_depth(bbox_left,bbox_top,depth-3,obj_walltopleftcorner,{y_init: y});
	topright_corner = instance_create_depth(bbox_right,bbox_top,depth-3,obj_walltoprightcorner,{y_init: y});
	bottomleft_corner = instance_create_depth(bbox_left,bbox_bottom,depth-3,obj_wallbottomleftcorner,{y_init: y});
	bottomright_corner = instance_create_depth(bbox_right,bbox_bottom,depth-3,obj_wallbottomrightcorner,{y_init: y});
	
	//top left corner
	with topleft_corner {
		image_xscale = 1/8;
		image_yscale = 1;
	}

	//top right corner
	with topright_corner {
		image_xscale = 1/8;
		image_yscale = 1;
	}
	
	//bottom left corner
	with bottomleft_corner {
		image_xscale = 1/8;
		image_yscale = 1;
	}

	//bottom right corner
	with bottomright_corner {
		image_xscale = 1/8;
		image_yscale = 1;
	}*/
	
	created_walls = true;
}

if scr_Animation_Complete() and image_speed = 1 {
	if sprite_index = spr_launchpad_left {
		with rocket_1 {launched = true;}
		audio_play_sound(snd_rocketwhoosh,0,false);
	}else if sprite_index = spr_launchpad_right {
		with rocket_2 {launched = true;}
		audio_play_sound(snd_rocketwhoosh,0,false);
	}else if sprite_index = spr_launchpad_both {
		with rocket_1 {launched = true;}
		with rocket_2 {launched = true;}
		audio_play_sound(snd_rocketwhoosh,0,false);
	}
	sprite_index = spr_launchpad_none;
	image_speed = -1;	
	animating = false;
}

if image_speed = -1 and image_index < 1 {
	image_index = 0;
	image_speed = 0;	
	mask_index = spr_launchpad_mask;
	obj_player.launchpad = false;
}
	
	
if !place_meeting(x,y,obj_enemy_parent) {
	not_meeting_enemy = true;	
	if image_speed = 0 {
		mask_index = spr_launchpad_mask;	
	}
}