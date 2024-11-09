/// @description Insert description here
// You can write your code in this editor

if can_die = false {
	hp = init_hp;
	is_dead = false;
}

// Inherit the parent event
event_inherited();

if freeze = false {
	rot_angle -= hspeed;
	if vspeed > 0 {
		grav += 0.001;
	}else if vspeed < 0 {
		grav -= 0.001;
	}
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
		scale = 1;
	}
	hspeed *= -bounce_decay;
	if distance_to_object(obj_player) < 768 {
		randomize();
		audio_play_sound(choose(snd_volleyball_bounce,snd_volleyball_bounce2,snd_volleyball_bounce3),0,false);
		random_set_seed(global.seed);
		if distance_to_object(obj_player) > 384 {
			//audio_group_set_gain(audiogroup_volleyball,(1-((distance_to_object(obj_player)-384)/(416+400))),100);
		}else {
			//audio_group_set_gain(audiogroup_volleyball,1,100);	
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
	scale = 1;
	if vspeed > 2 {
		vspeed *= -bounce_decay;
	}else {
		vspeed = 4 * sign(vspeed);
		vspeed *= -1;
	}
	if distance_to_object(obj_player) < 768 {
		randomize();
		audio_play_sound(choose(snd_volleyball_bounce,snd_volleyball_bounce2,snd_volleyball_bounce3),0,false);
		random_set_seed(global.seed);
		if distance_to_object(obj_player) > 384 {
			//audio_group_set_gain(audiogroup_volleyball,(1-((distance_to_object(obj_player)-384)/(416+400))),100);
		}else {
			//audio_group_set_gain(audiogroup_volleyball,1,100);	
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
	if vspeed > 6 {
		vspeed *= -bounce_decay;
		scale = 1;
	}else {
		vspeed *= -1;
	}
	
	if distance_to_object(obj_player) < 768 {
		randomize();
		audio_play_sound(choose(snd_volleyball_bounce,snd_volleyball_bounce2,snd_volleyball_bounce3),0,false);
		random_set_seed(global.seed);
		if distance_to_object(obj_player) > 384 {
			//(audiogroup_volleyball,(1-((distance_to_object(obj_player)-384)/(416+400))),100);
		}else {
			//audio_group_set_gain(audiogroup_volleyball,1,100);	
		}
	}
		
}
	
if scale > 1 {
	scale -= 0.05;	
}

if despawn = true {
	image_index = 1;
	if alpha > 0 {
		alpha -= 0.05;	
	}else {
		instance_destroy();	
	}
}

if megabounce_freeze = true and obj_player.state = obj_player.state_free {
	megabounce_freeze = false;
}

if megabounce_freeze = true {
	freeze = true;
	red_frames = 1;
	alarm[5] = 2;	
}

if freeze = true {
	x = freeze_x;
	y = freeze_y;
	image_index = freeze_frame;
	hspeed = 0;
	vspeed = 0;
	speed = 0;	
}

if hp <= 0 and died = false and megabounce_freeze = false and can_die {
	died = true;
	death_x = x;
	death_y = y;
	
	var current_angle = image_angle;
	
	
	//split
	if size = 4 {
		image_alpha = 0;
		//breakaway pieces
		instance_create_depth(x,y,depth,obj_basketball_breakaway,{
			sprite_index: spr_boss_basketball_left, 
			image_angle: rot_angle});
		instance_create_depth(x,y,depth,obj_basketball_breakaway,{
			sprite_index: spr_boss_basketball_right, 
			image_angle: rot_angle});
		
		//smaller balls
		instance_create_depth(x+16,y,depth+1,obj_boss_basketball,{
			sprite_index: spr_boss_soccerball,
			hp: 48,
			hp_max: 48,
			size: 3,
		});
		instance_create_depth(x-16,y,depth+1,obj_boss_basketball,{
			sprite_index: spr_boss_soccerball,
			hp: 48,
			hp_max: 48,
			size: 3
		});
	}else if size = 3 {
		image_alpha = 0;
		//breakaway pieces
		instance_create_depth(x,y,depth,obj_basketball_breakaway,{sprite_index: spr_boss_soccerball_left, image_angle: rot_angle});
		instance_create_depth(x,y,depth,obj_basketball_breakaway,{sprite_index: spr_boss_soccerball_right, image_angle: rot_angle});
		
		//smaller balls
		instance_create_depth(x+8,y,depth+1,obj_boss_basketball,{
			sprite_index: spr_boss_volleyball,
			hp: 24,
			hp_max: 24,
			size: 2
		});
		instance_create_depth(x-8,y,depth+1,obj_boss_basketball,{
			sprite_index: spr_boss_volleyball,
			hp: 24,
			hp_max: 24,
			size: 2
		});
	}else if size = 2 {
		image_alpha = 0;
		//breakaway pieces
		instance_create_depth(x,y,depth,obj_basketball_breakaway,{sprite_index: spr_boss_volleyball_top, image_angle: rot_angle});
		instance_create_depth(x,y,depth,obj_basketball_breakaway,{sprite_index: spr_boss_volleyball_left, image_angle: rot_angle});
		instance_create_depth(x,y,depth,obj_basketball_breakaway,{sprite_index: spr_boss_volleyball_right, image_angle: rot_angle});
		
		//smaller balls
		instance_create_depth(x+8,y,depth+1,obj_boss_basketball,{
			sprite_index: spr_boss_tennisball,
			hp: 8,
			hp_max: 8,
			size: 1
		});
		instance_create_depth(x-8,y,depth+1,obj_boss_basketball,{
			sprite_index: spr_boss_tennisball,
			hp: 8,
			hp_max: 8,
			size: 1
		});
	}else if size = 1 {
		
	}
	
	//create coins
	alarm[2] = 5;
}

if size = 1 {
	if (hp <= 0 or is_dead) and died2 = false {
		died2 = true;
		global.tennis_balls_left -= 1;
		if global.tennis_balls_left = 0 {
			global.tennis_balls_left -= 1;
			if global.phase = 1 {
				with instance_create_depth(x,y,-20,obj_coin_spawner) {
					num_of_coins = 50;
				}
			}else {
				with instance_create_depth(x,y,-20,obj_coin_spawner) {
					num_of_coins = 100;
				}
			}
		
			//portals
			if (room == room_boss_2B) {
				instance_create_layer(256, 384+56+6, "hazards", obj_shop_door); //544
				instance_create_layer(512-48, 384-56+6, "hazards", obj_boss_door); //436
			}
		}
	}
}

hspeed = clamp(hspeed,-5,5);
vspeed = clamp(vspeed,-12,12);

if instance_exists(obj_boss_ball_trigger) {
	bounce_decay = 1;
	if obj_player.state = obj_player.state_immobile {
		if prev_hspeed = 0 and prev_vspeed = 0 {
			prev_hspeed = hspeed;
			prev_vspeed = vspeed;
		}
		hspeed = 0;
		vspeed = 0;
	}
}else if bounce_decay = 1 {
	bounce_decay = 0.97;	
	hspeed = random_range(-2,-5);
	vspeed = prev_vspeed;
}