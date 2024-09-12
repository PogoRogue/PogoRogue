/// @description Respawns after a few seconds.

// Inherit the parent event
//event_inherited();
if(is_dead) {
	alpha *= 0.9;
	mask_index = spr_nothing;
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
	}
	
	if add_to_combo = true {
		global.combo += 1;
		global.combo_length = global.combo_max;	
		global.enemy_killed = true;
		add_to_combo = false;
		
		with instance_create_depth(x+sprite_width/2,y+sprite_height/2,depth+1,obj_coin_spawner) {
			if global.combo < 5 {
				num_of_coins = global.combo;
			}else {
				num_of_coins = 5;
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