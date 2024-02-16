/// @description shoot enemy

if image_index = 6 and fade_out = false {
	if room != room_boss_1 and room != room_boss_2 {
		with enemy_to_target {
			hp = 0;
			with obj_player {
				scr_Reload_On_Kill();	
			}
		}
	}else if room = room_boss_1 or room = room_boss_2 {
		with enemy_to_target {
			if object_get_name(object_index) = "obj_boss_sequence_body" or object_get_name(object_index) = "obj_boss_sphere" {
				hp -= hp_max/5;
				with obj_player {
					scr_Reload_On_Kill();	
				}
			}else {
				hp = 0;
				with obj_player {
					scr_Reload_On_Kill();	
				}
			}
		}
	}
	image_speed = 0;
	image_index = 7;
	fade_out = true;
	image_xscale = 1.5;
	image_yscale = 1.5;
	speed = 0;
	scr_Screen_Shake(6,15,false);
	audio_play_sound(snd_sniper,0,false);
}else if fade_out = true {
	x = enemy_to_target.x;
	y = enemy_to_target.y;	
}

if instance_exists(enemy_to_target) and fade_out = false {
	if speed_up < 12 {
		speed_up += 1;	
	}
	if point_distance(x,y,enemy_to_target.x,enemy_to_target.y) <= 100 {
		speed_multiply = point_distance(x,y,enemy_to_target.x,enemy_to_target.y) / 100;
	}
	if point_distance(x,y,enemy_to_target.x,enemy_to_target.y) >= speed_up*2*(speed_multiply+0.2) {
		move_towards_point(enemy_to_target.x,enemy_to_target.y,speed_up*(speed_multiply+0.2));
	}else {
		x = enemy_to_target.x;
		y = enemy_to_target.y;
		image_speed = 1;
		
		if image_index = 2 or image_index = 4 {
			if !audio_is_playing(snd_crosshair_blip) {
				audio_play_sound(snd_crosshair_blip,0,false);
			}
		}
	}
}else if fade_out = false {
	fade_out = true;
	speed = 0;
}

if fade_out = true {
	if instance_exists(enemy_to_target) {
		x = enemy_to_target.x;
		y = enemy_to_target.y;
	}
	image_alpha -= 0.05;
	if image_xscale > 1 {
		image_xscale -= 0.05;
	}
	if image_yscale > 1 {
		image_yscale -= 0.05;
	}
	if image_alpha <= 0 {
		instance_destroy();
	}
}