if obj_player.gun != obj_player.javelin_gun or obj_player.dead = true {
	instance_destroy();	
}else if global.key_fire_projectile_released {
	instance_activate_object(javelin_object);	
	with javelin_object {
		x = obj_player.x;
		y = obj_player.y;
		angle = obj_player.angle-90;
		image_angle = angle;
		
		temp_charge = other.charge;
		temp_charge_max = other.charge_max;
		
		with obj_player {
			speed = 0;
			motion_add(angle - 90, vsp_basicjump * (0.8 + ((other.temp_charge/other.temp_charge_max)*0.7)));
			
			if frenzy = false {
				gun.current_bullets -= 1;
			}else {
				gun.current_bullets = gun.bullets_per_bounce + max_ammo_buff;
			}
		}
		
		created = true;	
		audio_play_sound(snd_grenade,0,false);
		scr_Screen_Shake(3 + ((temp_charge/temp_charge_max)*4), 6 + ((temp_charge/temp_charge_max)*10), true);
		hspd = lengthdir_x(spd+((temp_charge/temp_charge_max)*6),angle);
		vspd = lengthdir_y(spd+((temp_charge/temp_charge_max)*6),angle);
	}
	instance_destroy();
}else {
	if (charge < charge_max) {
		charge += charge_max/frames_to_charge;
	}
}