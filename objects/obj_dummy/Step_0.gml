// Update red shader frames
red_frames = max(red_frames - 1, 0);

hp = 100;

//update center position
center_x_sprite = bbox_left + ((bbox_right - bbox_left)/2);
center_y_sprite = bbox_top + ((bbox_bottom - bbox_top)/2);
/*
if reload = false and red_frames != 0 {
	reload = true;
	
	//do on kill stuff
	with obj_player {
		//lower enemy kill cooldowns
		if pickups_array[0].enemies_count_max > 0 and pickups_array[0].enemies_count > 0 {
			pickups_array[0].enemies_count -= 1;
		}
		if pickups_array[1].enemies_count_max > 0 and pickups_array[1].enemies_count > 0 {
			pickups_array[1].enemies_count -= 1;
		}
		
		//recharge jetpack
		if pickups_array[0] = pickup_jetpack {
			pickups_array[0].cooldown_time += pickups_array[0].max_cooldown_time/4;
			if pickups_array[0].cooldown_time > pickups_array[0].max_cooldown_time {
				pickups_array[0].cooldown_time = pickups_array[0].max_cooldown_time;
			}
		}
		if pickups_array[1] = pickup_jetpack {
			pickups_array[1].cooldown_time += pickups_array[1].max_cooldown_time/4;
			if pickups_array[1].cooldown_time > pickups_array[1].max_cooldown_time {
				pickups_array[1].cooldown_time = pickups_array[1].max_cooldown_time;
			}
		}
	}
	
	with obj_heart_energy_gain {
		if sprite_index = spr_heart_energy_animation and !scr_Animation_Complete() and image_speed = 1 {
			sprite_index = spr_heart_energy_ui_gain;
			image_index = 0;
			audio_play_sound(snd_zap,0,false);
		}
	}
	hp = 0;
	scr_Reload_On_Kill();
}else if red_frames = 0 and reload = true {
	reload = false;
	hp = 100;
}