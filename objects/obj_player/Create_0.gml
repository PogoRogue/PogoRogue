/// @description initialize variables
//movement stats
grv = 0.21; //gravity
init_grv = grv; //initial gravity
h_grv = 0.01; //horizontal drag
rotation_speed = 3; //rotation speed
original_rotation_speed = global.tilt_speed;
current_rotation_speed = 0;
rotation_delay = rotation_speed / 10; //0.5
temp_rotation_speed = 2; //rotation speed
temp_rotation_delay = temp_rotation_speed / 6; //0.5
vsp_basicjump = -6.6; //bounce height
angle = 0;
anglemax = 38; //maximum degrees added on either side
bouncing = false; //bouncing animation when true
bounce_sound = true; //alternating pitch
shop_bouncing = false; //only use this var in the shop
animation_complete = false; //bounce animation before jumping
use_mouse = false; //use mouse to control instead of WASD/Arrow keys?
mouse_sensitivity = 200; //the lower the value, the more sensitive the player is to mouse movement and vice versa
mouse_reanglespeed = 6; //the lower the value, the faster the player will reangle itself and vice versa
invert = false;
free = true; //pogo not colliding with wall, this variable ensures the player doesn't get stuck in walls
not_colliding = true; //prevent glitches with wall collision
conveyor_speed = 0;
platform_speed = 0;
platform_index = noone;
can_rotate = true;
can_shoot = true;
platform_on = true;
centering = false;
current_burst = 0;
weapon_arrow_index = 0;
table = false;
launchpad = false;

//weapons
portal_object = noone;
portal_speed = 0;
portal_angle_speed = 0;
portal_rot_distance = 0;
used_shop_portal = false;
sixshooter_held = false;
sixshooter_held_num = 0;
fullauto_condtional = true;
temp_xscale = 1;
new_angle = 0;
new_xscale = 1;

//buffs
damage_buff = 0;
max_ammo_buff = 0;
max_max_ammo_buff = 5; //max amount this buff can be received
laser_sight = false;
planetary_bullets = 0;
aerial_assassin_count = 0;
revive_time = 0;
revive_alpha = 0;
impatience_used = false;
damage_boost_active = false;
damage_boost_timer = 0;
landed_on_enemy = false; // for robbery 
aerial_assassin_frenzy = false;
aerial_assassin_frenzy_count = 0;
iframes_add = 0;
double_kill = 0;

//pickups
charge = 0;
charge_max = vsp_basicjump;
slower_than_max = false; //ammo momentum for super jump
current_max = 0;
ground_pound_rise = false;
ground_pound_distance_risen = 0;
ground_pound_slam = false;
slam_speed = 12;
slam_trail_distance = 0;
invincible = false;
max_dash_time = 15;
dash_time = 15;
bubble = false;
bulletblast_frames = 0;
bulletblast_frames_max = 65; //how many frames before blasting
freeze_time = 0;
freeze_alpha = 0;
freeze_angle = 0;
frenzy = false;
frenzy_time = 0;
pogomode = false;
pogomode_time = 0;
tutorialDash = false; // Tutorial ground handler
grappling_hook = noone;
invincibility = false;
invincibility_time = 0;
invincibility_time_max = 300 * global.bar_time_added;
tripleshot = false;
tripleshot_time = 0;
tripleshot_time_max = 480 * global.bar_time_added;
shieldbubble_obj = noone;
harpoon_empty = false;
harpooning = false;
synergy_frame = 0;
megajump_centered = false;
end_of_charge = false;
wearing_hat = false;

//upward flames
min_flames_speed = 5.6;
allow_flames = false;

//set controls variables
key_right = 0;
key_left = 0;
key_fire_projectile = 0;
key_right_pressed = 0;
key_left_pressed = 0;
key_fire_projectile_pressed = 0;
key_pickup_1 = 0;
key_pickup_2 = 0;
key_pickup_1_pressed = 0;
key_pickup_2_pressed = 0;

//skins
bouncing_array = [spr_player_zekai,spr_player_skin1,spr_player_skin2,spr_player_skin3,spr_player_skin4,spr_player_skin5,spr_player_skin6];
charging_array = [spr_player_zekai_charging,spr_player_skin1_charging,spr_player_skin2_charging,spr_player_skin3_charging,spr_player_skin4_charging,spr_player_skin5_charging,spr_player_skin6_charging];
falling_array = [spr_player_zekai_falling,spr_player_skin1_falling,spr_player_skin2_falling,spr_player_skin3_falling,spr_player_skin4_falling,spr_player_skin5_falling,spr_player_skin6_falling];
portal_array = [spr_player_zekai_portal,spr_player_skin1_portal,spr_player_skin2_portal,spr_player_skin3_portal,spr_player_skin4_portal,spr_player_skin5_portal,spr_player_skin6_portal];
hurt1_array = [spr_player_hurtface1,spr_player_skin1_hurtface1,spr_player_skin2_hurtface1,spr_player_skin3_hurtface1,spr_player_skin4_hurtface1,spr_player_skin5_hurtface1,spr_player_skin6_hurtface1];
hurt2_array = [spr_player_hurtface2,spr_player_skin1_hurtface2,spr_player_skin2_hurtface2,spr_player_skin3_hurtface2,spr_player_skin4_hurtface2,spr_player_skin5_hurtface2,spr_player_skin6_hurtface2];
hurt3_array = [spr_player_hurtface3,spr_player_skin1_hurtface3,spr_player_skin2_hurtface3,spr_player_skin3_hurtface3,spr_player_skin4_hurtface3,spr_player_skin5_hurtface3,spr_player_skin6_hurtface3];
hurt4_array = [spr_player_hurtface4,spr_player_skin1_hurtface4,spr_player_skin2_hurtface4,spr_player_skin3_hurtface4,spr_player_skin4_hurtface4,spr_player_skin5_hurtface4,spr_player_skin6_hurtface4];
face_array = [spr_player_face,spr_player_skin1_face,spr_player_skin2_face,spr_player_skin3_face,spr_player_skin4_face,spr_player_skin5_face,spr_player_skin6_face];
red_array = [spr_player_zekai_charging_red,spr_player_skin1_charging_red,spr_player_skin2_charging_red,spr_player_skin3_charging_red,spr_player_skin4_charging_red,spr_player_skin5_charging_red,spr_player_skin6_charging_red];
white_array = [spr_player_zekai_falling_white,spr_player_skin1_falling_white,spr_player_skin2_falling_white,spr_player_skin3_falling_white,spr_player_skin4_falling_white,spr_player_skin5_falling_white,spr_player_skin6_falling_white];
revive_array = [spr_player_revive_animation,spr_player_skin1_revive,spr_player_skin2_revive,spr_player_skin3_revive,spr_player_skin4_revive,spr_player_skin5_revive,spr_player_skin6_revive];
revive_white_array = [spr_player_revive_white,spr_player_skin1_revive_white,spr_player_skin2_revive_white,spr_player_skin3_revive_white,spr_player_skin4_revive_white,spr_player_skin5_revive_white,spr_player_skin6_revive_white];

