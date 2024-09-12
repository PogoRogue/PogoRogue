if obj_player.gun != obj_player.javelin_gun or obj_player.dead = true or obj_player.state = obj_player.state_blink or obj_player.state = obj_player.state_strike {
	instance_destroy();	
}else if global.key_fire_projectile_released {
	with obj_player {
		if state = state_megabounce_charge {
			end_of_charge = true;
			charge = charge_max;
		}
	}
	instance_activate_object(javelin_object);	
	with javelin_object {
		x = obj_player.x;
		y = obj_player.y;
		if obj_player.javelin_gun.spread_number = 1 {
			angle = obj_player.angle-90;
		}else {
			if spread_index = 1 {
				angle = obj_player.angle-90;
			}else if spread_index = 0 {
				angle = obj_player.angle-90-obj_player.javelin_gun.spread_angle;
			}else if spread_index = 2 {
				angle = obj_player.angle-90+obj_player.javelin_gun.spread_angle;
			}
		}
		image_angle = angle;
		
		temp_charge = other.charge;
		temp_charge_max = other.charge_max;
		
		with obj_player {
			speed = 0;
			motion_add(angle - 90, vsp_basicjump * (0.8 + ((other.temp_charge/other.temp_charge_max)*0.7)));
			
			if frenzy = false and aerial_assassin_frenzy = false and pogomode = false {
				gun.current_bullets -= 1/gun.spread_number;
			}else {
				gun.current_bullets = gun.bullets_per_bounce + max_ammo_buff;
			}
		}
		
		created = true;	
		audio_stop_sound(snd_javelin_charge);
		if !audio_is_playing(snd_javelin) {
			audio_play_sound(snd_javelin,0,false);
		}
		scr_Screen_Shake(3 + ((temp_charge/temp_charge_max)*4), 6 + ((temp_charge/temp_charge_max)*10), true);
		hspd = lengthdir_x(spd+((temp_charge/temp_charge_max)*6),angle);
		vspd = lengthdir_y(spd+((temp_charge/temp_charge_max)*6),angle);
		
		scr_Projectile_Bounce("");
	}
	instance_destroy();
}else {
	if (charge < charge_max) {
		charge += charge_max/frames_to_charge;
	}
}