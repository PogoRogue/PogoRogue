// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Jump(add_to_jump){
	
	if launchpad = true {
		add_to_jump = -3;	
		launchpad = false;
	}
	
	speed = vsp_basicjump+add_to_jump+((vsp_basicjump/10)*global.tightspring); //bounce spee
	direction = angle - 90; //bounce angle
	if speed < 0 {
		speed = abs(speed);
		direction = angle + 90;
	}
	hspeed += conveyor_speed;
	conveyor_speed = 0;
	sprite_index = player_sprite;
	image_speed = 0;
	image_index = 0; //reset animation to starting frame
	animation_complete = false;
	if(global.dualwielder == true){
		for(var i = 0; i < array_length(gun_array); i++){
			var gun_temp = gun_array[i];
			if gun_temp.current_bullets != gun_temp.bullets_per_bounce {
				audio_play_sound(snd_reload,0,false);
				instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);	
				gun_temp.current_bullets = gun_temp.bullets_per_bounce;
			}
		}
	}else if gun.current_bullets != gun.bullets_per_bounce+obj_player.max_ammo_buff and gun != boomerang_gun and gun != portal_gun { //reload bullets
		//reload sound
		audio_play_sound(snd_reload,0,false);
		gun.current_bullets = gun.bullets_per_bounce+obj_player.max_ammo_buff; //reload bullets	

		instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
	}else if gun.current_bullets != gun.bullets_per_bounce+obj_player.max_ammo_buff and gun = boomerang_gun { //boomerang
		if !instance_exists(obj_projectile) {
			//reload sound
			audio_play_sound(snd_reload,0,false);
			gun.current_bullets = gun.bullets_per_bounce+obj_player.max_ammo_buff; //reload bullets	
			instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
		}
	}
	
	gun.ammo[bullet_index].firerate = gun.ammo[bullet_index].firerate_start;
	
	state = state_free;
	charge = 0;
	bouncing = false;
	
	if pickups_array[0].reload_on_bounce = true and pickups_array[0].on_cooldown = true {
		if pickups_array[0] != pickup_jetpack {
			pickups_array[0].bounce_reset -= 1;
			if pickups_array[0].bounce_reset <= 0 {
				//pickups_array[0].uses_per_bounce = pickups_array[0].max_uses_per_bounce;
				pickups_array[0].cooldown_time = pickups_array[0].max_cooldown_time;
				pickups_array[0].on_cooldown = false;
				pickups_array[0].bounce_reset = pickups_array[0].bounce_reset_max;
			}
		}else {
			if global.impatience = false {
				pickups_array[0].cooldown_time += pickups_array[0].max_cooldown_time/4;
			}else {
				pickups_array[0].cooldown_time += pickups_array[0].max_cooldown_time/3;
			}
			if pickups_array[0].cooldown_time > pickups_array[0].max_cooldown_time {
				pickups_array[0].cooldown_time = pickups_array[0].max_cooldown_time;
			}
		}
	}
	
	if pickups_array[1].reload_on_bounce = true and pickups_array[1].on_cooldown = true {
		if pickups_array[1] != pickup_jetpack {
			pickups_array[1].bounce_reset -= 1;
			if pickups_array[1].bounce_reset <= 0 {
				//pickups_array[1].uses_per_bounce = pickups_array[1].max_uses_per_bounce;
				pickups_array[1].cooldown_time = pickups_array[1].max_cooldown_time;
				pickups_array[1].on_cooldown = false;
				pickups_array[1].bounce_reset = pickups_array[1].bounce_reset_max;
			}
		}else {
			if global.impatience = false {
				pickups_array[1].cooldown_time += pickups_array[1].max_cooldown_time/4;
			}else {
				pickups_array[1].cooldown_time += pickups_array[1].max_cooldown_time/3;
			}
			if pickups_array[1].cooldown_time > pickups_array[1].max_cooldown_time {
				pickups_array[1].cooldown_time = pickups_array[1].max_cooldown_time;
			}
		}
	}
	
	//hat gun
	if pickup_hatgun.uses_per_bounce < pickup_hatgun.max_uses_per_bounce {
		pickup_hatgun.uses_per_bounce += 1;
	}
	pickup_hatgun.on_cooldown = false;
	
	//grappling helmet
	pickup_grappling.uses_per_bounce = pickup_grappling.max_uses_per_bounce;
	pickup_grappling.on_cooldown = false;
	
	grappling_gun.current_bullets = 1;
	
	//harpoon helmet
	pickup_harpoon.uses_per_bounce = pickup_harpoon.max_uses_per_bounce;
	pickup_harpoon.on_cooldown = false;
	
	harpoon_gun.current_bullets = 1;
	
	//flames
	allow_flames = false;
	min_flames_speed = 5.6;
	
	//bounce sound
	if !audio_is_playing(snd_groundpound) {
		randomize();
		audio_play_sound(choose(snd_bounce,snd_bounce2,snd_bounce3),0,false);
		random_set_seed(global.seed);
		/*if bounce_sound = true {
			audio_play_sound(snd_bounce,0,false);
			bounce_sound = not bounce_sound;
		}else {
			audio_play_sound(snd_bounce2,0,false);
			bounce_sound = not bounce_sound;
		}*/
	}
	
	//spring
	if place_meeting(x,y-vspeed,obj_spring) {
		if instance_place(x,y-vspeed,obj_spring).state = instance_place(x,y-vspeed,obj_spring).state_unsprung {
			with instance_place(x,y-vspeed,obj_spring) {
				state = state_springing;
				audio_play_sound(snd_springboard,0,false);
			}
			state = state_free;
			vspeed = 0;
			if(global.tightspring) and vspeed = 0 {
				motion_add(90,(12+abs(add_to_jump/1.5))*1.2);
			}else if vspeed = 0 {
				motion_add(90,(12+abs(add_to_jump/1.5)));
			}
		}
	}
	if place_meeting(x,y+vspeed,obj_spring) {
		if instance_place(x,y+vspeed,obj_spring).state = instance_place(x,y+vspeed,obj_spring).state_unsprung {
			with instance_place(x,y+vspeed,obj_spring) {
				state = state_springing;
				audio_play_sound(snd_springboard,0,false);
			}
			state = state_free;
			vspeed = 0;
			if(global.tightspring) and vspeed = 0 {
				motion_add(90,(12+abs(add_to_jump/1.5))*1.2);
			}else if vspeed = 0 {
				motion_add(90,(12+abs(add_to_jump/1.5)));
			}
		}
	}
	global.water_index += 1;
}