//player sprite
player_sprite = bouncing_array[global.current_skin];
falling_sprite = falling_array[global.current_skin];
charging_sprite = charging_array[global.current_skin];
portal_sprite = portal_array[global.current_skin];
face_sprite = face_array[global.current_skin];
red_sprite = red_array[global.current_skin];
white_sprite = white_array[global.current_skin];
revive_sprite = revive_array[global.current_skin];
revive_white_sprite = revive_white_array[global.current_skin];
current_hurt_array = hurt1_array;
hurt_sprite = current_hurt_array[global.current_skin];
hurt_yoffset = 0;
hat_yoffset = 0;
combo_offset = 0;

// Stats
hp = 40;
max_hp = 40; //5 hearts
max_max_hp = 80; //10 hearts
armor_buff = 0;
max_armor_buff = 5;
energy_buff = 0;
max_energy_buff = 3;
stomp_damage = 8;
num_iframes = (1.5 + iframes_add) * room_speed;
current_iframes = 0;
dead = false;

//Sound Bool for preventing looping sounds
soundPlayed = false;

//starting position
if global.player_spawn_x = 0 and global.player_spawn_y = 0 {
	global.player_spawn_x = x;
	global.player_spawn_y = y;
}

image_speed = 0;

depth = -10;
init_depth = depth;

//we probably want 2 separate collision masks, one for the very bottom of the pogo stick, and the other for colliding with the sides/bottom of walls
with (instance_create_depth(x,y,depth-1,obj_player_mask)) {
	parent_index = other;
}

msk_index = instance_nearest(x,y,obj_player_mask); //references obj_playermask object

//delete duplicate player 
if instance_number(obj_player) > 1 {
	instance_destroy();	
	instance_destroy(msk_index);
}

//item Code
has_item = false; // // Whether the player is equipped with a weapon
equipped_item = noone; // The weapon that initializes the equipment is none

#region //STATES

state_free = function() {
	bouncing = false;
	can_rotate = true;
	if !instance_exists(obj_salesman_table) {
		can_shoot = true;
	}else {
		if obj_salesman_table.being_used = false {
			can_shoot = true;
		}
	}	
	soundPlayed = false;
	tutorialDash = false; // Used for tutorial ground tile state
	
	vspeed += grv; //falling
	vsp_basicjump = -6.6;
	
	//horizontal drag
	if hspeed > 0 {
		motion_add(180,h_grv);
	}else if hspeed < 0 {
		motion_add(0,h_grv);
	}
	
	scr_Player_Collision();
	
	//make sure player isn't colliding with anything before checking for collisions again
	if !(place_meeting(x,y,obj_ground)) and free = false {
		free = true;	
	}
	
	//falling animation
	sprite_index = falling_sprite;
	
	if (vspeed > 5) {
		image_index = 3;
	}else if (vspeed > 3) {
		image_index = 2;
	}else if (vspeed > 1) {
		image_index = 1;
	}else {
		image_index = 0;
	}
	
	//restart room if reached the top unless procgen room
	if room != room_proc_gen_test && room != room_sprite_level_test && room != room_tutorial && room != room_starting_temp {
		if (bbox_bottom < 0 and mask_index != spr_nothing) {
			scr_Room_Restart(true);
		}
	}else if room = room_tutorial {
		if (bbox_bottom < 0 and mask_index != spr_nothing) {
			global.tutorial_completed = true;
			scr_Save_Real("tutorial_completed",global.tutorial_completed);
			audio_stop_all();
			gamepad_set_vibration(0,0,0);
			scr_Game_Restart();
			with obj_pause {
				item_swap = false;
				paused_outside = true;
			}
			state = state_immobile;
		}
	}else if room = room_starting_temp {
		if (bbox_bottom < 0 and mask_index != spr_nothing) {
			state = state_immobile;
			scr_Room_Transition(room_proc_gen_test);
		}
	}
	
	//create upward flames if fast enough
	if speed >= min_flames_speed and !instance_exists(obj_player_flames_upward) and vspeed < 0 and allow_flames = true {
		//temporarily disabled
		//instance_create_depth(x,y,depth+1,obj_player_flames_upward);
	}

}

state_bouncing = function() {
	bouncing = true;
	//on create
	if floor(image_index) = 0 {
		can_rotate = true;
		can_shoot = true;
	}
	free = false;
	sprite_index = player_sprite; //set sprite
	
	//animate before bouncing
	if (floor(image_index) = sprite_get_number(sprite_index)-1) {
		animation_complete = true;
	}else if (animation_complete = false) {
		image_index += 1;
	}
	
	// Conveyor belt handling
	scr_Conveyor_Belt();
	
	//bounce after animation is complete
	var not_charging_1 = !(key_pickup_1 and pickups_array[0] = pickup_chargejump and pickups_array[0].on_cooldown = false);
	var not_charging_2 = !(key_pickup_2 and pickups_array[1] = pickup_chargejump and pickups_array[1].on_cooldown = false);
	if (animation_complete and not_charging_1 and not_charging_2 or animation_complete and launchpad = true) {
		scr_Jump(0);
		platform_on = !platform_on;
	}
	
	with obj_projectile {
		if gun_name = "Grappling Helmet" or gun_name = "Harpoon Helmet" {
			//retract = true;
		}
	}
}

