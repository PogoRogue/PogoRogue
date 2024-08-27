// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Shoot(){
	with obj_player {
		randomize();
		//play sound
		//audio_play_sound(gun.sound,10,false,random_range(0.8,1),0,random_range(0.8,1)); //play shooting sound, randomize gain and pitch
		
		//calculate distaence from center to tip of gun
		var dist = sprite_get_width(gun.sprite) - sprite_get_xoffset(gun.sprite);
		var damage_multiplier = 1;
		//sound
		if gun._name != "Paintball Gun" and gun._name != "Bouncy Ball Blaster" and gun._name != "Burst Fire Gun" {
			audio_play_sound(gun.sound,0,false);
		}else if gun._name = "Paintball Gun" {
			audio_play_sound(choose(snd_paintball1,snd_paintball2,snd_paintball3),0,false,1,0,random_range(0.8,1.2));
		}else if gun._name = "Bouncy Ball Blaster" {
			audio_play_sound(choose(snd_bbb1,snd_bbb2,snd_bbb3,snd_bbb4),0,false,1,0,random_range(0.9,1.1));
		}
		
		for (var i = 0; i < gun.spread_number; i++;) {
			var number_in_spread = i;
			var angle_ = image_angle + (i * gun.spread_angle) - ((gun.spread_number - 1) * (gun.spread_angle / 2));
			if gun = sixshooter_gun {
				if sixshooter_gun.spread_number = 1 {
					var angle_ = image_angle + (gun.spread_angle);
				}else {
					var angle_ = image_angle + (i * 45) - ((gun.spread_number - 1) * (45 / 2));
				}
			}
			var destroyOnImpact;
			destroyOnImpact = gun.ammo[bullet_index].destroy_on_impact;

			if(global.steadyhands){
				imageAngle = angle_ - 90;
			}else{
				randomize();
				imageAngle = angle_ + (random_range(-gun.inaccuracy,gun.inaccuracy)*(gun.ammo[bullet_index].firerate_end/gun.ammo[bullet_index].firerate))  - 90;
				random_set_seed(global.seed);
			}
			if(global.laststand and hp <= 8){
				damage_multiplier *= 2;
			}
			if(global.righteousrevenge and obj_player.damage_boost_active){
				damage_multiplier *= 2;
			}
			
			if gun.current_bullets > 0 or gun._name = "Hat Gun" or gun._name = "Bullet Blast" {
				instance_create_depth(x,y,init_depth-1,obj_projectile,{
					image_angle: imageAngle,
					sprite_index: gun.ammo[bullet_index].sprite,
					spd: gun.ammo[bullet_index].spd,
					destroy_on_impact: destroyOnImpact,
					destroy_time: gun.ammo[bullet_index].destroy_time,
					flash_frame: gun.ammo[bullet_index].flash_frame,
					gun_name: gun._name,
					grav_affected: gun.ammo[bullet_index].grav_affected,
					grv: gun.ammo[bullet_index].grv,
					num_of_bounces: gun.ammo[bullet_index].num_of_bounces + global.bouncy_bullets,
					bounce_amount: gun.ammo[bullet_index].bounce_amount,
					damage: gun.ammo[bullet_index].damage * (1 + ((global.sharpshooter = true and gun.current_bullets = gun.bullets_per_bounce) * 0.5)) * damage_multiplier,
					spread_index: number_in_spread,
				});
			}
			
			
			
			//screen shake
			
			scr_Screen_Shake(gun.ammo[bullet_index].screen_shake.magnitude, gun.ammo[bullet_index].screen_shake.frames,true);
			if (global.allow_screenshake and gun._name != "Water Gun" and gun._name != "Bubble Gun" ) {
				var controller_vibration = global.controller_vibration/100;
				gamepad_set_vibration(0, 1*controller_vibration, 1*controller_vibration);
			}
			
			//decrease ammo
			if gun.spread_number = 1 and frenzy = false and pogomode = false and aerial_assassin_frenzy = false and gun._name != "Javelins" {
				gun.current_bullets -= 1;
			}
			
			if gun.spread_number = 3 and gun._name = "Burst Fire Gun" and frenzy = false and pogomode = false and aerial_assassin_frenzy = false and gun._name != "Javelins" {
				gun.current_bullets -= 1/3;
			}
			
			//allow upward flames
			allow_flames = true;
			min_flames_speed = gun.max_speed - 1.5;
		}
		
		if gun.current_bullets >= 0 {
			
			//cancel ground pound
			if state = state_groundpound {
				vsp_basicjump = -6.6;
				state = state_free;
				ground_pound_rise = true;
				ground_pound_slam = false;
				ground_pound_distance_risen = 0;
				soundPlayed = false;
				pickup_groundpound.on_cooldown = true;
			}
			
			if state = state_parachute {
				with obj_parachute {
					retract = true;	
				}
			}
		
			//check if speed slower or faster than max speed to preserve momentum
			if (abs(speed) > abs(gun.max_speed) and vspeed < 0) {
				slower_than_max = false;
				current_max = speed;
			}else {
				slower_than_max = true;	
				current_max = 0;
			}
		
			//reset/preserve momentum
			if (gun.reset_momentum and slower_than_max) {
				speed = 0;
			}else if (gun.reset_momentum) {
				speed = current_max + (vsp_basicjump*gun.momentum_added);	
			}
		
			//add momentum
			motion_add(angle - 90, vsp_basicjump * gun.momentum_added);
		
			//set max speed for auto weapons
			if (abs(speed) > abs(gun.max_speed) and gun.full_auto = true) { //player cant exceed certain speed if full_auto = true
				speed = max(abs(gun.max_speed), abs(current_max));
			}
		
		}else {
			if audio_is_playing(snd_burstfire) and burstfire_gun.spread_number = 1 {
				audio_stop_sound(snd_burstfire);
			}
		}
		
		//iterate through ammo types
		if (bullet_index < array_length(gun.ammo) - 1) {
			bullet_index += 1;
		}else {
			bullet_index = 0;
		}
		
		//unfreeze if applicable
		if state = state_freeze {
			speed = 0;
			//state = state_free;
			//grv = init_grv;
			//rotation_speed = original_rotation_speed;
			//rotation_delay = rotation_speed / 10;
		}
		
		
		current_burst += 1;
		
		if current_burst = gun.burst_number {
			current_burst = 0;
		}
		
		if gun._name = "Burst Fire Gun" and (gun.current_bullets % gun.burst_number) != 0 and current_burst = 0 {
			gun.current_bullets = ceil(gun.current_bullets/gun.burst_number) * gun.burst_number;
			show_debug_message(gun.current_bullets);
		}
		random_set_seed(global.seed);
	}
}