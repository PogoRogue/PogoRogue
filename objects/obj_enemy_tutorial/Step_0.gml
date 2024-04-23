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
		audio_play_sound(snd_enemyhurt,0,false);
		scr_Screen_Shake(2, 2, false);
	}
	
	if add_to_combo = true {
		global.combo += 1;
		global.combo_length = global.combo_max;	
		global.enemy_killed = true;
		add_to_combo = false;
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
	