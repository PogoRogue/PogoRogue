// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Jump(add_to_jump){
	speed = vsp_basicjump+add_to_jump+((vsp_basicjump/10)*global.tightspring); //bounce speed
	direction = angle - 90; //bounce angle
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
	}
	else if gun.current_bullets != gun.bullets_per_bounce+obj_player.max_ammo_buff and gun != boomerang_gun { //reload bullets
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
	
	state = state_free;
	charge = 0;
	bouncing = false;
	
	if pickups_array[0].reload_on_bounce = true and pickups_array[0].on_cooldown = true {
		if pickups_array[0] != pickup_jetpack {
			pickups_array[0].bounce_reset -= 1;
			if pickups_array[0].bounce_reset <= 0 {
				pickups_array[0].uses_per_bounce = pickups_array[0].max_uses_per_bounce;
				pickups_array[0].cooldown_time = pickups_array[0].max_cooldown_time;
				pickups_array[0].on_cooldown = false;
				pickups_array[0].bounce_reset = pickups_array[0].bounce_reset_max;
			}
		}else {
			pickups_array[0].cooldown_time += pickups_array[0].max_cooldown_time/4;
			if pickups_array[0].cooldown_time > pickups_array[0].max_cooldown_time {
				pickups_array[0].cooldown_time = pickups_array[0].max_cooldown_time;
			}
		}
	}
	
	if pickups_array[1].reload_on_bounce = true and pickups_array[1].on_cooldown = true {
		if pickups_array[1] != pickup_jetpack {
			pickups_array[1].bounce_reset -= 1;
			if pickups_array[1].bounce_reset <= 0 {
				pickups_array[1].uses_per_bounce = pickups_array[1].max_uses_per_bounce;
				pickups_array[1].cooldown_time = pickups_array[1].max_cooldown_time;
				pickups_array[1].on_cooldown = false;
				pickups_array[1].bounce_reset = pickups_array[1].bounce_reset_max;
			}
		}else {
			pickups_array[1].cooldown_time += pickups_array[1].max_cooldown_time/4;
			if pickups_array[1].cooldown_time > pickups_array[1].max_cooldown_time {
				pickups_array[1].cooldown_time = pickups_array[1].max_cooldown_time;
			}
		}
	}
	
	//hat gun
	pickup_hatgun.uses_per_bounce = pickup_hatgun.max_uses_per_bounce;
	pickup_hatgun.on_cooldown = false;
	
	//flames
	allow_flames = false;
	min_flames_speed = 5.6;
	
	//bounce sound
	if !audio_is_playing(snd_groundpound) {
		if bounce_sound = true {
			audio_play_sound(snd_bounce,0,false);
			bounce_sound = not bounce_sound;
		}else {
			audio_play_sound(snd_bounce2,0,false);
			bounce_sound = not bounce_sound;
		}
	}
	
	//spring
	if place_meeting(x,y-vspeed,obj_spring) {
		if instance_place(x,y-vspeed,obj_spring).state = instance_place(x,y-vspeed,obj_spring).state_unsprung {
			state = state_free;
			vspeed = 0;
			if(global.tightspring) and vspeed = 0 {
				motion_add(90,12*1.2);
			}else if vspeed = 0 {
				motion_add(90,12);
			}
		}
		with instance_place(x,y-vspeed,obj_spring) {
			state = state_springing;
		}
	}
	global.water_index += 1;
}