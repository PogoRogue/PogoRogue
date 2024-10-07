/// @description 

if(instance_exists(controller)) {
	switch(controller.current_state) {
		case BOSS2_STATES.IDLE:
			if(controller.state_has_changed && sprite_index == spr_boss2_slime_empty) {
				image_index = 0;
				sprite_index = spr_boss2_slime_raise;
				audio_play_sound(snd_bubbling, 0, false);
			}
			break;
		case BOSS2_STATES.VULNERABLE:
			if(controller.state_has_changed) {
				image_index = 0;
				sprite_index = spr_boss2_slime_drain;
				audio_play_sound(snd_bubbling, 0, false);
			}
			break;
	}
}

if (place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask))
and sprite_index != spr_boss2_slime_full {
	depth = obj_player.depth - 5;	
}else {
	if instance_exists(obj_boss_sequence_body) {
		depth = obj_boss_sequence_body.depth - 1;
	}
}
