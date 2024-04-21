// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Pickups(){
	
	var all_states = [state_free,state_bouncing,state_chargejump,state_groundpound,state_firedash,state_bulletblast,state_freeze,state_parachute];

	
	pickup_nothing = {
		_name: "",                              //item name
		tagline: "",                            //item tagline (short description)
		gui_sprite: spr_pickup_empty,           //pickup gui sprite
		max_cooldown_time: 0,                   //reset cooldown time to this value on every use
		cooldown_time: 0,                       //actual cooldown value that decreases over time when used
		cooldown_text: "",                      //text description that shows how cooldowns work for this item
		on_cooldown: false,                     //is this pickup currently on cooldown
		states_to_call_in: [state_free],        //when this ability can be activated
		key_held: false,                        //do you need to hold the key to call this ability (true) or just press it (false)
		reload_on_bounce: false,                //does this ability recharge on bounce instead of cooldown?
		max_uses_per_bounce: 0,                 //how many times can you use this per bounce
		uses_per_bounce: 0,                     //same as max_uses_per_bounce, except this value changes
		bounce_reset: 1,                        //how many bounces it take to reset a cooldown, 1 = every bounce
		bounce_reset_max: 1,					//make same as bounce_reset
		enemies_count: 0,                       //how many enemies to kill to cooldown
		enemies_count_max: 0,					//how many enemies to kill to cooldown
		on_call: function() { }                 //specific actions to do when this event is called           
	};
	
	pickup_chargejump = {
		_name: "Charge Jump",
		tagline: "Hold while bouncing to launch yourself to great heights, damaging enemies in your path. Getting a kill with a charge jump resets its cooldown time.",
		gui_sprite: spr_pickup_chargejump,
		max_cooldown_time: 600,
		cooldown_time: 600,
		cooldown_text: "Cooldown: " + string(600 / 60) + "s",
		on_cooldown: false,
		states_to_call_in: [state_bouncing],
		key_held: true,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 0,
		on_call: function() {
			if (obj_player.animation_complete) and obj_player.state != obj_player.state_chargejump {
				obj_player.state = obj_player.state_chargejump;
				obj_player.rotation_speed = obj_player.rotation_speed * 0.65;
				if obj_player.rotation_speed < 2 {
					obj_player.rotation_speed = 2;
				}
			}
		}                  
	};
	
	pickup_groundpound = {
		_name: "Ground Pound",
		tagline: "Slam to the ground with massive power. Getting a kill with a ground pound resets its cooldown time.",
		gui_sprite: spr_pickup_groundpound,
		max_cooldown_time: 300,
		cooldown_time: 300,
		cooldown_text: "Cooldown: " + string(300 / 60) + "s",
		on_cooldown: false,
		states_to_call_in: [state_free,state_freeze],
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 0,
		on_call: function() {
			obj_player.state = obj_player.state_groundpound;
			obj_player.ground_pound_rise = true;
			obj_player.ground_pound_slam = false;
			obj_player.ground_pound_distance_risen = 0;
			obj_player.can_shoot = false;
		}
	};
	
	pickup_hatgun = {
		_name: "Hat Gun",
		tagline: "Shoot 3 pistol bullets from your head per bounce.",
		gui_sprite: spr_pickup_hatgun,
		max_cooldown_time: -1,
		cooldown_time: -1,
		cooldown_text: "Cooldown: On bounce" + " / kill",
		on_cooldown: false,
		states_to_call_in: [state_free,state_bouncing,state_chargejump,state_freeze,state_parachute],
		key_held: false,
		reload_on_bounce: true,
		max_uses_per_bounce: 3,
		uses_per_bounce: 3,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 0,
		on_call: function() {
			with obj_player {
				old_gun = gun;
				gun = hat_gun;
				image_angle += 180;
				x -= lengthdir_x(68,image_angle+90);
				y -= lengthdir_y(68,image_angle+90);
				scr_Shoot();
				x += lengthdir_x(68,image_angle+90);
				y += lengthdir_y(68,image_angle+90);
				image_angle -= 180;
				gun = old_gun;
			}
			uses_per_bounce -= 1;
			if uses_per_bounce <= 0 {
				on_cooldown = true;
			}
		}
	};
	
	pickup_shieldbubble = {
		_name: "Shield Bubble",
		tagline: "Create a shield around you. Lasts for 5s or until it is destroyed.",
		gui_sprite: spr_pickup_shieldbubble,
		max_cooldown_time: 600,
		cooldown_time: 600,
		cooldown_text: "Cooldown: " + string(600 / 60) + "s",
		on_cooldown: false,
		states_to_call_in: all_states,
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 0,
		on_call: function() {
			if !instance_exists(obj_shieldbubble) {
				instance_create_depth(obj_player.x,obj_player.y,obj_player.depth-2,obj_shieldbubble);
			}
		}
	};
	
	pickup_firedash = {
		_name: "Fire Dash",
		tagline: "Turn into a fireball and dash upwards, damaging enemies in your path. Each dash kill shortens its cooldown time by 4s.",
		gui_sprite: spr_pickup_firedash,
		max_cooldown_time: 480,
		cooldown_time: 480,
		cooldown_text: "Cooldown: " + string(480 / 60) + "s",
		on_cooldown: false,
		states_to_call_in: [state_free,state_freeze],
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 0,
		on_call: function() {
			if obj_player.state = obj_player.state_freeze {
				obj_player.pickup_freeze.on_cooldown = true;
			}
			cooldown_time = max_cooldown_time;
			obj_player.state = obj_player.state_firedash;
			obj_player.dash_time = obj_player.max_dash_time;
			on_cooldown = true;
			audio_play_sound(snd_whoosh,0,false);
		}
	};
	
	pickup_jetpack = {
		_name: "Jetpack",
		tagline: "A jetpack that gives you additional momentum when used. It has limited fuel, but can be easily refueled.",
		gui_sprite: spr_pickup_jetpack,
		max_cooldown_time: 60,
		cooldown_time: 60,
		cooldown_text: "Cooldown: 1/4 every bounce / kill",
		on_cooldown: false,
		states_to_call_in: [state_free,state_freeze],
		key_held: true,
		reload_on_bounce: true,
		max_uses_per_bounce: 1,
		uses_per_bounce: 1,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 0,
		on_call: function() {
			if cooldown_time > 0 {
				cooldown_time -= 1;
				with obj_player {
					//check if speed slower or faster than max speed to preserve momentum
					if (abs(speed) > 5.5 and vspeed < 0) {
						slower_than_max = false;
						current_max = speed;
					}else {
						slower_than_max = true;	
						current_max = 0;
					}
		
					//add momentum
					if obj_player_mask.top = false and obj_player_mask.bottom_left_corner = false and obj_player_mask.bottom_right_corner = false 
					and obj_player_mask.right = false and obj_player_mask.left = false {
						motion_add(angle - 90, vsp_basicjump * 0.12);
					}
		
					//set max speed
					if (speed > 5.5) {
						speed = max(5.5, current_max);
					}
					
					//smoke
					if other.cooldown_time % 2 = 0 { //every other frame
						instance_create_depth(x+lengthdir_x(16,image_angle)+lengthdir_x(12,image_angle+90),y+lengthdir_y(16,image_angle)+lengthdir_y(12,image_angle+90),depth+1,obj_jetpack_smoke);
						instance_create_depth(x+lengthdir_x(-16,image_angle)+lengthdir_x(12,image_angle+90),y+lengthdir_y(-16,image_angle)+lengthdir_y(12,image_angle+90),depth+1,obj_jetpack_smoke);
					}
					
					//sound
					if !audio_is_playing(snd_jetpack) {
						audio_play_sound(snd_jetpack,0,false);
					}
					
					//unfreeze if applicable
					if state = state_freeze {
						state = state_free;
						grv = init_grv;
						rotation_speed = original_rotation_speed;
						rotation_delay = rotation_speed / 10;
					}
				}
			}else {
				if audio_is_playing(snd_jetpack) {
					audio_stop_sound(snd_jetpack);
				}	
			}
			on_cooldown = true;
		}                  
	};
	
	pickup_slowmo = {
		_name: "Magic Stopwatch",
		tagline: "Slow down time for 10 seconds, allowing high-precision movement. Slow mo be canceled on re-press.",
		gui_sprite: spr_pickup_slowmo,
		max_cooldown_time: 1200,
		cooldown_time: 1200,
		cooldown_text: "Cooldown: " + string(1200 / 60) + "s",
		on_cooldown: false,
		states_to_call_in: all_states,
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 0,
		on_call: function() {
			if !instance_exists(obj_slowmo) {
				instance_create_depth(obj_player.x,obj_player.y,obj_player.depth+2,obj_slowmo);
			}
		}
	};
	
	pickup_bulletblast = {
		_name: "Bullet Blast",
		tagline: "Create a massive circular blast of bullets in all directions.",
		gui_sprite: spr_pickup_bulletblast,
		max_cooldown_time: 1200,
		cooldown_time: 1200,
		cooldown_text: "Cooldown: " + string(1200 / 60) + "s",
		on_cooldown: false,
		states_to_call_in: [state_free,state_freeze],
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 0,
		on_call: function() {
			obj_player.can_rotate = false;
			obj_player.can_shoot = false;
			obj_player.bulletblast_frames = 0;
			obj_player.temp_x = 0.5;
			obj_player.init_x = obj_player.x;
			obj_player.sprite_index = obj_player.player_sprite;
			obj_player.image_index = 0;
			obj_player.state = obj_player.state_bulletblast;
		}
	};
	
	pickup_reload = {
		_name: "Quick Reload",
		tagline: "Instantly reload all of your weapons.",
		gui_sprite: spr_pickup_reload,
		max_cooldown_time: 420,
		cooldown_time: 420,
		cooldown_text: "Cooldown: " + string(420 / 60) + "s",
		on_cooldown: false,
		states_to_call_in: all_states,
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 0,
		on_call: function() {
			
			with obj_player {
				if gun_1.current_bullets != gun_1.bullets_per_bounce+obj_player.max_ammo_buff and gun_1 != boomerang_gun { //reload bullets
					//reload sound
					audio_play_sound(snd_reload,0,false);
					gun_1.current_bullets = gun_1.bullets_per_bounce+obj_player.max_ammo_buff; //reload bullets	
					instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
					other.cooldown_time = other.max_cooldown_time;
					other.on_cooldown = true;
				}
				if gun_2.current_bullets != gun_2.bullets_per_bounce+obj_player.max_ammo_buff and gun_2 != boomerang_gun { //reload bullets
					//reload sound
					audio_play_sound(snd_reload,0,false);
					gun_2.current_bullets = gun_2.bullets_per_bounce+obj_player.max_ammo_buff; //reload bullets	
					instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
					other.cooldown_time = other.max_cooldown_time;
					other.on_cooldown = true;
				}
				if gun_3.current_bullets != gun_3.bullets_per_bounce+obj_player.max_ammo_buff and gun_3 != boomerang_gun { //reload bullets
					//reload sound
					audio_play_sound(snd_reload,0,false);
					gun_3.current_bullets = gun_3.bullets_per_bounce+obj_player.max_ammo_buff; //reload bullets	
					instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
					other.cooldown_time = other.max_cooldown_time;
					other.on_cooldown = true;
				}
			}
		}
	};
	
	pickup_camera = {
		_name: "Camera",
		tagline: "Snap a bright picture of every enemy on screen, dealing small amounts of damage to each of them.",
		gui_sprite: spr_pickup_camera,
		max_cooldown_time: -1,
		cooldown_time: -1,
		cooldown_text: "Cooldown: Every 4 kills",
		on_cooldown: false,
		states_to_call_in: all_states,
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 4,
		on_call: function() {
			audio_play_sound(snd_camera,0,false);
			instance_create_depth(obj_player.x,obj_player.y,obj_player.depth-1000,obj_camera_pickup);
			on_cooldown = true;
			enemies_count = enemies_count_max;
			on_cooldown = true;
		}
	};
	
	pickup_freeze = {
		_name: "Freeze",
		tagline: "Instantly freeze movement while mid-air, allowing you to fire in place on enemies below. Unfreeze after 3s or on re-press.",
		gui_sprite: spr_pickup_freeze,
		max_cooldown_time: -1,
		cooldown_time: -1 ,
		cooldown_text: "Cooldown: Every 3 bounces",
		on_cooldown: false,
		states_to_call_in: [state_free],
		key_held: false,
		reload_on_bounce: true,
		max_uses_per_bounce: 1,
		uses_per_bounce: 1,
		bounce_reset: 3,
		bounce_reset_max: 3,
		enemies_count: 0,
		enemies_count_max: 0,
		on_call: function() {
			with obj_player {
				audio_play_sound(snd_freeze,0,false);
				state = state_freeze;
				rotation_speed = 0;
				current_rotation_speed = 0;
				rotation_speed = original_rotation_speed * (2/3);
				rotation_delay = rotation_speed / 10;
				freeze_time = 180;
				freeze_angle = angle;
			}
			//uses_per_bounce -= 1;
			if uses_per_bounce <= 0 {
				//on_cooldown = true;
			}
		}
	};
	
	pickup_frenzy = {
		_name: "Frenzy",
		tagline: "All weapons are instantly reloaded, and bullets are unlimited without reloading for 5s.",
		gui_sprite: spr_pickup_frenzy,
		max_cooldown_time: 1200,
		cooldown_time: 1200,
		cooldown_text: "Cooldown: " + string(1200 / 60) + "s",
		on_cooldown: false,
		states_to_call_in: all_states,
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 0,
		on_call: function() {
			with obj_player {
				if frenzy = false {
					frenzy = true;
					frenzy_time = 300;
					alarm[3] = 300;
					gun_1.current_bullets = gun_1.bullets_per_bounce + max_ammo_buff;
					gun_2.current_bullets = gun_2.bullets_per_bounce + max_ammo_buff;
					gun_3.current_bullets = gun_3.bullets_per_bounce + max_ammo_buff;
					audio_play_sound(snd_frenzy,0,false);
				}
			}
		}
	};
	
	pickup_target = {
		_name: "Targeted Assassination",
		tagline: "Summon a giant crosshair that kills a random enemy on screen, or deals 20% damage to bosses.",
		gui_sprite: spr_pickup_target,
		max_cooldown_time: -1,
		cooldown_time: -1,
		cooldown_text: "Cooldown: Every 6 kills",
		on_cooldown: false,
		states_to_call_in: all_states,
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 6,
		on_call: function() {
			instance_create_depth(obj_player.x,obj_player.y,obj_player.depth-1000,obj_crosshair);
			on_cooldown = true;
			enemies_count = enemies_count_max;
		}
	};
	
	pickup_emergency = {
		_name: "Emergency Treatment",
		tagline: "Instantly restore 1 HP and generates an armored heart.",
		gui_sprite: spr_pickup_emergency,
		max_cooldown_time: -1,
		cooldown_time: -1,
		cooldown_text: "Cooldown: Every 15 kills",
		on_cooldown: false,
		states_to_call_in: all_states,
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 15,
		on_call: function() {
			with obj_player {
				//heart
				if hp < max_hp {
					hp += 8;	
					audio_play_sound(snd_heartPickup,0,false);
					with obj_player_health {
						heart_gain_num = other.hp;	
					}
				}
				
				//armored heart
				with obj_player {
					if armor_buff < max_armor_buff {
						armor_buff += 1;
						audio_play_sound(snd_ArmorHeart,0,false);
						with obj_player_health {
							heart_shield_gain_num = other.armor_buff;	
						}
					}
				}
			}
			enemies_count = enemies_count_max;
			on_cooldown = true;
		}
	};
	
	pickup_blink = {
		_name: "Blink",
		tagline: "Disappear, then reappear from any position on screen after 3s or on re-press. Return to your original position if your final location is off limits.",
		gui_sprite: spr_pickup_blink,
		max_cooldown_time: -1,
		cooldown_time: -1,
		cooldown_text: "Cooldown: Every 8 kills",
		on_cooldown: false,
		states_to_call_in: [state_free],
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 8,
		on_call: function() {
			obj_player.state = obj_player.state_blink;
			if !instance_exists(obj_blink_box) {
				instance_create_depth(obj_player.x+lengthdir_x(22,obj_player.angle+90),obj_player.y+lengthdir_y(22,obj_player.angle+90),obj_player.depth-10,obj_blink_box);
				audio_play_sound(snd_blink_despawn,0,false);
			}
			enemies_count = enemies_count_max;
			on_cooldown = true;
		}
	};
	
	pickup_parachute = {
		_name: "Parachute",
		tagline: "Open a parachute, slowing down your momentum as you fall.",
		gui_sprite: spr_pickup_parachute,
		max_cooldown_time: -1,
		cooldown_time: -1,
		cooldown_text: "Cooldown: None",
		on_cooldown: false,
		states_to_call_in: [state_free],
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 0,
		on_call: function() {
			if !instance_exists(obj_parachute) {
				with obj_player {
					if state != state_parachute {
						state = state_parachute;
						can_shoot = false;
					}
				}
				on_cooldown = true;
			}
		}                  
	};
}