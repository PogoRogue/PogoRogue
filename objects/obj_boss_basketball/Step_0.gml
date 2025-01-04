/// @description Insert description here
// You can write your code in this editor

if can_die = false {
	hp = init_hp;
	is_dead = false;
}

// Inherit the parent event
event_inherited();

if freeze = false and spin_mode = false {
	rot_speed = hspeed;
	rot_angle -= hspeed;
	if vspeed > 0 {
		//grav += 0.0025;
	}else if vspeed < 0 {
		//grav -= 0.005;
	}
	vspeed += grav;
}

if place_meeting(x+hspeed+sign(hspeed),y,obj_ground) {
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
		if spin_mode = false and freeze = false {
			audio_play_sound(snd_basketball_bounce,0,false);
		}
		random_set_seed(global.seed);
		if distance_to_object(obj_player) > 384 {
			//audio_group_set_gain(audiogroup_volleyball,(1-((distance_to_object(obj_player)-384)/(416+400))),100);
		}else {
			//audio_group_set_gain(audiogroup_volleyball,1,100);	
		}
	}
}

if place_meeting(x,y+vspeed,obj_ground) {
	var loop_max = 0;
	while !place_meeting(x,y,obj_ground) {
		y += sign(vspeed);
		loop_max += 1;
		if loop_max >= 15 {
			break;
		}
	}
	scale = 1;
	if vspeed > 4 {
		vspeed *= -bounce_decay;
	}else if vspeed > 0 {
		vspeed = 8 * sign(vspeed);
		vspeed *= -1;
	}else {
		vspeed *= -bounce_decay;
	}
	grav = 0.21;
	if distance_to_object(obj_player) < 768 {
		randomize();
		if spin_mode = false and freeze = false {
			audio_play_sound(snd_basketball_bounce,0,false);
		}
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
		if spin_mode = false and freeze = false { 
			audio_play_sound(snd_basketball_bounce,0,false);
		}
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
			ball_index: 1
		});
		instance_create_depth(x-16,y,depth+1,obj_boss_basketball,{
			sprite_index: spr_boss_soccerball,
			hp: 48,
			hp_max: 48,
			size: 3,
			ball_index: 2
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
			size: 2,
			ball_index: 1
		});
		instance_create_depth(x-8,y,depth+1,obj_boss_basketball,{
			sprite_index: spr_boss_volleyball,
			hp: 24,
			hp_max: 24,
			size: 2,
			ball_index: 2
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
			size: 1,
			ball_index: 1
		});
		instance_create_depth(x-8,y,depth+1,obj_boss_basketball,{
			sprite_index: spr_boss_tennisball,
			hp: 8,
			hp_max: 8,
			size: 1,
			ball_index: 2
		});
	}else if size = 1 {
		image_alpha = 0;
		instance_create_depth(x,y,depth,obj_basketball_breakaway,{sprite_index: spr_boss_tennisball_left, image_angle: rot_angle});
		instance_create_depth(x,y,depth,obj_basketball_breakaway,{sprite_index: spr_boss_tennisball_right, image_angle: rot_angle});
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
				instance_create_layer(256, 384+56+6+300, "hazards", obj_shop_door); //544
				instance_create_layer(512-48, 384-56+6+300, "hazards", obj_boss_door); //436
				
				if global.phase = 1 {
					global.phase = 2;
					global.area_2_reached += 1
					scr_Save_Real("area_2_reached",global.area_2_reached); 
				}else if global.phase = 2 {
					global.phase = 3;
					global.area_3_reached += 1
					scr_Save_Real("area_3_reached",global.area_3_reached); 
				}
				
				audio_group_set_gain(audiogroup_music, 0, 1000);
				
				if global.steam_api = true {
					if !steam_get_achievement("ACHIEVEMENT_BALLS") {
						steam_set_achievement("ACHIEVEMENT_BALLS");
					}
				}
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
	alarm[3] = 300;
	if size = 2 {
		//alarm[4] = 180;
	}
}

if size = 2 and launched_num >= 6 {
	hp = 0;
	is_dead = true;
	scr_Reload_On_Kill();
}