state_chargejump = function() {
	can_rotate = true;
	var end_of_charge = false;
	if !audio_is_playing(snd_chargejump) { //sound
		if (charge > charge_max) {
			audio_play_sound(snd_chargejump,0,false);
		}else {
			end_of_charge = true;
		}
	}
	
	bouncing = true;
	sprite_index = charging_sprite;
	image_speed = 1;
	vsp_basicjump = -6.6;
	
	// Conveyor belt handling
	scr_Conveyor_Belt();
	
	var not_charging_1 = !(key_pickup_1 and pickups_array[0] = pickup_chargejump) and launchpad = false;
	var not_charging_2 = !(key_pickup_2 and pickups_array[1] = pickup_chargejump) and launchpad = false;
	
	if not_charging_1 and not_charging_2 or end_of_charge {
		scr_Screen_Shake((charge/charge_max)*(-vsp_basicjump - 2)+(-2 + (-vsp_basicjump)),(charge/charge_max)*10+5,true);
		scr_Jump(charge-2);
		audio_stop_sound(snd_chargejump);
		audio_stop_sound(snd_bounce);
		audio_stop_sound(snd_bounce2);
		audio_stop_sound(snd_bounce3);
		audio_play_sound(snd_chargejump_launch,0,false);
		allow_flames = true;
		min_flames_speed = 7.2;
		pickup_chargejump.on_cooldown = true;
		if !instance_exists(obj_player_flames_upward) {
			with instance_create_depth(x,y,depth+1,obj_player_flames_upward) {
				chargejump = true;
			}
		}
		rotation_speed = original_rotation_speed;
		rotation_delay = rotation_speed / 10;
		angle = round(angle / original_rotation_speed)*original_rotation_speed;
		current_rotation_speed = 0;
	}else {
		if (charge > charge_max) {
			charge += charge_max/80; //80 = how many frames until max charge
		}
	}
	
	//cancel if not colliding
	if !place_meeting(x,y+4,obj_ground_parent) and !place_meeting(x,y+4,obj_enemy_parent) 
	and !place_meeting(x+4,y+4,obj_ground_parent) and !place_meeting(x+4,y+4,obj_enemy_parent) 
	and !place_meeting(x-4,y+4,obj_ground_parent) and !place_meeting(x-4,y+4,obj_enemy_parent) {
		state = state_free;
		charge = 0;
		bouncing = false;
		rotation_speed = original_rotation_speed;
		rotation_delay = rotation_speed / 10;
		angle = round(angle / original_rotation_speed)*original_rotation_speed;
		current_rotation_speed = 0;
		sprite_index = falling_sprite;
		image_index = 0; //reset animation to starting frame
		animation_complete = false;
	}
}

state_groundpound = function() {
	if sprite_index != player_sprite and sprite_index != charging_sprite and sprite_index != falling_sprite {
		sprite_index = player_sprite;
	}
	
	hspeed = hspeed * 0.8;
	
	if !global.key_fire_projectile {
		can_shoot = true;
	}
	
	if slam_speed < 15.9 { //15.9 because dont wanna glitch through 16px platforms
		slam_speed += 0.1;
	}
	
	if soundPlayed = false {
		audio_play_sound(snd_slamCharge,0,false);
		soundPlayed = true;
	}
	//rise
	if ground_pound_rise = true {
		can_rotate = false;
		vspeed = 0;
		if (angle != 0)	{
			var angle_side = sign(angle);
			angle += rotation_speed*sign(-angle);
			if (sign(angle) != angle_side) {
				angle = 0;
				current_rotation_speed = 0;
			}
		}
		
		if (ground_pound_distance_risen) < 32 {
			ground_pound_distance_risen += 1;
			with (msk_index) {
				if !place_meeting(x,y-1,obj_ground) {
					other.vspeed = -1;	
				}
			}
		}else {
			ground_pound_rise = false;
			ground_pound_slam = true;
		}
	}
	//slam
	if ground_pound_slam = true {
		vspeed = slam_speed;
		can_rotate = true; //allow rotation again
		vsp_basicjump = -9;
		stomp_damage = 40;
		//switch states
		if place_meeting(x,y+vspeed,obj_ground_parent) or place_meeting(x,y+vspeed,obj_enemy_parent) {
			while !(place_meeting(x,y+sign(vspeed),obj_ground_parent)) and !(place_meeting(x,y+sign(vspeed),obj_enemy_parent)) {
				y += sign(vspeed);
			}
			
			if place_meeting(x,y+2,obj_launchpad) {
				with instance_place(x,y+2,obj_launchpad) {
					if animating = false and not_meeting = true {
						animating = true;
						missiles_left = 0;
						player_y = other.y;
						sprite_index = spr_launchpad_both;
						mask_index = spr_nothing;
					}
				}
			}
			
			
			if place_meeting(x,y+vspeed,obj_ground_parent) {
				aerial_assassin_count = 0;	
			}

			scr_Enemy_Collision_Check(true);
			pickup_groundpound.on_cooldown = true;
			state = state_bouncing;
			vspeed = 0;
			scr_Screen_Shake(6, 15, true);
			audio_play_sound(snd_groundpound,0,false);
			stomp_damage = 8;
			soundPlayed = false;
			
		}
	}
}

