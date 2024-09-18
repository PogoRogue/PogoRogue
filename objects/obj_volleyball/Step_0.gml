if cant_spawn = false {

	rot_angle -= hspeed;

	if spawning = true {
		if alpha < 1 {
			alpha += 0.05;
		}else {
			spawning = false;
			image_index = 0;
		}
	}else {
		vspeed += grav;
	}

	if place_meeting(x+hspeed+sign(hspeed),y,obj_ground) and !place_meeting(x,y,obj_room_gate_open) and !place_meeting(x,y,obj_room_gate_open_width_fitting) {
		var loop_max = 0;
		while !place_meeting(x+sign(hspeed),y,obj_ground) {
			x += sign(hspeed);
			loop_max += 1;
			if loop_max >= 15 {
				break;
			}
		}
		if abs(hspeed) > 4 {
			//scale = 1.25;	
		}
		hspeed *= -bounce_decay;
		if distance_to_object(obj_player) < 768 {
			randomize();
			audio_play_sound(choose(snd_volleyball_bounce,snd_volleyball_bounce2,snd_volleyball_bounce3),0,false);
			random_set_seed(global.seed);
			if distance_to_object(obj_player) > 384 {
				audio_group_set_gain(audiogroup_volleyball,(1-((distance_to_object(obj_player)-384)/(416+400))),100);
			}else {
				audio_group_set_gain(audiogroup_volleyball,1,100);	
			}
		}
	}

	if place_meeting(x,y+vspeed,obj_ground) and !place_meeting(x,y,obj_room_gate_open) and !place_meeting(x,y,obj_room_gate_open_width_fitting) {
		var loop_max = 0;
		while !place_meeting(x,y,obj_ground) {
			y += sign(vspeed);
			loop_max += 1;
			if loop_max >= 15 {
				break;
			}
		}
		//scale = 1.25;
		if vspeed > 0.2 {
			vspeed *= -bounce_decay;
		}else {
			//instance_destroy();
		}
		if distance_to_object(obj_player) < 768 {
			randomize();
			audio_play_sound(choose(snd_volleyball_bounce,snd_volleyball_bounce2,snd_volleyball_bounce3),0,false);
			random_set_seed(global.seed);
			if distance_to_object(obj_player) > 384 {
				audio_group_set_gain(audiogroup_volleyball,(1-((distance_to_object(obj_player)-384)/(416+400))),100);
			}else {
				audio_group_set_gain(audiogroup_volleyball,1,100);	
			}
		}
	}

	if place_meeting(x,y+vspeed,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) and vspeed > 0 {
		var loop_max = 0;
		while !place_meeting(x,y+sign(vspeed),obj_ground_oneway) {
			y += sign(vspeed);
			loop_max += 1;
			if loop_max >= 15 {
				break;
			}
		}
		if vspeed > 4 {
			vspeed *= -bounce_decay;
			//scale = 1.25;
		}else {
			vspeed *= -1;
		}
		if distance_to_object(obj_player) < 768 {
			randomize();
			audio_play_sound(choose(snd_volleyball_bounce,snd_volleyball_bounce2,snd_volleyball_bounce3),0,false);
			random_set_seed(global.seed);
			if distance_to_object(obj_player) > 384 {
				audio_group_set_gain(audiogroup_volleyball,(1-((distance_to_object(obj_player)-384)/(416+400))),100);
			}else {
				audio_group_set_gain(audiogroup_volleyball,1,100);	
			}
		}
		
	}
	
	if scale > 1 {
		scale -= 0.05;	
	}
	
	if !place_meeting(x,y,obj_enemy_parent) {
		enemies_array = [];	
	}
	
	if despawn = true {
		image_index = 1;
		if alpha > 0 {
			alpha -= 0.05;	
		}else {
			instance_destroy();	
		}
	}

}else {
	image_index = 2;
	hspeed = 0;
	vspeed = 0;
	if alpha < 1 and alpha_up = true {
		alpha += 0.1;
	}else {
		alpha_up = true = false;
	}
	if alpha > 0 and alpha_up = false {
		alpha -= 0.05;	
	}else if alpha_up = false {
		instance_destroy();
		with obj_player {
			pickup_volleyball.on_cooldown = false;
			pickup_volleyball.bounce_reset = 0;
		}
	}
}