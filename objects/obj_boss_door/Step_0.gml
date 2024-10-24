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
		audio_play_sound(snd_portal,0,false);
		obj_player.speed = 0;
		obj_player.portal_object = self;
		obj_player.portal_speed = obj_player.speed/2;
		obj_player.portal_angle_speed = 0;
		obj_player.portal_rot_distance = 0;
		obj_player.state = obj_player.state_portal;
		
		if room = room_proc_gen_test and global.steam_api = true {
			if global.phase = 1 {
				if !steam_get_achievement("ACHIEVEMENT_FACTORY") {
					steam_set_achievement("ACHIEVEMENT_FACTORY");
				}
				
				if !steam_get_achievement("ACHIEVEMENT_FACTORYMASTER") and global.combo_broken_area1 = false {
					steam_set_achievement("ACHIEVEMENT_FACTORYMASTER");
				}
			}else if global.phase = 2 {
				if !steam_get_achievement("ACHIEVEMENT_OFFICE") {
					steam_set_achievement("ACHIEVEMENT_OFFICE");
				}
				if !steam_get_achievement("ACHIEVEMENT_OFFICEMASTER") and global.combo_broken_area2 = false {
					steam_set_achievement("ACHIEVEMENT_OFFICEMASTER");
				}
			}else if global.phase = 3 {
				if !steam_get_achievement("ACHIEVEMENT_CORPORATE") {
					steam_set_achievement("ACHIEVEMENT_CORPORATE");
				}
				if !steam_get_achievement("ACHIEVEMENT_CORPORATEMASTER") and global.combo_broken_area3 = false {
					steam_set_achievement("ACHIEVEMENT_CORPORATEMASTER");
				}
			}
		}
	}
}

if image_xscale < 1 {
	image_xscale += 0.05;
}

if image_yscale < 1 {
	image_yscale += 0.05;
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