state_megabounce = function() {
	if sprite_index != player_sprite and sprite_index != charging_sprite and sprite_index != falling_sprite {
		sprite_index = player_sprite;
	}
	
	hspeed = hspeed * 0.8;
	
	if !global.key_fire_projectile {
		can_shoot = true;
	}
	can_rotate = false;
	
	if slam_speed < 15 { //15 because dont wanna glitch through 16px platforms
		slam_speed += 1;
	}
	
	if soundPlayed = false {
		audio_play_sound(snd_slamCharge,0,false);
		soundPlayed = true;
	}
	
	ground_pound_rise = false;
	ground_pound_slam = true;
	
	//slam
	if ground_pound_slam = true {
		if (angle != 0)	{
			var angle_side = sign(angle);
			angle += rotation_speed*sign(-angle);
			if (sign(angle) != angle_side) {
				angle = 0;
				current_rotation_speed = 0;
			}
			megajump_centered = false;
		}else {
			megajump_centered = true;	
		}
		
		vspeed = slam_speed;
		vsp_basicjump = -9;
		stomp_damage = 40;
		//switch states
		if place_meeting(x,y+vspeed,obj_ground_parent) or place_meeting(x,y+vspeed,obj_enemy_parent) {
			while !(place_meeting(x,y+sign(vspeed),obj_ground_parent)) and !(place_meeting(x,y+sign(vspeed),obj_enemy_parent)) {
				y += sign(vspeed);
			}
			
			if place_meeting(x,y+2,obj_launchpad) {
				with instance_place(x,y+2,obj_launchpad) {
					if animating = false and not_meeting = true {
						animating = true;
						missiles_left = 0;
						player_y = other.y;
						sprite_index = spr_launchpad_both;
						mask_index = spr_nothing;
					}
				}
				launchpad = true;
			}
			
			if place_meeting(x,y+vspeed,obj_ground_parent) {
				aerial_assassin_count = 0;	
			}

			scr_Enemy_Collision_Check(true);
			//pickup_megabounce.on_cooldown = true;
			if launchpad = false {
				state = state_megabounce_charge;
			}else {
				state = state_bouncing;	
			}
			vspeed = 0;
			scr_Screen_Shake(6, 15, true);
			audio_play_sound(snd_groundpound,0,false);
			stomp_damage = 8;
			soundPlayed = false;
			
		}
	}
}

state_megabounce_charge = function() {
	if (angle != 0)	and megajump_centered = false {
		var angle_side = sign(angle);
		angle += rotation_speed*sign(-angle);
		if (sign(angle) != angle_side) {
			angle = 0;
			current_rotation_speed = 0;
			megajump_centered = true;
		}
	}else if megajump_centered = false {
			megajump_centered = true;
	}
	
	if megajump_centered = true {
		rotation_speed = original_rotation_speed/2;
		rotation_speed = min(rotation_speed,2);
		can_rotate = true;
	}else {
		can_rotate = false;
	}
	can_shoot = false;
	
	if !audio_is_playing(snd_chargejump) { //sound
		if (charge > charge_max) {
			audio_play_sound(snd_chargejump,0,false);
		}else {
			end_of_charge = true;
		}
	}
	
	if global.key_fire_projectile_pressed or charge = charge_max {
		end_of_charge = true;
		charge = charge_max;
	}
	
	bouncing = true;
	sprite_index = charging_sprite;
	image_speed = 1;
	vsp_basicjump = -6.6;
	
	// Conveyor belt handling
	scr_Conveyor_Belt();
	
	if end_of_charge {
		platform_on = !platform_on;
		end_of_charge = false;
		scr_Screen_Shake((charge/charge_max)*(-vsp_basicjump - 2)+(-2 + (-vsp_basicjump)),(charge/charge_max)*10+5,true);
		//can_shoot = true;
		scr_Jump(charge+1);
		grv = 0;
		audio_stop_sound(snd_chargejump);
		audio_stop_sound(snd_bounce);
		audio_stop_sound(snd_bounce2);
		audio_stop_sound(snd_bounce3);
		audio_play_sound(snd_chargejump_launch,0,false);
		allow_flames = true;
		min_flames_speed = 7.2;
		pickup_megabounce.on_cooldown = true;
		if !instance_exists(obj_player_flames_upward) {
			with instance_create_depth(x,y,depth+1,obj_player_flames_upward) {
				chargejump = true;
				megabounce = true;
			}
		}
		rotation_speed = original_rotation_speed;
		rotation_delay = rotation_speed / 10;
		angle = round(angle / original_rotation_speed)*original_rotation_speed;
		//current_rotation_speed = 0;
		can_rotate = true;
	}else {
		if (charge > charge_max) {
			charge += charge_max/80; //80 = how many frames until max charge
		}
	}
	
	//cancel if not colliding
	if !place_meeting(x,y+4,obj_ground_parent) and !place_meeting(x,y+4,obj_enemy_parent) 
	and !place_meeting(x+4,y+4,obj_ground_parent) and !place_meeting(x+4,y+4,obj_enemy_parent) 
	and !place_meeting(x-4,y+4,obj_ground_parent) and !place_meeting(x-4,y+4,obj_enemy_parent) {
		state = state_free;
		charge = 0;
		bouncing = false;
		rotation_speed = original_rotation_speed;
		rotation_delay = rotation_speed / 10;
		angle = round(angle / original_rotation_speed)*original_rotation_speed;
		current_rotation_speed = 0;
		sprite_index = falling_sprite;
		image_index = 0; //reset animation to starting frame
		animation_complete = false;
	}
}

state_firedash = function() {
	tutorialDash = true;
	can_rotate = false;
	can_shoot = false;
	if dash_time > 0 {
		invincible = true;
		speed = 10;
		direction = image_angle+90;
		min_flames_speed = speed;
		scr_Screen_Shake(4, 4, true);
		if !instance_exists(obj_player_flames_upward) {
			instance_create_depth(x,y,depth+1,obj_player_flames_upward);	
		}
		dash_time -= 1;
	}else {
		speed = speed/1.5;
		state = state_free;
		dash_time = max_dash_time;
		if instance_exists(obj_player_flames_upward) {
			obj_player_flames_upward.despawn = true;	
		}
	}
}

