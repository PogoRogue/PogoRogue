/// @description Damage enemy
//crit chance

randomize();
if gun_name != "Laser Gun" and gun_name != "Water Gun" {
	var crit_chance = irandom_range(1,100);
}else {
	var crit_chance = 0;
}
if crit_chance > 100 - global.crit_percentage {
	var crit_dmg_mult = 2;
}else {
	var crit_dmg_mult = 1;
}
random_set_seed(global.seed);

if(boss_projectile==false){
if(!other.invinsible) and damage != 0 and other.hp > 0 {
    var laser_damage = 0.9; //apply damage buff differently for laser
	var slime_damage = 0.7; //apply damage buff differently for slime
	
	if gun_name = "Sniper Rifle" {
		if !scr_In_Array(sniped_array,other) {
			if(!other.is_dead) {
				other.hp -= ((damage + global.damage_buff - (global.damage_buff * laser_damage * (gun_name = "Laser Gun" and global.damage_buff > 0)) - (global.damage_buff * slime_damage * (gun_name = "Slime Blaster" and global.damage_buff > 0))) * global.capitalist_damage) * other.bullet_defense * crit_dmg_mult;
				other.red_frames = 10;
	
				scr_Reload_On_Kill();
			}
			sniped = true;
			sniped_array[array_length(sniped_array)] = other;
			with obj_projectile {
				if gun_name = "Sniper Rifle" {
					sniped_array = other.sniped_array;
				}
			}
			if crit_chance > 100 - global.crit_percentage {
				instance_create_depth(x - (hspd*2),y - (vspd*2),depth,obj_criticalhit);
			}
		}
	}else if gun_name = "Yo-yo" {
		if !scr_In_Array(yoyo_array,other) and retracted = false {
			if(!other.is_dead) {
				other.hp -= ((damage + global.damage_buff - (global.damage_buff * laser_damage * (gun_name = "Laser Gun" and global.damage_buff > 0)) - (global.damage_buff * slime_damage * (gun_name = "Slime Blaster" and global.damage_buff > 0))) * global.capitalist_damage) * other.bullet_defense * crit_dmg_mult;
				other.red_frames = 10;
	
				scr_Reload_On_Kill();
			}
			yoyo_array[array_length(yoyo_array)] = other;
			if crit_chance > 100 - global.crit_percentage {
				instance_create_depth(x - (hspd*2),y - (vspd*2),depth,obj_criticalhit);
			}
		}
		if !scr_In_Array(yoyo_array2,other) and retracted = true {
			if(!other.is_dead) {
				other.hp -= ((damage + global.damage_buff - (global.damage_buff * laser_damage * (gun_name = "Laser Gun" and global.damage_buff > 0)) - (global.damage_buff * slime_damage * (gun_name = "Slime Blaster" and global.damage_buff > 0))) * global.capitalist_damage) * other.bullet_defense * crit_dmg_mult;
				other.red_frames = 10;
	
				scr_Reload_On_Kill();
			}
			yoyo_array2[array_length(yoyo_array2)] = other;
			if crit_chance > 100 - global.crit_percentage {
				instance_create_depth(x - (hspd*2),y - (vspd*2),depth,obj_criticalhit);
			}
		}
	}else if gun_name = "Puncher" {
		enemy_object = other;
		if !scr_In_Array(enemies_array,enemy_object) {
			array_resize(enemies_array,array_length(enemies_array)+1);
			enemies_array[array_length(enemies_array)-1] = enemy_object;
			enemy_object.hp -= ((damage + global.damage_buff - (global.damage_buff)) * global.capitalist_damage) * enemy_object.bullet_defense * crit_dmg_mult;
			enemy_object.red_frames = 10;
			scr_Reload_On_Kill();
			randomize();
			audio_play_sound(choose(snd_puncher1,snd_puncher2),0,false);
			random_set_seed(global.seed);
			if crit_chance > 100 - global.crit_percentage {
				instance_create_depth(x - (hspd*2),y - (vspd*2),depth,obj_criticalhit);
			}
		}
	}else if gun_name = "Plasma Gun" {
		enemy_object = other;
		if !scr_In_Array(enemies_array,enemy_object) {
			array_resize(enemies_array,array_length(enemies_array)+1);
			enemies_array[array_length(enemies_array)-1] = enemy_object;
			enemy_object.hp -= ((damage + global.damage_buff - (global.damage_buff)) * global.capitalist_damage) * enemy_object.bullet_defense * crit_dmg_mult;
			enemy_object.red_frames = 10;
			scr_Reload_On_Kill();
			if crit_chance > 100 - global.crit_percentage {
				instance_create_depth(x - (hspd*2),y - (vspd*2),depth,obj_criticalhit);
			}
		}
	}else if gun_name = "Snow Cannon"  {
		
		enemy_object = other;
		if !scr_In_Array(enemies_array,enemy_object) {
			array_resize(enemies_array,array_length(enemies_array)+1);
			enemies_array[array_length(enemies_array)-1] = enemy_object;
			if !scr_In_Array(global.boss_rooms,room) {
				if enemy_object.hp > damage {
					enemy_object.hp = 1;
					//freeze implementation here
					enemy_object.snowball_x = enemy_object.x;
					enemy_object.snowball_y = enemy_object.y;
					enemy_object.snowball_frame = enemy_object.image_index;
					enemy_object.snowball_sprite = enemy_object.sprite_index;
					enemy_object.snowball_freeze = true;
					audio_play_sound(snd_snowcannon_freeze,0,false);
					exit;
				}else {
					enemy_object.hp = 0;
				}
			}else {
				enemy_object.hp -= ((20 + global.damage_buff - (global.damage_buff)) * global.capitalist_damage) * enemy_object.bullet_defense * crit_dmg_mult;
			}
			enemy_object.red_frames = 10;
			scr_Reload_On_Kill();
			if crit_chance > 100 - global.crit_percentage {
				instance_create_depth(x - (hspd*2),y - (vspd*2),depth,obj_criticalhit);
			}
		}
	}else if gun_name = "Magnetic Disks" or gun_name = "Balloon Gun" {
		enemy_object = other;
		if !scr_In_Array(enemies_array,enemy_object) {
			array_resize(enemies_array,array_length(enemies_array)+1);
			enemies_array[array_length(enemies_array)-1] = enemy_object;
			enemy_object.hp -= ((damage + global.damage_buff - (global.damage_buff)) * global.capitalist_damage) * enemy_object.bullet_defense * crit_dmg_mult;
			enemy_object.red_frames = 10;
			scr_Reload_On_Kill();
			if crit_chance > 100 - global.crit_percentage {
				instance_create_depth(x - (hspd*2),y - (vspd*2),depth,obj_criticalhit);
			}
		}
		
		if gun_name = "Balloon Gun" {
			alarm[0] = 1;
		}
	}else if gun_name = "Harpoon Helmet" and damage > 0 {
		enemy_object = other;
		if !scr_In_Array(enemies_array,enemy_object) {
			array_resize(enemies_array,array_length(enemies_array)+1);
			enemies_array[array_length(enemies_array)-1] = enemy_object;
			enemy_object.hp -= (damage + global.damage_buff - (global.damage_buff)) * enemy_object.bullet_defense * crit_dmg_mult;
			enemy_object.red_frames = 10;
			scr_Reload_On_Kill();
			if crit_chance > 100 - global.crit_percentage {
				instance_create_depth(x - (hspd*2),y - (vspd*2),depth,obj_criticalhit);
			}
		}
	}else {
		if(!other.is_dead) {
			other.hp -= ((damage + global.damage_buff - (global.damage_buff * laser_damage * (gun_name = "Laser Gun" and global.damage_buff > 0)) - (global.damage_buff * slime_damage * (gun_name = "Slime Blaster" and global.damage_buff > 0))) * global.capitalist_damage) * other.bullet_defense * crit_dmg_mult;
			other.red_frames = 10;
	
			scr_Reload_On_Kill();
		}
		if crit_chance > 100 - global.crit_percentage {
			instance_create_depth(x - (hspd*2),y - (vspd*2),depth,obj_criticalhit);
		}
	}
	
	if (gun_name = "The Portal") {
		if obj_player.gun_array[obj_player.current_gun] = obj_player.portal_gun {
			obj_player.gun_array[obj_player.current_gun].current_bullets = 1;
		}
	}
	
	if object_get_name(other.object_index) = "obj_boss_basketball" {
		with other {
			var proj_obj = other;
			if !scr_In_Array(projectile_array,proj_obj) and spin_mode = false {
				scr_Screen_Shake(3,3,false);
				//audio_play_sound(snd_volleyball,0,false);
				scale = 1.25;
				speed = 8;
				direction = point_direction(proj_obj.x,proj_obj.y,x,y);
				var prev_spd = speed;
				var prev_dir = direction;
				speed = prev_spd;
				direction = prev_dir;
				hspeed += proj_obj.hspeed/3;
				hspeed += proj_obj.hspd/3;
				vspeed += proj_obj.vspeed/3;
				vspeed += proj_obj.vspd/3;
				array_resize(projectile_array,array_length(projectile_array)+1)
				projectile_array[array_length(projectile_array)-1] = proj_obj;

				audio_play_sound(snd_basketball_bounce,0,false);
				audio_play_sound(snd_boss_hitscan,0,false);
				free = false;
			}
		}
	}
	
	if (destroy_on_impact) or (gun_name = "Missile Launcher") or (gun_name = "Tracker Darts") or (gun_name = "Bullet Blast") or (gun_name = "Javelins") {
		alarm[0] = 1;
		if (gun_name = "Tracker Darts") {
			if dart_created = false {
				var enemy = other;
				audio_play_sound(snd_boss_hitscan,0,false);
				with instance_create_depth(x,y,-5,obj_dart_stuck)	{
					other_depth = other.depth;
					depth = -5;
					image_angle = other.image_angle;
					damage = other.damage;
					parent_obj = enemy;
					if instance_exists(parent_obj) {
						parent_x_diff = x - parent_obj.x;
						parent_y_diff = y - parent_obj.y;
						if object_get_name(parent_obj.object_index) = "obj_boss_basketball" {
							basketball_stuck = true;
							parent_angle_init = parent_obj.rot_angle;
							parent_dir_init = point_direction(parent_obj.x,parent_obj.y,x,y);
							parent_dist_init = point_distance(parent_obj.x,parent_obj.y,x,y);
						}
					}
				}
				dart_created = true;
			}
		}
		//instance_destroy();
	}

	colliding_with_enemy = true;
	
}
}