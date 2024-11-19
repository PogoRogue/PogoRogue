balloon_object = noone;
obj_player.sprite_index = obj_player.player_sprite;
obj_player.image_index = 0;

charge = 0;
charge_max = 10;
frames_to_charge = 80;
balloon_rotation = 0;
balloon_index = 0;
balloon_speed = 4;
balloon_scale = 1;
damage = 1;
obj_player.state = obj_player.state_balloon;
obj_player.balloon_gun.current_bullets += 1;

if !audio_is_playing(snd_plasma_charge) {
	audio_play_sound(snd_plasma_charge,0,false);
}