//spike mode
if spike_mode = true {
	if size = 4 {
		mask_index = spr_boss_basketball;
		if sprite_index = spr_boss_basketball_spikes {
			if scr_Animation_Complete() or floor(image_index) >= 13 {
				image_index = 13;
				image_speed = 0;
				damage = 8;
			}
		}
	}
	
	if size = 2 {
		mask_index = spr_boss_volleyball;
		if sprite_index = spr_boss_volleyball_spikes {
			if scr_Animation_Complete() or floor(image_index) >= 10 {
				image_index = 11;
				sprite_index = spr_boss_volleyball;
				image_speed = 0;
				//damage = 8;
				instance_create_depth(x,y,depth+1,obj_boss_spike_shootv,{parent_index: other, image_index: 0, speed: 0, image_angle: rot_angle});
				instance_create_depth(x,y,depth+1,obj_boss_spike_shootv,{parent_index: other, image_index: 1, speed: 0, image_angle: rot_angle});
				instance_create_depth(x,y,depth+1,obj_boss_spike_shootv,{parent_index: other, image_index: 2, speed: 0, image_angle: rot_angle});
				instance_create_depth(x,y,depth+1,obj_boss_spike_shootv,{parent_index: other, image_index: 3, speed: 0, image_angle: rot_angle});
				instance_create_depth(x,y,depth+1,obj_boss_spike_shootv,{parent_index: other, image_index: 4, speed: 0, image_angle: rot_angle});
				instance_create_depth(x,y,depth+1,obj_boss_spike_shootv,{parent_index: other, image_index: 5, speed: 0, image_angle: rot_angle});
				spike_mode = false;
			}
		}
		if hspeed = 0 and vspeed = 0 and shot_spikes = false and image_index = 11 {
			
		}
	}
}else {
	damage = 0;
}

//spin mode
if (spin_mode = true) {
	speed *= 0.9;
	
	if abs(hspeed) < 0.1 {
		hspeed = 0;
	}
	if abs(vspeed < 0.1) {
		vspeed = 0;
	}
	
	if size = 1 {
		if abs(temp_spin_speed) < 12 and slow_down = false {
			temp_spin_speed *= 1.02;
		}
		if abs(temp_spin_speed) > 3 and slow_down = true {
			temp_spin_speed *= 0.95;
		}
		if hspeed = 0 and vspeed = 0 and slow_down = false {
			if (collision_line(x,y,x+lengthdir_x(512,rot_angle),y+lengthdir_y(512,rot_angle),obj_player_mask,false,true)
			or collision_line(x,y,x+lengthdir_x(512,rot_angle),y+lengthdir_y(512,rot_angle),obj_player,false,true)) {
				alarm[7] = 1;
			}
			
			if abs((rot_angle % 360) - (point_direction(x,y,obj_player.x+lengthdir_x(22,obj_player.angle+90),obj_player.y+lengthdir_y(22,obj_player.angle+90))  % 360)) <= 12
			or abs((rot_angle % 360) - (point_direction(x,y,obj_player.x+lengthdir_x(22,obj_player.angle+90),obj_player.y+lengthdir_y(22,obj_player.angle+90))  % 360)) >= 348 {
				alarm[7] = 1;
			}
		}
		rot_speed = temp_spin_speed;
		rot_angle -= rot_speed;
		
	}
	
	if size = 2 {
		rot_speed *= 0.9;
		if rot_speed <= 0.01 {
			rot_speed = 0;
		}
		rot_angle -= rot_speed;
	}
	
	if size = 4 {
		if abs(temp_spin_speed) < 12 {
			temp_spin_speed *= 1.02;
			rot_speed = temp_spin_speed;
			rot_angle -= rot_speed;
		}else if abs(rot_speed) > abs(last_spin_speed) {
			rot_speed *= 0.9;
			rot_angle -= rot_speed;
		
			shoot_delay -= 1;
		
			//shoot spikes
			if shot_spikes = false {
				instance_create_depth(x,y,-100,obj_boss_spike_shoot,{image_index: 0, speed: 0, image_angle: rot_angle});
				instance_create_depth(x,y,-100,obj_boss_spike_shoot,{image_index: 1, speed: 0, image_angle: rot_angle});
				instance_create_depth(x,y,-100,obj_boss_spike_shoot,{image_index: 2, speed: 0, image_angle: rot_angle});
				instance_create_depth(x,y,-100,obj_boss_spike_shoot,{image_index: 3, speed: 0, image_angle: rot_angle});
				instance_create_depth(x,y,-100,obj_boss_spike_shoot,{image_index: 4, speed: 0, image_angle: rot_angle});
				instance_create_depth(x,y,-100,obj_boss_spike_shoot,{image_index: 5, speed: 0, image_angle: rot_angle});
				instance_create_depth(x,y,-100,obj_boss_spike_shoot,{image_index: 6, speed: 0, image_angle: rot_angle});
				instance_create_depth(x,y,-100,obj_boss_spike_shoot,{image_index: 7, speed: 0, image_angle: rot_angle});
				shot_spikes = true;
				scr_Screen_Shake(5,10,false);
			}
		
			sprite_index = spr_boss_basketball;
			mask_index = spr_boss_basketball;
			image_index = 0;
			image_speed = 0;
			alarm[3] = 480;
			spike_mode = false;
			spin_mode = false;
			speed = prev_spd;
			direction = prev_dir;
		}
	}
}