temp_x = 0.5;
init_x = x;
state_bulletblast = function() {
	if !audio_is_playing(snd_bulletblast) {
		audio_play_sound(snd_bulletblast,0,false);
	}
	if sprite_index != player_sprite and sprite_index != charging_sprite and sprite_index != falling_sprite {
		sprite_index = player_sprite;
	}
	if bulletblast_frames < bulletblast_frames_max {
		speed = speed * 0.9;
		if scr_Animation_Complete() and sprite_index = player_sprite {
			sprite_index = charging_sprite;	
		}else if sprite_index = player_sprite {
			image_index += 1;
			init_x = x;
		}else {
			image_index += 0.25;	
			x += temp_x;
			if bulletblast_frames % 3 = 0 { //every 3 frames
				temp_x *= -1.2;
			}
		}
		scr_Player_Collision();
		if state = state_bouncing { //dont want to cancel powerup after collision
			state = state_bulletblast;	
		}
		bulletblast_frames += 1;
		if bulletblast_frames >= bulletblast_frames_max - 2 {
			sprite_index = red_sprite;	
		}
	}else {
		old_gun = gun;
		gun = bulletblast_gun;
		image_angle += 180;
		x -= lengthdir_x(21,image_angle+90);
		y -= lengthdir_y(21,image_angle+90);
		scr_Shoot();
		x += lengthdir_x(21,image_angle+90);
		y += lengthdir_y(21,image_angle+90);
		image_angle -= 180;
		gun = old_gun;
		state = state_free;
		x = init_x;
		pickup_bulletblast.on_cooldown = true;
	}
}

state_plasmacharge = function() {
	can_rotate = true;
	if sprite_index != player_sprite and sprite_index != charging_sprite and sprite_index != falling_sprite {
		sprite_index = player_sprite;
	}

	speed = speed * 0.9;
	if scr_Animation_Complete() and sprite_index = player_sprite {
		sprite_index = charging_sprite;	
	}else if sprite_index = player_sprite {
		image_index += 1;
	}else {
		image_index += 0.25;	
	}
	scr_Player_Collision();
	if state = state_bouncing { //dont want to cancel powerup after collision
		state = state_plasmacharge;	
	}
}

state_freeze = function() {
	
	if pickup_1 = pickup_freeze {  
		var key_unfreeze = global.key_pickup_1_pressed;
	}else if pickup_2 = pickup_freeze {  
		var key_unfreeze = global.key_pickup_2_pressed;
	}else {
		var key_unfreeze = 0;
	}
	
	sprite_index = player_sprite;
	speed = 0;	
	
	if freeze_time > 0 and !key_unfreeze {
		freeze_time -= 1;	
	}else {
		if audio_is_playing(snd_freeze) and freeze_time > 0 {
			audio_stop_sound(snd_freeze);
		}
		state = state_free;
		grv = init_grv;
		rotation_speed = original_rotation_speed;
		rotation_delay = rotation_speed / 10;
		
		pickup_freeze.uses_per_bounce -= 1;
		if pickup_freeze.uses_per_bounce <= 0 {
			pickup_freeze.on_cooldown = true;
		}
	}
	
	if (freeze_alpha < 1) {
		freeze_alpha += 0.1;	
	}
	
	can_rotate = true;
	can_shoot = true;
	grav = 0;
	freeze_angle = image_angle;
	
	scr_Player_Collision();
}

state_shop = function() {
	angle = 0;	
	can_rotate = false;
	can_shoot = false;
	vspeed += grv;
	
	//check for collision with ground y axis
	if (place_meeting(x,y+vspeed,obj_ground)) {
		while !(place_meeting(x,y+sign(vspeed),obj_ground)) {
			y += sign(vspeed);
		}
		aerial_assassin_count = 0;
		shop_bouncing = true;
		speed = 0; //stop player movement while bouncing
	}
	
	if shop_bouncing = true {
		sprite_index = player_sprite; //set sprite
		//animate before bouncing
		if (floor(image_index) = sprite_get_number(sprite_index)-1) {
			animation_complete = true;
		}else if (animation_complete = false) {
			image_index += 0.75;
		}
		if scr_Animation_Complete() = true {
			scr_Jump(0);
			shop_bouncing = false;
		}
	}
}

state_immobile = function() {
	can_rotate = false;
	can_shoot = false;
	speed = 0;
}

state_immobile_bouncing = function() {
	vspeed += grv;
	
	//check for collision with ground y axis
	if (place_meeting(x,y+vspeed,obj_ground)) {
		while !(place_meeting(x,y+sign(vspeed),obj_ground)) {
			y += sign(vspeed);
		}
		aerial_assassin_count = 0;
		shop_bouncing = true;
		speed = 0; //stop player movement while bouncing
	}
	
	if shop_bouncing = true {
		sprite_index = player_sprite; //set sprite
		//animate before bouncing
		if (floor(image_index) = sprite_get_number(sprite_index)-1) {
			animation_complete = true;
		}else if (animation_complete = false) {
			image_index += 0.75;
		}
		if scr_Animation_Complete() = true {
			scr_Jump(0);
			shop_bouncing = false;
		}
	}
	
	scr_Player_Collision();
}

state_revive = function() {
	can_rotate = false;
	can_shoot = false;
	sprite_index = player_sprite;
	image_index = 0;
	hspeed = hspeed * 0.9;
	vspeed = 0;
	
	if revive_alpha > 0 {
		revive_alpha -= 0.05;	
	}
	
	if (angle != 0)	{
		var angle_side = sign(angle);
		angle += (rotation_speed*sign(-angle))/2;
		if (sign(angle) != angle_side) {
			angle = 0;
			current_rotation_speed = 0;
		}
	}
		
	if (revive_time) < 90 {
		revive_time += 1;
		with (msk_index) {
			if !place_meeting(x,y-1,obj_ground) {
				other.vspeed = -1;	
			}
		}
	}else {
		state = state_free;
		revive_alpha = 1;
	}
}

state_blink = function() {
	speed = 0;
	can_rotate = false;
	can_shoot = false;
	mask_index = spr_nothing;
	with obj_player_mask {
		mask_index = spr_nothing;
	}
	
	if image_yscale > 0 {
		image_yscale -= 0.1;
	}
}

