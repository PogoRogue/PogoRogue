// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Player_Damaged(damage){
	
	with obj_player {
		var armored = false;
		if !instance_exists(obj_shieldbubble) and invincible = false and invincibility = false and pogomode = false {
			if energy_buff > 0 {
				energy_buff -= 1;
				armored = true;
				with obj_player_health {
					heart_energy_lost_num = other.energy_buff+1;	
				}
				global.enemy_killed = true; //resume combo meter
				
				if global.paparazzi = true {
					audio_play_sound(snd_camera,0,false);
					instance_create_depth(obj_player.x,obj_player.y,obj_player.depth-1000,obj_camera_pickup,{damage: 3});
				}
			}else if armor_buff > 0 {
				armor_buff -= 1;
				armored = true;
				with obj_player_health {
					heart_shield_lost_num = other.armor_buff+1;	
				}
				global.enemy_killed = true; //resume combo meter
				
				if global.paparazzi = true {
					audio_play_sound(snd_camera,0,false);
					instance_create_depth(obj_player.x,obj_player.y,obj_player.depth-1000,obj_camera_pickup,{damage: 3});
				}
			}else {
				hp -= (damage);
				with obj_player_health {
					heart_lost_num = other.hp;	
				}
				global.enemy_killed = true; //resume combo meter
				
				if global.paparazzi = true {
					audio_play_sound(snd_camera,0,false);
					instance_create_depth(obj_player.x,obj_player.y,obj_player.depth-1000,obj_camera_pickup,{damage: 3});
				}
			}
			current_iframes = num_iframes;
			hspeed = -2 * sign(hspeed);
			vspeed = 0;
			
			// righteous Revenge passive item
			if(global.righteousrevenge == true){
				if damage_boost_active = false {
					damage_boost_active = true; // This variable is declared in obj_player Create Event.
					damage_boost_timer = 180 * global.bar_time_added;
				}else {
					damage_boost_timer = 180 * global.bar_time_added;	
				}
			}
		
			//combo reset
			//commented these out to experiement with other method
			//global.combo = 0;
			//global.combo_length = 0;
		
			if global.super_shield = false or global.super_shield = true and armored = false {
				global.combo_length -= (global.combo_max/5)*2;
			}
			
			//screen shake
			scr_Screen_Shake(8, 15, false);
			
			randomize();
			audio_play_sound(choose(snd_hurt,snd_hurt2,snd_hurt3),0,false);
			random_set_seed(global.seed);
		}else if invincible = false and invincibility = false and pogomode = false {
			current_iframes = num_iframes;
			hspeed = -2 * sign(hspeed);
			vspeed = 0;
			
			with obj_shieldbubble {
				instance_destroy();	
				audio_play_sound(snd_bubblepop,0,false);
			}
		}
	}
}