//make basket
if can_die = true {
	if place_meeting(x,y,obj_basketball_make_large1) or place_meeting(x,y,obj_basketball_make_large2) or place_meeting(x,y,obj_basketball_make_large3) {
		
		if above_hoop = true {
			if hoop1_colliding = false and place_meeting(x,y,obj_basketball_make_large1) {
				hoop1_colliding = true;
				if hoop_array[0] = 0 {
					hoop_array[0] = 1;
				}else if hoop_array[1] = 0 {
					hoop_array[1] = 1;
				}else if hoop_array[2] = 0 {
					hoop_array[2] = 1;
				}
			}
			if hoop2_colliding = false and place_meeting(x,y,obj_basketball_make_large2) {
				hoop2_colliding = true;
				if hoop_array[0] = 0 {
					hoop_array[0] = 2;
				}else if hoop_array[1] = 0 {
					hoop_array[1] = 2;
				}else if hoop_array[2] = 0 {
					hoop_array[2] = 2;
				}
			}
			if hoop3_colliding = false and place_meeting(x,y,obj_basketball_make_large3) {
				hoop3_colliding = true;
				if hoop_array[0] = 0 {
					hoop_array[0] = 3;
				}else if hoop_array[1] = 0 {
					hoop_array[1] = 3;
				}else if hoop_array[2] = 0 {
					hoop_array[2] = 3;
				}
			}
		
			//make basket
			if array_length(hoop_array) >= 3 {
				if hoop_array[0] = 1 and hoop_array[1] = 2 and hoop_array[2] = 3 and !place_meeting(x,y,obj_basketball_hoop_large_mask_left) {
					hp = 0;
					audio_play_sound(snd_basketball_swish,0,false);
					with obj_basketball_scoreboard {
						frame += 1;	
					}
				}
			}	
		}
	}else {
		if distance_to_object(obj_basketball_make_large1) > 16
		and distance_to_object(obj_basketball_make_large2) > 16
		and distance_to_object(obj_basketball_make_large3) > 16 {
			hoop1_colliding = false;
			hoop2_colliding = false;
			hoop3_colliding = false;
			hoop_array = [0,0,0];
		}
	}
}

if bbox_bottom < obj_basketball_hoop_large_mask_left.y-5 {
	above_hoop = true;
}

if bbox_top > obj_basketball_hoop_large_mask_left.y+5 {
	if !(hoop_array[0] = 1) {
		above_hoop = false;
	}
}

if place_meeting(x,y,obj_basketball_hoop_large_mask_left) and spin_mode = true {
	above_hoop = false;
}

if above_hoop = true {
	depth = obj_basketball_hoop_large.depth + 5;
}else {
	depth = obj_basketball_hoop_large.depth - 5;
}