if obj_player.state = obj_player.state_free {
	obj_player.state = obj_player.state_balloon;
}

if global.key_fire_projectile_released or !global.key_fire_projectile or obj_player.gun != obj_player.balloon_gun
or obj_player.dead = true or obj_player.state = obj_player.state_blink or obj_player.state = obj_player.state_strike {
	//instance_activate_object(balloon_object);	
	with balloon_object {
		enemies_array = [];
		image_speed = 0;
		x = obj_player.x;
		y = obj_player.y;
		angle = obj_player.angle-90 + angle_offset;
		image_angle = angle;
		
		temp_charge = other.charge;
		temp_charge_max = other.charge_max;
		
		if audio_is_playing(snd_balloon_inflate) {
			audio_stop_sound(snd_balloon_inflate);
		}
		
		with obj_player {
			speed = 0;
			motion_add(angle - 90, vsp_basicjump * (0.7 + ((other.image_index/other.max_image_index)*0.6)));
			
			if frenzy = false and aerial_assassin_frenzy = false and pogomode = false {
				//gun.current_bullets -= 1;
			}else {
				gun.current_bullets = gun.bullets_per_bounce + max_ammo_buff;
			}
		}
		
		created = true;	
		alarm[2] = 300;
		//audio_stop_sound(snd_plasma_charge);
		if spread_index = 0 {
			audio_play_sound(snd_balloon_shoot,0,false);
		}
		scr_Screen_Shake(3 + ((temp_charge/temp_charge_max)*4), 6 + ((temp_charge/temp_charge_max)*10), true);
		hspd = lengthdir_x(other.balloon_speed,angle);
		vspd = lengthdir_y(other.balloon_speed,angle);
		
		scr_Projectile_Bounce("");
	}
	instance_destroy();
}else {
	balloon_rotation += 4;
	if (charge < charge_max) {
		charge += charge_max/frames_to_charge;
	}
	if obj_player.frenzy = false and obj_player.pogomode = false and obj_player.aerial_assassin_frenzy = false and spread_index = 0 {
		if balloon_object.image_index < balloon_object.max_image_index { 
			obj_player.balloon_gun.current_bullets -= 5/(balloon_object.max_image_index);
		}
	}
	
	//scale orb up
	if floor(balloon_object.image_index) = 0 {
		balloon_speed = 2 + (obj_player.balloon_gun.level >= 3 * 2) + (global.strong_muscles * 4);
		damage = 1;
	}else if floor(balloon_object.image_index) = 1 {
		balloon_speed = 2 + (obj_player.balloon_gun.level >= 3 * 2) + (global.strong_muscles * 4);
		damage = 2;
	}else if floor(balloon_object.image_index) = 2 {
		balloon_speed = 3 + (obj_player.balloon_gun.level >= 3 * 2) + (global.strong_muscles * 4);
		damage = 3;
	}else if floor(balloon_object.image_index) = 3 {
		balloon_speed = 4 + (obj_player.balloon_gun.level >= 3 * 2) + (global.strong_muscles * 4);
		damage = 4;
	}else if floor(balloon_object.image_index) = 4 {
		balloon_speed = 5 + (obj_player.balloon_gun.level >= 3 * 2) + (global.strong_muscles * 4);
		damage = 6;
	}else if floor(balloon_object.image_index) = 5 {
		balloon_speed = 6 + (obj_player.balloon_gun.level >= 3 * 2) + (global.strong_muscles * 4);
		damage = 8;
	}else if floor(balloon_object.image_index) = 6 {
		balloon_speed = 6 + (obj_player.balloon_gun.level >= 3 * 2) + (global.strong_muscles * 4);
		damage = 10;
	}else if floor(balloon_object.image_index) = 7 {
		balloon_speed = 6 + (obj_player.balloon_gun.level >= 3 * 2) + (global.strong_muscles * 4);
		damage = 12;
	}else if floor(balloon_object.image_index) = 8 {
		balloon_speed = 7 + (obj_player.balloon_gun.level >= 3 * 2) + (global.strong_muscles * 4);
		damage = 14;
	}else if floor(balloon_object.image_index) >= 9 {
		balloon_speed = 8 + (obj_player.balloon_gun.level >= 3 * 2) + (global.strong_muscles * 4);
		damage = 16;
	}
	
	with balloon_object {
		if image_index < max_image_index and obj_player.balloon_gun.current_bullets >= 0 {
			image_speed = 1;
		}else {
			image_speed = 0;
			if audio_is_playing(snd_balloon_inflate) {
				audio_stop_sound(snd_balloon_inflate);
			}
		}
		//image_xscale = other.balloon_scale;
		//image_yscale = other.balloon_scale;
		damage = other.damage;
		init_damage = other.damage;
		x = obj_player.x;//+lengthdir_x(((sprite_get_height(other.balloon_index)/2)*image_xscale) - 1,obj_player.angle-90);
		y = obj_player.y;//+lengthdir_y(((sprite_get_height(other.balloon_index)/2)*image_yscale) - 1,obj_player.angle-90);
		//image_angle = other.balloon_rotation;
	}
}

/*
if obj_player.balloon_gun.level > 1 {
	frames_to_charge = 40;
}