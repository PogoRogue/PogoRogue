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
	alarm_set(0, room_speed);
}

if (respawn) {
	image_alpha *= 1.1;
	if (image_alpha >= 1) {
		hp = hp_max;
		image_alpha = 1;
		respawn = false;
	}
}
	