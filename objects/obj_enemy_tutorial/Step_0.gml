/// @description Respawns after a few seconds.

// Inherit the parent event
//event_inherited();
if(is_dead) {
	image_alpha *= 0.9;
	mask_index = spr_nothing;
	spd = 0;
	speed = 0;
	if image_alpha <= 0.005 {
		respawn = true;
		is_dead = false;
	}
} else if (hp <= 0) {
	is_dead = true;
	if (doOnce) {
		image_index = 1;
		doOnce = false;
		randomize();
		var random_death_sound = choose(snd_enemy_death,snd_enemy_death2,snd_enemy_death3);
		random_set_seed(global.seed);
		if !audio_is_playing(random_death_sound) {
			audio_play_sound(random_death_sound,0,false);
		}
		scr_Screen_Shake(2, 2, false);
	}
	
	if add_to_combo = true {
		global.combo += 1;
		global.combo_length = global.combo_max;	
		global.enemy_killed = true;
		add_to_combo = false;
		
		with instance_create_depth(x+sprite_width/2,y+sprite_height/2,depth-1,obj_coin_spawner) {
			if global.combo < 5 {
				num_of_coins = global.combo;
			}else {
				num_of_coins = 5;
			}
		}
	}else if init_add_to_combo = false {
		alarm_set(0, room_speed);
	}
}else {
	red_frames = 0;
}

if (respawn) {
	image_alpha *= 1.1;
	if (image_alpha >= 1) {
		hp = hp_max;
		image_alpha = 1;
		respawn = false;
	}
}
	