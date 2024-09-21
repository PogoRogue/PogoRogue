// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Pickups(){
	
	var all_states = [state_free,state_bouncing,state_chargejump,state_groundpound,state_firedash,state_bulletblast,state_freeze,state_parachute,state_shieldbubble,state_plasmacharge,state_megabounce,state_megabounce_charge,state_dragster];

	
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
		text_color: make_color_rgb(255,255,255),     //what color this item's text should show up as
		cost: 0,                                //how many coins this item costs to use
		is_synergy: false,						//is this item a synergy or not?
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
		text_color: make_color_rgb(180,82,82),
		cost: 0,
		is_synergy: false,
		on_call: function() {
			with obj_player {
				if (obj_player.animation_complete) and obj_player.state != obj_player.state_chargejump and launchpad = false and !place_meeting(x,y+4,obj_launchpad) {
					obj_player.state = obj_player.state_chargejump;
					obj_player.rotation_speed = obj_player.rotation_speed * 0.65;
					if obj_player.rotation_speed < 2 {
						obj_player.rotation_speed = 2;
					}
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
		text_color: make_color_rgb(167,123,91),
		cost: 0,
		is_synergy: false,
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
		tagline: "Shoot a bullet from your head. Each bounce, reload one bullet to a maximum of 3.",
		gui_sprite: spr_pickup_hatgun,
		max_cooldown_time: -1,
		cooldown_time: -1,
		cooldown_text: "Cooldown: On bounce" + " / kill",
		on_cooldown: false,
		states_to_call_in: [state_free,state_bouncing,state_chargejump,state_freeze,state_parachute],
		key_held: false,
		reload_on_bounce: true,
		max_uses_per_bounce: 2,
		uses_per_bounce: 2,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 0,
		text_color: make_color_rgb(207,138,203),
		cost: 0,
		is_synergy: false,
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
		text_color: make_color_rgb(207,138,203),
		cost: 0,
		is_synergy: false,
		on_call: function() {
			if !instance_exists(obj_shieldbubble) {
				instance_create_depth(obj_player.x,obj_player.y,obj_player.depth-2,obj_shieldbubble);
				//obj_player.state = obj_player.state_shieldbubble;
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
		text_color: make_color_rgb(211,160,104),
		cost: 0,
		is_synergy: false,
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
		tagline: "A jetpack that gives you additional momentum when used. It has limited fuel, but can be easily refueled with bounces or kills.",
		gui_sprite: spr_pickup_jetpack,
		max_cooldown_time: 100,
		cooldown_time: 100,
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
		text_color: make_color_rgb(138,176,96),
		cost: 0,
		is_synergy: false,
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
					//if other.cooldown_time % 2 = 0 { //every other frame
						instance_create_depth(x+lengthdir_x(16,image_angle)+lengthdir_x(12,image_angle+90),y+lengthdir_y(16,image_angle)+lengthdir_y(12,image_angle+90),depth+1,obj_jetpack_smoke);
						instance_create_depth(x+lengthdir_x(-16,image_angle)+lengthdir_x(12,image_angle+90),y+lengthdir_y(-16,image_angle)+lengthdir_y(12,image_angle+90),depth+1,obj_jetpack_smoke);
					//}
					
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
		tagline: "Slow down time for 15 seconds, allowing high-precision movement. Slow mo can be canceled on \nre-press.",
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
		text_color: make_color_rgb(123,114,67),
		cost: 0,
		is_synergy: false,
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
		text_color: make_color_rgb(207,138,203),
		cost: 0,
		is_synergy: false,
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
		text_color: make_color_rgb(184,181,185),
		cost: 0,
		is_synergy: false,
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
		text_color: make_color_rgb(237,225,158),
		cost: 0,
		is_synergy: false,
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
		tagline: "Reload your current weapon and instantly freeze your movement, allowing you to fire on enemies below. Unfreeze after 3s or on re-press.",
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
		text_color: make_color_rgb(104,194,211),
		cost: 0,
		is_synergy: false,
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
				//reload current weapon
				if gun_array[current_gun]._name != "Boomerangs" {
					gun_array[current_gun].current_bullets = gun_array[current_gun].bullets_per_bounce + max_ammo_buff;
				}
			}
			//uses_per_bounce -= 1;
			if uses_per_bounce <= 0 {
				//on_cooldown = true;
			}
		}
	};
	
	pickup_frenzy = {
		_name: "Frenzy",
		tagline: "All weapons are instantly reloaded, and bullets are unlimited without reloading for 5s. Getting a kill during this time lowers its cooldown time by 1s.",
		gui_sprite: spr_pickup_frenzy,
		max_cooldown_time: 1800,
		cooldown_time: 1800,
		cooldown_text: "Cooldown: " + string(1800 / 60) + "s",
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
		text_color: make_color_rgb(86,123,121),
		cost: 0,
		is_synergy: false,
		on_call: function() {
			with obj_player {
				if frenzy = false {
					frenzy = true;
					frenzy_time = 300 * global.bar_time_added;
					alarm[3] = 300 * global.bar_time_added;
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
		text_color: make_color_rgb(180,82,82),
		cost: 0,
		is_synergy: false,
		on_call: function() {
			instance_create_depth(obj_player.x,obj_player.y,obj_player.depth-1000,obj_crosshair);
			on_cooldown = true;
			enemies_count = enemies_count_max;
		}
	};
	
	pickup_emergency = {
		_name: "Emergency Treatment",
		tagline: "Instantly generates an armored heart.",
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
		text_color: make_color_rgb(242,240,229),
		cost: 0,
		is_synergy: false,
		on_call: function() {
			with obj_player {
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
		text_color: make_color_rgb(138,176,96),
		cost: 0,
		is_synergy: false,
		on_call: function() {
			obj_player.state = obj_player.state_blink;
			if !instance_exists(obj_blink_box) and !instance_exists(obj_blink_box) {
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
		text_color: make_color_rgb(178,180,126),
		cost: 0,
		is_synergy: false,
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
	
	pickup_grappling = {
		_name: "Grappling Helmet",
		tagline: "Press and hold to shoot a grappling hook from the top of your head, pulling you towards the wall it attaches to.",
		gui_sprite: spr_pickup_grappling,
		max_cooldown_time: -1,
		cooldown_time: -1,
		cooldown_text: "Cooldown: None",
		on_cooldown: false,
		states_to_call_in: [state_free,state_bouncing,state_chargejump,state_freeze,state_parachute],
		key_held: false,
		reload_on_bounce: true,
		max_uses_per_bounce: 1,
		uses_per_bounce: 1,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 0,
		text_color: make_color_rgb(138,176,96),
		cost: 0,
		is_synergy: false,
		on_call: function() {
			with obj_player {
				old_gun = gun;
				gun = grappling_gun;
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
	
	pickup_winners = {
		_name: "Winner's Mentality",
		tagline: "Spend 25 coins to summon a flying slot machine with a chance to win big. If you don't win, try again. That's what a winner \nwould do.",
		gui_sprite: spr_pickup_winners,
		max_cooldown_time: 0,
		cooldown_time: 0,
		cooldown_text: "Cooldown: " + "25 coins",
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
		text_color: make_color_rgb(237,225,158),
		cost: 25,
		is_synergy: false,
		on_call: function() {
			if global.num_of_coins >= obj_player.pickup_winners.cost and !instance_exists(obj_slot_machine) {
				with obj_player {
					instance_create_depth(x,y,depth,obj_slot_machine);
					instance_create_depth(obj_player.x+lengthdir_x(34,obj_player.angle+90),obj_player.y+lengthdir_y(34,obj_player.angle+90),obj_player.depth,obj_coin25);
				}
				//on_cooldown = true;
			}
		}
	};
	
	pickup_airbag = {
		_name: "Airbag",
		tagline: "Create a bouncy floating airbag below you. It reloads your weapon when \nbounced on. Every 10th airbag, gain a heart on \nbounce. Beep.",
		gui_sprite: spr_pickup_airbag,
		max_cooldown_time: 300,
		cooldown_time: 300,
		cooldown_text: "Cooldown: " + string(300 / 60) + "s",
		on_cooldown: false,
		states_to_call_in: [state_free,state_freeze,state_bulletblast,state_parachute],
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 0,
		text_color: make_color_rgb(242,240,229),
		cost: 0,
		is_synergy: false,
		on_call: function() {
			
			with obj_player {
				instance_create_depth(x,y,depth+1,obj_airbag2);
			}
			on_cooldown = true;
		}
	};
	
	pickup_invincibility = {
	_name: "Invincibility",
	tagline: "You are invincible to all forms of damage for 5s. Getting a kill during this time lowers its cooldown time \nby 5s.",
	gui_sprite: spr_pickup_invincibility,
	max_cooldown_time: 1800,
	cooldown_time: 1800,
	cooldown_text: "Cooldown: " + string(1800 / 60) + "s",
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
	text_color: make_color_rgb(237,225,158),
	cost: 0,
	is_synergy: false,
	on_call: function() {
			with obj_player {
				if invincibility = false {
					invincibility = true;
					invincibility_time = 300 * global.bar_time_added;
					alarm[6] = 300 * global.bar_time_added;
					audio_play_sound(snd_invincible,0,false);
				}
			}
		}
	};
	
	pickup_tripleshot = {
	_name: "Triple Shot",
	tagline: "For 8s, your single projectile weapons \nshoot in a spread of 3.",
	gui_sprite: spr_pickup_tripleshot,
	max_cooldown_time: 1500, //1800
	cooldown_time: 1500,
	cooldown_text: "Cooldown: " + string(1500 / 60) + "s",
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
	text_color: make_color_rgb(211,160,104),
	cost: 0,
	is_synergy: false,
	on_call: function() {
			with obj_player {
				if tripleshot = false {
					tripleshot = true;
					tripleshot_time = 480 * global.bar_time_added;
					alarm[9] = 480 * global.bar_time_added;
					audio_play_sound(snd_invincible,0,false);
				}
			}
		}
	};
	
	pickup_volleyball = {
		_name: "Volleyball",
		tagline: "Create a giant bouncy volleyball above your head. It can be spiked by the player when collided with and it damages enemies on conact.",
		gui_sprite: spr_pickup_volleyball,
		max_cooldown_time: -1,
		cooldown_time: -1 ,
		cooldown_text: "Cooldown: Every 10 bounces",
		on_cooldown: false,
		states_to_call_in: [state_free],
		key_held: false,
		reload_on_bounce: true,
		max_uses_per_bounce: 1,
		uses_per_bounce: 1,
		bounce_reset: 10,
		bounce_reset_max: 10,
		enemies_count: 0,
		enemies_count_max: 0,
		text_color: make_color_rgb(242,240,229),
		cost: 0,
		is_synergy: false,
		on_call: function() {
			with obj_player {
				if pickup_volleyball.on_cooldown = false {
					audio_play_sound(snd_blink_respawn,0,false);
					if instance_exists(obj_volleyball) {
						obj_volleyball.despawn = true;
					}
					pickup_volleyball.on_cooldown = true;
					pickup_volleyball.bounce_reset = pickup_volleyball.bounce_reset_max;
					instance_create_depth(x+lengthdir_x(128,image_angle+90),y+lengthdir_y(128,image_angle+90),depth+1,obj_volleyball);
				}
			}
		}
	};
	
	pickup_harpoon = {
		_name: "Harpoon Helmet",
		tagline: "Fire a sharp harpoon from the top of your head that attaches to walls. Dash through enemies who dare \nstand in your path.",
		gui_sprite: spr_pickup_synergy_harpoon,
		max_cooldown_time: -1,
		cooldown_time: -1,
		cooldown_text: "Cooldown: On None",
		on_cooldown: false,
		states_to_call_in: [state_free,state_bouncing,state_chargejump,state_freeze,state_parachute,state_groundpound],
		key_held: false,
		reload_on_bounce: true,
		max_uses_per_bounce: 1,
		uses_per_bounce: 1,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 0,
		text_color: make_color_rgb(75,128,202),
		cost: 0,
		is_synergy: true,
		base_item_sprite_1: spr_pickup_hatgun,
		base_item_sprite_2: spr_pickup_grappling,
		item_cost: 160, //only for synergies (item 1 + item 2 costs)
		on_call: function() {
			with obj_player {
				old_gun = gun;
				gun = harpoon_gun;
				image_angle += 180;
				x -= lengthdir_x(96,image_angle+90);
				y -= lengthdir_y(96,image_angle+90);
				scr_Shoot();
				x += lengthdir_x(96,image_angle+90);
				y += lengthdir_y(96,image_angle+90);
				image_angle -= 180;
				gun = old_gun;
			}
			uses_per_bounce -= 1;
			if uses_per_bounce <= 0 {
				on_cooldown = true;
			}
		}
	};
	
	pickup_pogomode = {
		_name: "Pogo Mode",
		tagline: "Frenzy and Invincibility are combined for 7s. Your other active item has no cooldown during this period. It's time to go pogo mode.",
		gui_sprite: spr_pickup_synergy_pogomode,
		max_cooldown_time: 2100,
		cooldown_time: 2100,
		cooldown_text: "Cooldown: " + string(2100 / 60) + "s",
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
		text_color: make_color_rgb(237,225,158),
		cost: 0,
		is_synergy: true,
		base_item_sprite_1: spr_pickup_frenzy,
		base_item_sprite_2: spr_pickup_invincibility,
		item_cost: 190, //only for synergies (item 1 + item 2 costs)
		on_call: function() {
			with obj_player {
				if pogomode = false {
					pogomode = true;
					pogomode_time = 420 * global.bar_time_added;
					alarm[8] = 420 * global.bar_time_added;
					gun_1.current_bullets = gun_1.bullets_per_bounce + max_ammo_buff;
					gun_2.current_bullets = gun_2.bullets_per_bounce + max_ammo_buff;
					gun_3.current_bullets = gun_3.bullets_per_bounce + max_ammo_buff;
					audio_play_sound(snd_frenzy,0,false);
					if pickups_array[0] != pickup_pogomode {
						if pickups_array[0] != pickup_jetpack {
							pickups_array[0].uses_per_bounce = pickups_array[0].max_uses_per_bounce;
							pickups_array[0].on_cooldown = false;
							pickups_array[0].bounce_reset = pickups_array[0].bounce_reset_max;
							pickups_array[0].cooldown_time = 0;
							pickups_array[0].enemies_count = 0;
						}else {
							pickups_array[0].cooldown_time = pickups_array[0].max_cooldown_time;
						}
					}else {
						if pickups_array[1] != pickup_pogomode {
							if pickups_array[1] != pickup_jetpack {
								pickups_array[1].uses_per_bounce = pickups_array[1].max_uses_per_bounce;
								pickups_array[1].on_cooldown = false;
								pickups_array[1].bounce_reset = pickups_array[1].bounce_reset_max;
								pickups_array[1].cooldown_time = 0;
								pickups_array[1].enemies_count = 0;
							}else {
								pickups_array[1].cooldown_time = pickups_array[1].max_cooldown_time;
							}
						}
					}
				}
			}
		}
	};
	
	pickup_launchpad = {
		_name: "Launch Pad",
		tagline: "Create a launch pad below you. It holds two homing missiles that launch when the pad is bounced on.",
		gui_sprite: spr_pickup_synergy_launchpad,
		max_cooldown_time: -1,
		cooldown_time: -1,
		cooldown_text: "Cooldown: Every 8 kills",
		on_cooldown: false,
		states_to_call_in: [state_free,state_freeze,state_bulletblast,state_parachute,state_groundpound],
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 8,
		text_color: make_color_rgb(207,138,203),
		cost: 0,
		is_synergy: true,
		base_item_sprite_1: spr_pickup_airbag,
		base_item_sprite_2: spr_pickup_target,
		item_cost: 140, //only for synergies (item 1 + item 2 costs)
		on_call: function() {
			
			with obj_player {
				instance_create_depth(x,y+48,depth+1,obj_launchpad);
			}
			on_cooldown = true;
			enemies_count = enemies_count_max;
		}
	};
	
	pickup_megabounce = {
		_name: "Mega Bounce",
		tagline: "Instantly slam to the ground with immense power, then aim, ready, and fire with a powerful charge jump! Getting a slam kill resets its cooldown time.",
		gui_sprite: spr_pickup_synergy_megabounce,
		max_cooldown_time: 600,
		cooldown_time: 600,
		cooldown_text: "Cooldown: " + string(600 / 60) + "s",
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
		text_color: make_color_rgb(180,82,82),
		cost: 0,
		is_synergy: true,
		base_item_sprite_1: spr_pickup_groundpound,
		base_item_sprite_2: spr_pickup_chargejump,
		item_cost: 115, //only for synergies (item 1 + item 2 costs)
		on_call: function() {
			obj_player.state = obj_player.state_megabounce;
			obj_player.ground_pound_rise = true;
			obj_player.ground_pound_slam = false;
			obj_player.ground_pound_distance_risen = 0;
			obj_player.can_shoot = false;
			if obj_player.vspeed > 0 {
				obj_player.slam_speed = obj_player.vspeed;
			}else {
				obj_player.slam_speed = 0;
			}
		}
	};
	
	pickup_jolt = {
		_name: "Jolt",
		tagline: "Instantly reload all of your weapons, and generate 3 temporary energy hearts. Getting a kill zaps life back into an energy heart.",
		gui_sprite: spr_pickup_synergy_jolt,
		max_cooldown_time: 2400,
		cooldown_time: 2400,
		cooldown_text: "Cooldown: " + string(2400 / 60) + "s",
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
		text_color: make_color_rgb(211,160,104),
		cost: 0,
		is_synergy: true,
		base_item_sprite_1: spr_pickup_reload,
		base_item_sprite_2: spr_pickup_emergency,
		item_cost: 115, //only for synergies (item 1 + item 2 costs)
		on_call: function() {
			if obj_player.energy_buff = 0 {
				with obj_player {
					if gun_1.current_bullets != gun_1.bullets_per_bounce+obj_player.max_ammo_buff and gun_1 != boomerang_gun { //reload bullets
						//reload sound
						audio_play_sound(snd_reload,0,false);
						gun_1.current_bullets = gun_1.bullets_per_bounce+obj_player.max_ammo_buff; //reload bullets	
						instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
					}
					if gun_2.current_bullets != gun_2.bullets_per_bounce+obj_player.max_ammo_buff and gun_2 != boomerang_gun { //reload bullets
						//reload sound
						audio_play_sound(snd_reload,0,false);
						gun_2.current_bullets = gun_2.bullets_per_bounce+obj_player.max_ammo_buff; //reload bullets	
						instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
					}
					if gun_3.current_bullets != gun_3.bullets_per_bounce+obj_player.max_ammo_buff and gun_3 != boomerang_gun { //reload bullets
						//reload sound
						audio_play_sound(snd_reload,0,false);
						gun_3.current_bullets = gun_3.bullets_per_bounce+obj_player.max_ammo_buff; //reload bullets	
						instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
					}
				
					//armored heart
					energy_buff = max_energy_buff;
					audio_play_sound(snd_zap,0,false);
					with obj_player_health {
						heart_energy_gain_num = other.energy_buff;	
						alarm[0] = 1;
					}
				}
			}
		}
	};
	
	pickup_hacker = {
		_name: "Hacker",
		tagline: "Slow down time for 10 seconds and summon a flying slot machine. While spinning, stop each reel with the press of a button.",
		gui_sprite: spr_pickup_synergy_hacker,
		max_cooldown_time: 0,
		cooldown_time: 0,
		cooldown_text: "Cooldown: " + "25 coins",
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
		text_color: make_color_rgb(138,176,96),
		cost: 25,
		is_synergy: true,
		base_item_sprite_1: spr_pickup_slowmo,
		base_item_sprite_2: spr_pickup_winners,
		item_cost: 185, //only for synergies (item 1 + item 2 costs)
		on_call: function() {
			if global.num_of_coins >= obj_player.pickup_hacker.cost and !instance_exists(obj_slot_machine2) and !instance_exists(obj_slowmo) {
				if !instance_exists(obj_slowmo) {
					instance_create_depth(obj_player.x,obj_player.y,obj_player.depth+2,obj_slowmo,{hacker: true});
				}
				with obj_player {
					instance_create_depth(x,y,depth,obj_slot_machine2);
					instance_create_depth(obj_player.x+lengthdir_x(34,obj_player.angle+90),obj_player.y+lengthdir_y(34,obj_player.angle+90),obj_player.depth,obj_coin25);
				}
				//on_cooldown = true;
			}
		}
	};
	
	pickup_blizzard = {
		_name: "Blizzard",
		tagline: "Summon a windy, icy blizzard that cuts through all enemies around you. It doesn't hurt you because you're built different.",
		gui_sprite: spr_pickup_synergy_blizzard,
		max_cooldown_time: 2400,
		cooldown_time: 2400,
		cooldown_text: "Cooldown: " + string(2400 / 60) + "s",
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
		text_color: make_color_rgb(104,194,211),
		cost: 0,
		is_synergy: true,
		base_item_sprite_1: spr_pickup_freeze,
		base_item_sprite_2: spr_pickup_bulletblast,
		item_cost: 155, //only for synergies (item 1 + item 2 costs)
		on_call: function() {
			if !instance_exists(obj_blizzard) {
				instance_create_depth(0,0,obj_player_health.depth+1,obj_blizzard)
			}
		}
	};
	
	pickup_dragster = {
		_name: "Dragster",
		tagline: "Perform a longer, more powerful Fire Dash. You shoot a parachute from your pogo stick to slow momentum and allow mid-dash turning. \nCancel on re-press.",
		gui_sprite: spr_pickup_synergy_dragster,
		max_cooldown_time: 900,
		cooldown_time: 900,
		cooldown_text: "Cooldown: " + string(900 / 60) + "s",
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
		text_color: make_color_rgb(184,181,185),
		cost: 0,
		is_synergy: true,
		base_item_sprite_1: spr_pickup_parachute,
		base_item_sprite_2: spr_pickup_firedash,
		item_cost: 115, //only for synergies (item 1 + item 2 costs)
		on_call: function() {
			cooldown_time = max_cooldown_time;
			obj_player.state = obj_player.state_dragster;
			obj_player.dash_time = obj_player.max_dash_time * 12;
			obj_player.speed = 10;
			if !instance_exists(obj_parachute_dragster) {
				instance_create_depth(obj_player.x,obj_player.y,obj_player.depth,obj_parachute_dragster);
			}
			//on_cooldown = true;
			audio_play_sound(snd_whoosh,0,false);
		}
	};
	
	pickup_wreckingball = {
		_name: "Wrecking Ball",
		tagline: "Create a large, spiky wrecking ball that swings from below you. With enough momentum, you can swing it around your head. Re-press \nbutton to retract.",
		gui_sprite: spr_pickup_synergy_wreckingball,
		max_cooldown_time: -1,
		cooldown_time: -1,
		cooldown_text: "Cooldown: None",
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
		text_color: make_color_rgb(134,129,136),
		cost: 0,
		is_synergy: true,
		base_item_sprite_1: spr_pickup_volleyball,
		base_item_sprite_2: spr_pickup_tripleshot,
		item_cost: 145, //only for synergies (item 1 + item 2 costs)
		on_call: function() {
			with obj_player {
			if !instance_exists(obj_wreckingball) {
					instance_create_depth(x+lengthdir_x(160,image_angle-90),y+lengthdir_y(160,image_angle-90),depth+1,obj_wreckingball);
				}
			}
		}
	};
	
	pickup_tacticalstrike = {
		_name: "Stealth Strike",
		tagline: "Go into Blink form for 5s with a longer range. While in this state, you are equipped with 3 missiles to strike enemies with.",
		gui_sprite: spr_pickup_synergy_tacticalstrike,
		max_cooldown_time: -1,
		cooldown_time: -1,
		cooldown_text: "Cooldown: Every 12 kills",
		on_cooldown: false,
		states_to_call_in: [state_free],
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		bounce_reset: 1,
		bounce_reset_max: 1,
		enemies_count: 0,
		enemies_count_max: 12,
		text_color: make_color_rgb(86,123,121),
		cost: 0,
		is_synergy: true,
		base_item_sprite_1: spr_pickup_jetpack,
		base_item_sprite_2: spr_pickup_blink,
		item_cost: 225, //only for synergies (item 1 + item 2 costs)
		on_call: function() {
			with obj_player {
				obj_player.state = obj_player.state_strike;
				if !instance_exists(obj_blink_box_strike) {
					instance_create_depth(obj_player.x+lengthdir_x(22,obj_player.angle+90),obj_player.y+lengthdir_y(22,obj_player.angle+90),obj_player.depth-10,obj_blink_box_strike);
					audio_play_sound(snd_blink_despawn,0,false);
				}
				pickup_tacticalstrike.on_cooldown = true;
			}
		}
	};
}