state_parachute = function() {
	//can_shoot = false;
	can_rotate = false;
	
	if !global.key_fire_projectile {
		can_shoot = true;
	}
	
	if !instance_exists(obj_parachute) {
		instance_create_depth(x+lengthdir_x(22,angle+90),y+lengthdir_y(22,angle+90),depth+1,obj_parachute);
	}
	
	if obj_parachute.opening = false {
		vspeed += grv; //falling
		vsp_basicjump = -6.6;
	
		//horizontal drag
		if hspeed > 0 {
			motion_add(180,h_grv);
		}else if hspeed < 0 {
			motion_add(0,h_grv);
		}	
	}else {
		//re-center
		if (angle != 0)	{
			var angle_side = sign(angle);
			angle += (rotation_speed/2)*sign(-angle);
			if (sign(angle) != angle_side) {
				angle = 0;
				current_rotation_speed = 0;
			}
		}
		
		//slow down
		if vspeed >= 0 {
			vspeed += grv/5; //falling slower
			if vspeed > 2 {
				vspeed = 2;
			}
			
			//horizontal drag
			if hspeed > 0 {
				motion_add(180,h_grv*10);
			}else if hspeed < 0 {
				motion_add(0,h_grv*10);
			}	
			
		}else {
			vspeed += grv; //falling
			vsp_basicjump = -6.6;
	
			//horizontal drag
			if hspeed > 0 {
				motion_add(180,h_grv*2);
			}else if hspeed < 0 {
				motion_add(0,h_grv*2);
			}	
		}
		
		//move left and right
		if angle = 0 {
			if hspeed % 0.25 != 0 {
				hspeed = round((hspeed/0.25))*0.25
			}
			if global.key_left_player {
				if hspeed > -4 {
					hspeed -= 0.25;
				}
				if obj_parachute.angle_add > -4 {
					obj_parachute.angle_add -= 0.25;
				}
				obj_parachute.decrease_arrows_alpha = true;
			}
			if global.key_right_player {
				if hspeed < 4 {
					hspeed += 0.25;
				}
				if obj_parachute.angle_add < 4 {
					obj_parachute.angle_add += 0.25;
				}
				obj_parachute.decrease_arrows_alpha = true;
			}
			if !global.key_left_player and !global.key_right_player {
				if hspeed < 0 {
					hspeed += 0.25;
				}else if hspeed > 0 {
					hspeed -= 0.25;
				}
				
				if obj_parachute.angle_add < 0 {
					obj_parachute.angle_add += 0.25;
				}else if obj_parachute.angle_add > 0 {
					obj_parachute.angle_add -= 0.25;
				}
			}
			
			if hspeed != 0 {
				image_xscale = sign(hspeed);
			}
		}
	}
	
	scr_Player_Collision();
}

state_grappling = function() {
	
	can_shoot = false;
	
	var not_grappling_1 = !(global.key_pickup_1) and pickups_array[0] = pickup_grappling or !(global.key_pickup_1) and pickups_array[0] = pickup_harpoon;
	var not_grappling_2 = !(global.key_pickup_2) and pickups_array[1] = pickup_grappling or !(global.key_pickup_2) and pickups_array[1] = pickup_harpoon;
	
	with obj_projectile {
		if gun_name = "Grappling Helmet" or gun_name = "Harpoon Helmet" {
			other.grappling_hook = self;	
		}
	}
	
	if instance_exists(grappling_hook) {
		if grappling_hook.gun_name = "Grappling Helmet" {
			if speed <= 8 {
				speed += 0.75;
			}
		}else if grappling_hook.gun_name = "Harpoon Helmet" {
			harpooning = true;
			invincible = true;
			if speed <= 12 {
				speed += 1;
			}
		}
	}

	if instance_exists(grappling_hook) {
		if grappling_hook.retract = false {
			grappling_hook.distance_traveled -= speed;
		}
		grappling_hook.x = grappling_hook.collision_x;
		grappling_hook.y = grappling_hook.collision_y;
		move_towards_point(grappling_hook.x,grappling_hook.y,speed);
		if distance_to_point(grappling_hook.x,grappling_hook.y) <= 8 {
			state = state_free;
			instance_destroy(grappling_hook);
		}
	}
	
	
	if slam_speed < 15.9 {
		slam_speed += 0.1;
	}
	
	scr_Player_Collision();
}

state_shieldbubble = function() {
	can_rotate = false;
	sprite_index = player_sprite;
	if image_index < 10 {
		image_index += 0.5;
	}else {
		image_speed = 0;
		image_index = 10;
	}
	
	vspeed += grv; //falling
	vsp_basicjump = -6.8;
	
	
	if instance_exists(shieldbubble_obj) {
		//re-center
		if (angle != 0)	{
			var angle_side = sign(angle);
			angle += (rotation_speed/2)*sign(-angle);
			if (sign(angle) != angle_side) {
				angle = 0;
				current_rotation_speed = 0;
			}
		}
		if shieldbubble_obj.bouncing = false {
			can_shoot = true;
			//move left and right
			if hspeed % 0.25 != 0 {
				hspeed = round((hspeed/0.25))*0.25
			}
			if global.key_left_player {
				if hspeed > -4 {
					hspeed -= 1;
				}else if hspeed < -4 {
					hspeed += 1;
				}
				obj_shieldbubble.decrease_arrows_alpha = true;
			}
			if global.key_right_player {
				if hspeed < 4 {
					hspeed += 1;
				}else if hspeed > 4 {
					hspeed -= 1;
				}
				obj_shieldbubble.decrease_arrows_alpha = true;
			}
			if global.key_down_menu {
				if vspeed < 4 {
					vspeed += 0.25;
					shieldbubble_obj.bounced = true
				}
				//obj_shieldbubble.decrease_arrows_alpha = true;
			}
			if !global.key_left_player and !global.key_right_player {
				if shieldbubble_obj.bounced = true {
					if hspeed < 0 {
						hspeed += 0.5;
						if hspeed > 0 {
							hspeed = 0;
						}
					}else if hspeed > 0 {
						hspeed -= 0.5;
						if hspeed < 0 {
							hspeed = 0;
						}
					}
				}else {
					if hspeed < 0 {
						hspeed += 0.25;
					}else if hspeed > 0 {
						hspeed -= 0.25;
					}
				}
			}else if shieldbubble_obj.bounced = false {
				shieldbubble_obj.bounced = true;
				if shieldbubble_obj.bounced_cancel = true {
					shieldbubble_obj.bounced_cancel = false;
				}
			}
			
			if hspeed != 0 {
				image_xscale = sign(hspeed);
			}
			
			//bounce
		}else {
			can_shoot = false;
			hspeed = 0;
			vspeed = 0;
			speed = 0;
			//state = state_immobile;
		}
	}else {
		state = state_free;
		can_rotate = true;
		can_shoot = true;
	}
	
	//scr_Player_Collision();
}

