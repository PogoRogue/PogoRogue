/// @description laser
//too many unique properties of the laser compared to other projectiles so I had to make a separate event
if (gun_name = "Laser Gun" ) {
	
	image_angle = obj_player.image_angle-90;
	x = obj_player.x +laser_x;
	y = obj_player.y +laser_y;
	
	//change sprite after animation complete
	if (floor(image_index) = sprite_get_number(sprite_index)-1) {
		sprite_index = full_sprite;
		mask_index = sprite_index;
		laser_boost = true;
	}
	
	//retract laser
	if (floor(image_index) = 0 and image_speed = -1) {
		instance_destroy();
	}
	
	with obj_player {
		
		//check if speed slower or faster than max speed to preserve momentum
		if (abs(speed) > gun.max_speed and vspeed < 0) {
			slower_than_max = false;
			current_max = speed;
		}else {
			slower_than_max = true;	
			current_max = 0;
		}
		
		if (gun = laser_gun) {
			//reset/preserve momentum
			if (gun.reset_momentum and slower_than_max) {
				speed = 0;
			}else if (gun.reset_momentum) {
				speed = current_max + (vsp_basicjump*gun.momentum_added);	
			}
		
			//add momentum
			if (other.laser_boost) and other.spread_index = 0 or (obj_player.laser_gun.level > 1) {
				motion_add(angle - 90, vsp_basicjump * gun.momentum_added);
			}
		
			//set max speed for auto weapons
			if (speed > gun.max_speed) { //player cant exceed certain speed if full_auto = true
				speed = max(gun.max_speed, current_max);
			}
		}
		
		//decrease ammo
		if (other.laser_boost and frenzy = false and pogomode = false and aerial_assassin_frenzy = false) {
			gun.current_bullets -= 1;
		}
		
		//screen shake
		if (other.laser_boost){
			var controller_vibration = global.controller_vibration/100;
			scr_Screen_Shake(2,1,true);
			//gamepad_set_vibration(0, 0.25*controller_vibration, 0.25*controller_vibration);
			rotation_speed = other.rotation_speed * 0.75;
			rotation_delay = rotation_speed / 7;
			
			if rotation_speed < 2 {
				rotation_speed = 2;
				rotation_delay = rotation_speed / 7;
			}
		}
		
		//retract laser if not firing
		if !(key_fire_projectile) or gun != laser_gun {
			scr_Retract_Laser();
			other.laser_boost = false;
		}
		
		//retract if out of ammo
		if (gun.current_bullets = 0) {
			scr_Retract_Laser();
			other.laser_boost = false;
		}
		
		//delete if not free
		if (state != state_free and state != state_freeze) {
			scr_Retract_Laser();
			other.laser_boost = false;
		}
		
		if (state = state_freeze) {
			speed = 0;	
		}
	}
}
if (gun_name = "Sniper Rifle" ) {
	
	//image_angle = obj_player.image_angle-90;
	x = obj_player.x +laser_x;
	y = obj_player.y +laser_y;
	
	//retract laser
	if (floor(image_index) <= 1 and image_speed = -1) {
		instance_destroy();
		with obj_sniper {
			if image_speed = other.image_speed {
				instance_destroy();
			}
		}
	}
	
	with obj_player {
		
		//check if speed slower or faster than max speed to preserve momentum
		if (abs(speed) > gun.max_speed and vspeed < 0) {
			slower_than_max = false;
			current_max = speed;
		}else {
			slower_than_max = true;	
			current_max = 0;
		}
		
		//add momentum
		if (other.laser_boost) {
			scr_Retract_Laser();
			other.laser_boost = false;
			
			with obj_sniper {
				cut_sound = false;	
			}
		}
		
		//set max speed for auto weapons
		if (speed > gun.max_speed) { //player cant exceed certain speed if full_auto = true
			speed = max(gun.max_speed, current_max);
		}
		
		//decrease ammo
		if (gun.spread_number = 1 and other.laser_boost and other.sniped = false) {
			//gun.current_bullets -= 1;
			other.sniped = true;
		}
		
		if (state != state_free and state != state_freeze or gun != sniper_gun) {
			scr_Retract_Laser();
			other.laser_boost = false;
		}
	}
	
		
	//change sprite after animation complete
	if (floor(image_index) = sprite_get_number(sprite_index)-1 and laser_boost = false) {
		sprite_index = full_sprite;
		mask_index = sprite_index;
		laser_boost = true;
	}
}

if gun_name = "Water Gun" {
	if (attach_to_player > 0) {
		x = obj_player.x + lengthdir_x(6,obj_player.angle-90);
		y = obj_player.y + lengthdir_y(6,obj_player.angle-90);
		attach_to_player -= 1;
	
	}else {
		image_index = 1;	
	}
}

