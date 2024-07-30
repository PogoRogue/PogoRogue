if obj_player.state = obj_player.state_free {
	obj_player.state = obj_player.state_plasmacharge;
}

if global.key_fire_projectile_released or !global.key_fire_projectile or obj_player.gun != obj_player.plasma_gun
or obj_player.dead = true or obj_player.state = obj_player.state_blink or obj_player.plasma_gun.current_bullets <= 0 {
	//instance_activate_object(plasma_object);	
	with plasma_object {
		enemies_array = [];
		alarm[5] = 1;
		sprite_index = other.orb_sprite;
		x = obj_player.x+lengthdir_x(sprite_get_height(other.orb_sprite)/2,obj_player.angle-90);
		y = obj_player.y+lengthdir_y(sprite_get_height(other.orb_sprite)/2,obj_player.angle-90);
		angle = obj_player.angle-90;
		image_angle = angle;
		
		temp_charge = other.charge;
		temp_charge_max = other.charge_max;
		
		with obj_player {
			speed = 0;
			motion_add(angle - 90, vsp_basicjump * (0.7 + ((other.temp_charge/other.temp_charge_max)*0.7)));
			
			if frenzy = false and aerial_assassin_frenzy = false {
				//gun.current_bullets -= 1;
			}else {
				gun.current_bullets = gun.bullets_per_bounce + max_ammo_buff;
			}
		}
		
		created = true;	
		audio_stop_sound(snd_javelin_charge);
		audio_play_sound(snd_javelin,0,false);
		scr_Screen_Shake(3 + ((temp_charge/temp_charge_max)*4), 6 + ((temp_charge/temp_charge_max)*10), true);
		hspd = lengthdir_x(other.orb_speed,angle);
		vspd = lengthdir_y(other.orb_speed,angle);
		
		scr_Projectile_Bounce("");
	}
	instance_destroy();
}else {
	orb_rotation += 4;
	if (charge < charge_max) {
		charge += charge_max/frames_to_charge;
	}
	if obj_player.frenzy = false and obj_player.aerial_assassin_frenzy = false {
		obj_player.plasma_gun.current_bullets -= 1;
	}
	//scale orb up
	if charge <= 2 {
		orb_sprite = spr_projectile_plasma1;
		orb_glow_sprite = spr_plasma_outline1;
		orb_speed = 10;
		orb_scale = 1 + ((charge/4));
		randomize();
		trail_sprite = choose(spr_plasma_trail1,spr_plasma_trail2);
		trail_spawnrate = 2;
		random_set_seed(global.seed);
		damage = 1;
	}else if charge <= 3 {
		orb_sprite = spr_projectile_plasma2;
		orb_glow_sprite = spr_plasma_outline2;
		orb_speed = 8;
		orb_scale = 1 + (charge-2)/3;
		randomize();
		trail_sprite = choose(spr_plasma_trail2,spr_plasma_trail3);
		trail_spawnrate = 2;
		random_set_seed(global.seed);
		damage = 2;
	}else if charge <= 4 {
		orb_sprite = spr_projectile_plasma3;
		orb_glow_sprite = spr_plasma_outline3;
		orb_speed = 7;
		orb_scale = 1 + (charge-3)/2;
		trail_sprite = spr_plasma_trail4;
		trail_spawnrate = 1;
		damage = 3;
	}else if charge <= 5 {
		orb_sprite = spr_projectile_plasma4;
		orb_glow_sprite = spr_plasma_outline4;
		orb_speed = 6;
		orb_scale = 1 + (charge-4)/3;
		trail_sprite = spr_plasma_trail4; //3
		trail_spawnrate = 1;
		damage = 4;
	}else if charge <= 6 {
		orb_sprite = spr_projectile_plasma5;
		orb_glow_sprite = spr_plasma_outline5;
		orb_speed = 5;
		orb_scale = 1 + (charge-5)/4;
		trail_sprite = spr_plasma_trail5;
		trail_spawnrate = 1;
		damage = 6;
	}else if charge <= 7 {
		orb_sprite = spr_projectile_plasma6;
		orb_glow_sprite = spr_plasma_outline6;
		orb_speed = 4.5;
		orb_scale =  1 + (charge-6)/5;
		trail_sprite = spr_plasma_trail6;
		trail_spawnrate = 1;
		damage = 8;
	}else if charge <= 8 {
		orb_sprite = spr_projectile_plasma7;
		orb_glow_sprite = spr_plasma_outline7;
		orb_speed = 4;
		orb_scale = 1 + (charge-7)/6;
		trail_sprite = spr_plasma_trail6;
		trail_spawnrate = 1;
		damage = 12;
	}else if charge <= 9 {
		orb_sprite = spr_projectile_plasma8;
		orb_glow_sprite = spr_plasma_outline8;
		orb_speed = 3.5;
		orb_scale = 1 + (charge-8)/7;
		trail_sprite = spr_plasma_trail7;
		trail_spawnrate = 1;
		damage = 16;
	}else if charge <= charge_max {
		orb_sprite = spr_projectile_plasma9;
		orb_glow_sprite = spr_plasma_outline9;
		orb_speed = 3;
		orb_scale = 1;
		trail_sprite = spr_plasma_trail7;
		trail_spawnrate = 1;
		damage = 24;
	}
	
	with plasma_object {
		sprite_index = other.orb_sprite;
		image_xscale = other.orb_scale;
		image_yscale = other.orb_scale;
		trail_sprite = other.trail_sprite;
		trail_spawnrate = other.trail_spawnrate;
		orb_glow_sprite = other.orb_glow_sprite;
		damage = other.damage;
		init_damage = other.damage;
		x = obj_player.x+lengthdir_x(((sprite_get_height(other.orb_sprite)/2)*image_xscale) - 1,obj_player.angle-90);
		y = obj_player.y+lengthdir_y(((sprite_get_height(other.orb_sprite)/2)*image_yscale) - 1,obj_player.angle-90);
		//image_angle = other.orb_rotation;
	}
}