state_portal = function() {
	//sprite_index = portal_sprite;
	can_shoot = false;
	if instance_exists(portal_object) {
		if portal_angle_speed < 10 {
			portal_angle_speed += 0.5;
		}
			
		move_towards_point(portal_object.x+48,portal_object.y+52,portal_speed);
		
		if portal_speed < 8 {
			portal_speed += 0.1;
		}
		
		image_angle += portal_angle_speed;
		x = x + lengthdir_x(portal_rot_distance*image_yscale,image_angle);
		y = y  + lengthdir_y(portal_rot_distance*image_yscale,image_angle);
			
		if portal_rot_distance < 8 {
			portal_rot_distance += 0.25;	
		}
		
		if image_yscale > 0 {
			image_yscale -= 0.015;
			image_xscale = sign(image_xscale) *image_yscale;
			image_angle += portal_angle_speed;
		}else { //go in portal
			if (room == room_proc_gen_test) {
				room_persistent = false;
				switch (global.phase) {
					case 1:
						scr_Room_Transition(room_boss_1);
						break;
					case 2:
						scr_Room_Transition(room_boss_2);
						break;
					case 3:
						scr_Room_Transition(room_boss_3);
						break;
				}	
			}else {
				if room != room_boss_3 {
					room_persistent = false;
					//global.phase++; //increase phase when boss is defeated instead
					scr_Room_Transition(room_proc_gen_test);
					if global.phase = 2 {
						global.tileset = tl_ground2;	
					}
					if global.phase = 3 {
						global.tileset = tl_ground3;	
					}
				}else {
					room_persistent = false;
					global.phase = 1;
					scr_Room_Transition(room_menu);	
				}
			}
		}
	}
	
	//stop splits
	with obj_runstats {
		stop_time = true;
	}
}

state_shop_portal = function() {
	//sprite_index = portal_sprite;
	can_shoot = false;
	can_rotate = false;
	if instance_exists(portal_object) {
		if portal_angle_speed < 10 {
			portal_angle_speed += 0.5;
		}
			
		move_towards_point(portal_object.x,portal_object.y-60,portal_speed);
		
		if portal_speed < 8 {
			portal_speed += 0.1;
		}
		
		image_angle += portal_angle_speed;
		x = x + lengthdir_x(portal_rot_distance*image_yscale,image_angle);
		y = y  + lengthdir_y(portal_rot_distance*image_yscale,image_angle);
			
		if portal_rot_distance < 8 {
			portal_rot_distance += 0.25;	
		}
		
		if image_yscale > 0 {
			image_yscale -= 0.015;
			image_xscale = sign(image_xscale) *image_yscale;
			image_angle += portal_angle_speed;
		}else { //go in portal
			if (room != room_shop) {
				if used_shop_portal = false {
					with portal_object {
						room_persistent = true;
						scr_Room_Transition(room_shop);
						global.player_spawn_x_prev = x;
						global.player_spawn_y_prev = y - 60;
						global.shop_index = shop_index;
						if global.shop_num <= global.current_shop_num and shop_used = false {
							global.shop_num += 1;
							shop_used = true;
							instance_destroy(obj_shop);
						}
					}
					used_shop_portal = true;
				}
			}else if !instance_exists(obj_coin_spawner) {
				with portal_object {
					if global.last_room != room_shop {
						if !instance_exists(obj_fade_out_shop) {
							instance_create_depth(x,y,-1000,obj_fade_out_shop);
						}
					}else {
						scr_Game_Restart();
					}
				}
			}
		}
	}
}

state_spawn = function() {
	sprite_index = portal_sprite;
	can_shoot = false;
	can_rotate = false;
	
	speed = 0;
	
	if image_xscale < 1 {
		image_xscale += 0.025;
		image_yscale += 0.025;
	}else {
		state = state_free;
		y += 22;
		sprite_index = bouncing_array[global.current_skin];
	}
}

state_dead = function() {
	if y < 100000 {
		vspeed += grv; //falling
	}else {
		speed = 0;
	}
}

state = state_free;
#endregion

#region //weapons

mouse_angle = 0; //direction from gun to mouse
knockback_angle = 0; //angle of knockback

ox = x; //original x position
oy = y; //original y position

//bullets
scr_Bullets();

//guns
scr_Guns();

canshoot = 0; //shooting timer
bullet_index = 0; //current bullet

//EQUIP WEAPONS
num_of_weapons = 2; //number of different weapons equipped: only do 1 or 2 to start, but include functionality of 3 for "triple threat" buff
if room = room_tutorial {
	num_of_weapons = 0;
}
weapons_equipped = num_of_weapons;
all_guns_array = [default_gun,paintball_gun,shotgun_gun,
				burstfire_gun,javelin_gun,bouncyball_gun,
				grenade_gun, boomerang_gun,starsucker_gun,
				water_gun, bubble_gun, yoyo_gun,
				missile_gun, sniper_gun, laser_gun,
				slime_gun, machine_gun, puncher_gun,
				sixshooter_gun, plasma_gun]; //all guns

