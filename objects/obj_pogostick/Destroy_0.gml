obj_player.state = obj_player.state_free;	
obj_player.sprite_index = obj_player.player_sprite;
obj_player.mask_index = spr_player_zekai;
obj_player.y -= 13;
audio_play_sound(snd_reload,0,false);
audio_stop_sound(snd_whirling);