if (gun_name = "Grappling Helmet") or gun_name = "Harpoon Helmet" {
	
	hspd = 0;
	vspd = 0;
	distance_traveled += spd;
	if obj_player.vspeed > 0 {
		distance_traveled += obj_player.vspeed;
	}
	
	if retract = false {
		x = obj_player.x + lengthdir_x(distance_traveled+56,init_angle);
		y = obj_player.y + lengthdir_y(distance_traveled+56,init_angle);

		sprite_angle = point_direction(x,y,obj_player.x - lengthdir_x(56,obj_player.image_angle-90),obj_player.y - lengthdir_y(56,obj_player.image_angle-90)) + 180;
		show_debug_message("SPRITE ANGLE: " + string(sprite_angle - 360));
	}
	
	if retract = true {
		if abs(sprite_angle - obj_player.angle) > 1 {
			//sprite_angle += sign((sprite_angle+90) - obj_player.angle) / 10 ;
		}else {
			//sprite_angle = obj_player.angle;	
		}
		
		//x = obj_player.x + lengthdir_x(distance_traveled+56,init_angle);
		//y = obj_player.y + lengthdir_y(distance_traveled+56,init_angle);
	}
	
	//damage once per enemy
	if place_meeting(x,y,obj_enemy_parent) and gun_name = "Grappling Helmet" or retract = true {
		damage = 0;
		init_damage = 0;
	}
	
	if obj_player.state = obj_player.state_blink or obj_player.state = obj_player.state_strike {
		instance_destroy();
	}
	
	if place_meeting(x,y,obj_ground) and retract = false {
		spd = 0;
		if collided = false {
			//audio_stop_sound(rope_sound);
			audio_play_sound(snd_grappling_hit,0,false);
			audio_play_sound(snd_grappling_pull,0,false);
			collided = true;
			obj_player.state = obj_player.state_grappling;
			obj_player.image_index = 0;
			if obj_player.vspeed > 0 {
				obj_player.vspeed = 0;
			}
			//obj_player.speed = 0;
			collision_x = x;
			collision_y = y;
		}
	}else {
		if collided = true {
			retract = true;	
		}
	}
	
	if retract = true {
		
		if retracted = false and collided = true {
			retracted = true;
		}
		if retract_spd < 12 {
			retract_spd += 1;	
		}
		
		if retracting_distance > 0 {
			retracting_distance	-= retract_spd;
		}else {
			retracting_distance = 0;
		}
		
		if retracting_distance_set = false {
			retract_angle = sprite_angle - 360;
			show_debug_message("sprite_angle: " + string(retract_angle));
			show_debug_message("player: " + string(obj_player.angle+90));
			angle_diff = retract_angle - (obj_player.angle+90);
			retracting_distance_set = true;
			lerp_value = 0;
			//enemies_array = [];
		}
		
		if abs((retract_angle) != (obj_player.angle+90)) {
			if lerp_value < 1 {
				lerp_value += 0.1;
			}else {
				lerp_value = 1;
			}
			
			if distance_to_point(obj_player.x + lengthdir_x(56,obj_player.angle+90),obj_player.y + lengthdir_y(56,obj_player.angle+90)) <= 64 {
				lerp_value = 1;
			}
			retract_angle = (obj_player.angle+90 + (angle_diff*(1-lerp_value)));
			//sprite_angle = obj_player.angle+90;
		}else {
			retract_angle = obj_player.angle+90;
			//sprite_angle = obj_player.angle+90;
		}
		x = obj_player.x + lengthdir_x(abs(distance_to_point(obj_player.x,obj_player.y)),retract_angle);
		y = obj_player.y + lengthdir_y(abs(distance_to_point(obj_player.x,obj_player.y)),retract_angle);
		
		move_towards_point(obj_player.x + lengthdir_x(56,obj_player.angle+90),obj_player.y + lengthdir_y(56,obj_player.angle+90),retract_spd+(obj_player.vspeed * (obj_player.vspeed > 0)))
		
		distance_traveled -= retract_spd;/*
		x = obj_player.x + lengthdir_x(56,obj_player.image_angle+90) + lengthdir_x(distance_traveled,image_angle);
		y = obj_player.y + lengthdir_y(56,obj_player.image_angle+90) + lengthdir_y(distance_traveled,image_angle);*/
	}
	
	if collided = true and (obj_player.state = obj_player.state_free) {
		retract = true;
	}
	
	if abs(obj_player.angle+90 - init_angle) > 60 {
		//retract = true;	
	}
	
	if gun_name = "Grappling Helmet" {
		if distance_traveled >= 320 + (128 * global.strong_muscles) {
			retract = true;	
		}
	}else if gun_name = "Harpoon Helmet" {
		if distance_traveled >= 420 + (128 * global.strong_muscles) {
			retract = true;	
		}
		if place_meeting(x,y,obj_ground) {
			//image_index = 1;
			//depth = 100;
			if room = room_starting_area or room = room_boss_2 {
				//depth = 401;
			}else if room = room_boss_3  {
				//depth = 301;
			}
		}else {
			image_index = 0;	
		}
	}
	
	if retract = true {
		spd = 0;
		if obj_player.state = obj_player.state_grappling {
			obj_player.state = obj_player.state_free;
		}
	}
	
	if distance_to_point(obj_player.x + lengthdir_x(56,obj_player.angle+90),obj_player.y + lengthdir_y(56,obj_player.angle+90)) <= retract_spd * 2 {
		if obj_player.state = obj_player.state_grappling {
			obj_player.state = obj_player.state_free;
		}
		instance_destroy();
	}
	
	if distance_to_object(obj_player) < 16 and retract = true
	or distance_to_object(obj_player_mask) < 16 and retract = true {
		instance_destroy();	
	}
}