if (random_weapon == true) { //choose random weapons
	//randomize();
	//temporarily change items for playtest
	if room = room_proc_gen_test or room = room_boss_2 {
		//gun_1 = default_gun;
		//gun_2 = choose(sniper_gun,slime_gun);
		//gun_3 = gun_1;
		gun_1 = all_guns_array[irandom_range(0,array_length(all_guns_array)-1)];
		if num_of_weapons > 1 {
			gun_2 = all_guns_array[irandom_range(0,array_length(all_guns_array)-1)];
		}else {
			gun_2 = gun_1;
		}
		if num_of_weapons > 2 {
			gun_3 = all_guns_array[irandom_range(0,array_length(all_guns_array)-1)];
		}else if num_of_weapons != 0 {
			gun_3 = gun_1;
		}
	}else {
		gun_1 = all_guns_array[irandom_range(0,array_length(all_guns_array)-1)];
		if num_of_weapons > 1 {
			gun_2 = all_guns_array[irandom_range(0,array_length(all_guns_array)-1)];
		}else {
			gun_2 = gun_1;
		}
		if num_of_weapons > 2 {
			gun_3 = all_guns_array[irandom_range(0,array_length(all_guns_array)-1)];
		}else if num_of_weapons != 0 {
			gun_3 = gun_1;
		}
	}

	while (gun_2 = gun_1) and num_of_weapons > 1 { //dont want 2 of the same weapon
		gun_2 = all_guns_array[irandom_range(0,array_length(all_guns_array)-1)];
	}
	
	while (gun_3 = gun_1 and num_of_weapons > 2) or (gun_3 = gun_2 and num_of_weapons > 2) { //dont want 2 of the same weapon
		gun_3 = all_guns_array[irandom_range(0,array_length(all_guns_array)-1)];
	}
}else { //decide which weapons we want manually if not random. 
	//we do this by changing gun_1_manual and gun_2_manual in the variable definitions tab. Can be changed room by room.
	//Integers correspond to values in all_guns_array, 0 = default_gun, 1 = paintball_gun, etc.
	if room != room_tutorial {
		gun_1 = all_guns_array[gun_1_manual_value];
		gun_2 = all_guns_array[gun_2_manual_value];
		gun_3 = all_guns_array[gun_3_manual_value];
	}else {
		gun_1 = empty_gun;
		gun_2 = empty_gun;
		gun_3 = empty_gun;
	}
}

//set what weapons will actually be equipped at the start
if (num_of_weapons = 1) {
	gun_array = [gun_1, gun_1, gun_1];
}else if (num_of_weapons = 2) {
	gun_array = [gun_1, gun_2, gun_1];
}else if (num_of_weapons = 3) {
	gun_array = [gun_1, gun_2, gun_3];
}else if (num_of_weapons = 0) {
	gun_array = [empty_gun, empty_gun, empty_gun];
}
current_gun = 0;
gun = gun_array[current_gun];

#endregion

shoot_count = 0; // shoot count
jump_count = 0;  // bounce count
buff_active = false; // if the buff is active
buff_duration = 60 * 5; // buff duration timer

//pickups
scr_Pickups();

num_of_pickups = 0; //number of different pickups equipped: only do 1 or 2
all_pickups_array = [pickup_reload, pickup_freeze, pickup_emergency, 
					pickup_parachute, pickup_firedash, pickup_groundpound, 
					pickup_hatgun, pickup_chargejump, pickup_shieldbubble,
					pickup_target, pickup_blink, pickup_jetpack,
					pickup_tripleshot, pickup_frenzy, pickup_bulletblast,
					pickup_slowmo, pickup_grappling, pickup_winners,
					pickup_airbag, pickup_invincibility, pickup_pogomode,
					pickup_launchpad, pickup_megabounce,pickup_jolt,
					pickup_hacker]; //all pickups

if (random_pickup == true) { //choose random pickups
	//randomize();
	
	//temporarily change items for playtest
	if room = room_proc_gen_test or room = room_boss_2 {
		//pickup_1 = choose(pickup_frenzy,pickup_target);
		pickup_1 = all_pickups_array[irandom_range(0,array_length(all_pickups_array)-1)];
	}else {
		pickup_1 = all_pickups_array[irandom_range(0,array_length(all_pickups_array)-1)];
	}
	
	pickup_2 = all_pickups_array[irandom_range(0,array_length(all_pickups_array)-1)];

	while (pickup_2 = pickup_1) { //dont want 2 of the same weapon
		pickup_2 = all_pickups_array[irandom_range(0,array_length(all_pickups_array)-1)];
	}
}else { //decide which pickups we want manually if not random. 
	//we do this by changing pickup_1_manual and pickup_2_manual in the variable definitions tab. Can be changed room by room.
	//Integers correspond to values in all_pickups_array, 0 = pickup_chargejump, 1 = pickup_groundpound, etc.
	pickup_1 = all_pickups_array[pickup_1_manual_value];
	pickup_2 = all_pickups_array[pickup_2_manual_value];
}
if num_of_pickups = 0 {
	pickup_1 = pickup_nothing;
	pickup_2 = pickup_nothing;
}

//set what weapons will actually be equipped at the start
if (num_of_pickups = 1) {
	pickups_array = [pickup_1,pickup_nothing];
}else {
	pickups_array = [pickup_1, pickup_2];
}

//buffs
scr_Buffs();

all_buffs_array = [buff_lasersight, buff_planetarybullets,buff_dmg,
				buff_max_ammo, buff_luck, buff_pickybuyer,
				buff_bouncybullets, buff_hotshells, buff_combomaster,
				buff_blackfriday, buff_triplethreat, buff_flamingcoins,
				buff_combotime, buff_sharpshooter, buff_coinsup,
				buff_sharptip, buff_experimentation, buff_aerialassassin,
				buff_supershield, buff_revive, buff_drilltipbullets, 
				buff_dualwielder, buff_steadyhands, buff_tightspring,
				buff_magicianstouch, buff_impatience, buff_laststand,
				buff_psychicbullets, buff_righteousrevenge, buff_robbery, 
				buff_recycling, buff_juggler, buff_invincibilityup,
				buff_doublekill, buff_ironproficiency, buff_fastforward,
				buff_paparazzi, buff_crit, buff_bartime,
				buff_strongmuscles];

//create text in proc gen room
if room = room_proc_gen_test || room = room_sprite_level_test {
	alarm[2] = 10;
}

//destroy if not area 1
if global.phase != 1 {
	//instance_destroy();	
}

if room = room_tutorial {
	alarm[5] = 10;
}