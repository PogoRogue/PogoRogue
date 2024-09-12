if obj_player.table = true {
	if distance_to_point(obj_pogosmith_table.x+13,obj_pogosmith_table.y-20) > move_spd*2 and smithing = false {
		move_spd += 0.2;
		move_towards_point(obj_pogosmith_table.x+13,obj_pogosmith_table.y-20,move_spd);
		image_angle += 15;
		image_angle = image_angle % 360;
		
		if !audio_is_playing(snd_whirling) {
			audio_play_sound(snd_whirling,0,false);
		}
	}else {
		smithing = true;
	}
	
	if smithing = true {
		if !(image_angle >= 82.5 and image_angle <= 97.5) and !(image_angle >= 442.5 and image_angle <= 457.5) {
			image_angle += 15;
		}else {
			image_angle = 90;
			audio_stop_sound(snd_whirling);
		}
		x = obj_pogosmith_table.x+13;
		y = obj_pogosmith_table.y-20;
	}
}else if obj_pogosmith_table.sprite_index != spr_pogosmith_workbench_animation {
	move_spd += 0.2;
	if angle_spd < 15 {
		angle_spd += 0.25;	
	}
	image_angle -= angle_spd;
	if distance_to_point(obj_player.x+12,obj_player.y-20) > move_spd*2 {
		move_towards_point(obj_player.x+12,obj_player.y-20,move_spd);
		
		if !audio_is_playing(snd_whirling) {
			audio_play_sound(snd_whirling,0,false);
		}
	}else {
		instance_destroy();
		obj_player.state = obj_player.state_free;
		obj_player.sprite_index = obj_player.player_sprite;
	}
}else {
	x = obj_pogosmith_table.x+13;
	y = obj_pogosmith_table.y-20;
	image_angle = 90;
}

obj_player.can_rotate = false;

sprite_index = obj_player.pogostick_sprite;