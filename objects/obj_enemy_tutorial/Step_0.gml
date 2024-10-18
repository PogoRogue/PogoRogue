/// @description Respawns after a few seconds.

// Inherit the parent event
//event_inherited();
if(is_dead) {
	alpha *= 0.9;
	//mask_index = spr_nothing;
	spd = 0;
	speed = 0;
	if alpha <= 0.005 {
		respawn = true;
		is_dead = false;
	}
} else if (hp <= 0) {
	is_dead = true;
	if (doOnce) {
		sprite_index = spr_enemy_tutorial_animation;
		image_index = 0;
		image_speed = 1;
		show_red = true;
		alarm[1] = 8;
		doOnce = false;
		randomize();
		var random_death_sound = choose(snd_enemy_death,snd_enemy_death2,snd_enemy_death3);
		random_set_seed(global.seed);
		if !audio_is_playing(random_death_sound) {
			audio_play_sound(random_death_sound,0,false);
		}
		scr_Screen_Shake(2, 2, false);
		
		with obj_heart_energy_gain {
			if sprite_index = spr_heart_energy_animation and !scr_Animation_Complete() and image_speed = 1 {
				sprite_index = spr_heart_energy_ui_gain;
				image_index = 0;
				audio_play_sound(snd_zap,0,false);
			}
		}
	}
	
	if add_to_combo = true {
		global.combo += 1;
		global.combo_length = global.combo_max;	
		global.enemy_killed = true;
		add_to_combo = false;
		
		switch global.combo {
			case 1: audio_play_sound(snd_combo1,0,false); break;
			case 2: audio_play_sound(snd_combo2,0,false); break;
			case 3: audio_play_sound(snd_combo3,0,false); break;
			case 4: audio_play_sound(snd_combo4,0,false); break;
			case 5: audio_play_sound(snd_combo5,0,false); break;
			case 6: audio_play_sound(snd_combo6,0,false); break;
			case 7: audio_play_sound(snd_combo7,0,false); break;
			case 8: audio_play_sound(snd_combo8,0,false); break;
			case 9: audio_play_sound(snd_combo9,0,false); break;
			case 10: audio_play_sound(snd_combo10,0,false); break;
		}
		
		if global.combo > 10 {
			audio_play_sound(snd_combo10,0,false);
		}
		
		with instance_create_depth(x+sprite_width/2,y+sprite_height/2,depth+1,obj_coin_spawner) {
			if global.combo < 5 {
				num_of_coins = global.combo;
			}else {
				num_of_coins = 5;
			}
		}
		if room = room_starting_area {
			alarm_set(0, room_speed);	
		}
		
		with obj_player {
			//lower enemy kill cooldowns
			if pickups_array[0].enemies_count_max > 0 and pickups_array[0].enemies_count > 0 {
				//account for double/triple/quadruple kill passive
				if global.combo <= 10 or obj_player.double_kill = 0 {
					pickups_array[0].enemies_count -= 1;
				}else if global.combo > 10 and obj_player.double_kill = 1
				or global.combo > 10 and global.combo <= 20 and obj_player.double_kill > 1 {
					pickups_array[0].enemies_count -= 2;
				}else if global.combo > 20 and obj_player.double_kill = 2
				or global.combo > 20 and global.combo <= 30 and obj_player.double_kill > 2 {
					pickups_array[0].enemies_count -= 3;
				}else if global.combo > 30 and obj_player.double_kill > 2 {
					pickups_array[0].enemies_count -= 4;
				}
			}
			if pickups_array[1].enemies_count_max > 0 and pickups_array[1].enemies_count > 0 {
				//account for double/triple/quadruple kill passive
				if global.combo <= 10 or obj_player.double_kill = 0 {
					pickups_array[1].enemies_count -= 1;
				}else if global.combo > 10 and obj_player.double_kill = 1
				or global.combo > 10 and global.combo <= 20 and obj_player.double_kill > 1 {
					pickups_array[1].enemies_count -= 2;
				}else if global.combo > 20 and obj_player.double_kill = 2
				or global.combo > 20 and global.combo <= 30 and obj_player.double_kill > 2 {
					pickups_array[1].enemies_count -= 3;
				}else if global.combo > 30 and obj_player.double_kill > 2 {
					pickups_array[1].enemies_count -= 4;
				}
			}
		}
	}else if init_add_to_combo = false and y != 2272 {
		alarm_set(0, room_speed);
	}

}else {
	red_frames = 0;
}

if (respawn) {
	alpha *= 1.1;
	if (alpha >= 1) {
		hp = hp_max;
		alpha = 1;
		respawn = false;
	}
}
	
if image_speed = 1 and scr_Animation_Complete() {
	image_speed = 0;
	image_index = sprite_get_number(sprite_index)-1;
}

if image_index < 2 and image_speed = -1 {
	image_speed = 0;	
	image_index = 0;	
	if spawned = false {
		spawned = true;	
		sprite_index = spr_enemy_tutorial;
	}
}