/// @description Initiate Jump

if  !megabounce_freeze {
	h_spd = 2 * sign(player.x - x);
	vspeed = jump_height;

	sprite_index = spr_enemy_shoot_only

	if !is_dead { 
		audio_play_sound(snd_craig_jump,0,false);
	}
}