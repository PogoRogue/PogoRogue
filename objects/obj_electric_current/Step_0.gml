/// @description Handle deactivation

if(!is_active) {
	power_on = false;
	//sprite_index = spr_electric_current_off;
	alarm[0] = room_speed * initial_delay;
	
}

if power_on {
	if bbox_right > obj_camera.x - obj_camera.view_w_half and bbox_left < obj_camera.x + obj_camera.view_w_half 
	and bbox_top > obj_camera.y - obj_camera.view_h_half and bbox_bottom < obj_camera.y + obj_camera.view_h_half {
		if !audio_is_playing(snd_laser_hazard) {
			sound = audio_play_sound(snd_laser_hazard,0,false);	
		}
	}
}else {
	if audio_is_playing(snd_laser_hazard) {
		audio_stop_sound(sound);	
	}
}

while !place_meeting(x-1,y,obj_ground) and image_xscale = 1 {
	x -= 1;
}

if laser_up = true {
	if laser_alpha < 1 {
		laser_alpha += 1/room_speed;
	}else {
		laser_up = false;
	}
}else {
	laser_alpha = 0;
}
