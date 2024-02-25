/// @description initialize variables
//movement stats
grv = 0.21; //gravity
init_grv = grv; //initial gravity
h_grv = 0.01; //horizontal drag
rotation_speed = 3; //rotation speed
original_rotation_speed = global.tilt_speed;
current_rotation_speed = 0;
rotation_delay = rotation_speed / 10; //0.5
vsp_basicjump = -6.6; //bounce height
angle = 0;
anglemax = 45; //maximum degrees added on either side
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

//buffs
damage_buff = 0;
max_ammo_buff = 0;
max_max_ammo_buff = 5; //max amount this buff can be received
laser_sight = false;
planetary_bullets = 0;
aerial_assassin_count = 0;
revive_time = 0;
revive_alpha = 0;

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

//player sprite
player_sprite = spr_player_zekai;
falling_sprite = spr_player_zekai_falling;
charging_sprite = spr_player_zekai_charging;

// Stats
hp = 40;
max_hp = 40; //5 hearts
max_max_hp = 80; //10 hearts
armor_buff = 0;
max_armor_buff = 5;
stomp_damage = 8;
num_iframes = 1.5 * room_speed;
current_iframes = 0;
dead = false;

// Room Gate Handling
enemies_killed = 0;
enemies_required = 3;
room_number = 0;

//Sound Bool for preventing looping sounds
soundPlayed = false;

//starting position
if global.player_spawn_x = 0 and global.player_spawn_y = 0 {
	global.player_spawn_x = x;
	global.player_spawn_y = y;
}

image_speed = 0;

depth = -10;

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
	can_shoot = true;
	
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
	if room != room_proc_gen_test && room != room_sprite_level_test {
		if (bbox_bottom < 0 and mask_index != spr_nothing) {
			instance_deactivate_all(false);
			room_restart();
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
	if (animation_complete and not_charging_1 and not_charging_2) {
		scr_Jump(0);
		platform_on = !platform_on;
	}
}

state_chargejump = function() {
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
	
	var not_charging_1 = !(key_pickup_1 and pickups_array[0] = pickup_chargejump);
	var not_charging_2 = !(key_pickup_2 and pickups_array[1] = pickup_chargejump);
	
	if not_charging_1 and not_charging_2 or end_of_charge {
		scr_Screen_Shake((charge/charge_max)*(-vsp_basicjump - 2)+(-2 + (-vsp_basicjump)),(charge/charge_max)*10+5,true);
		scr_Jump(charge);
		audio_stop_sound(snd_chargejump);
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
	
}

state_groundpound = function() {
	if sprite_index != player_sprite and sprite_index != charging_sprite and sprite_index != falling_sprite {
		sprite_index = player_sprite;
	}
	
	hspeed = hspeed * 0.9;
	can_shoot = false;
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
		vsp_basicjump = -8;
		stomp_damage = 40;
		//switch states
		if place_meeting(x,y+vspeed,obj_ground_parent) or place_meeting(x,y+vspeed,obj_enemy_parent) {
			while !(place_meeting(x,y+sign(vspeed),obj_ground_parent)) and !(place_meeting(x,y+sign(vspeed),obj_enemy_parent)) {
				y += sign(vspeed);
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

state_firedash = function() {
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
			sprite_index = spr_player_zekai_charging_red;	
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
	}
}

state_freeze = function() {
	sprite_index = player_sprite;
	speed = 0;	
	
	if freeze_time > 0 {
		freeze_time -= 1;	
	}else {
		state = state_free;
		grv = init_grv;
		rotation_speed = original_rotation_speed;
		rotation_delay = rotation_speed / 10;
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
weapons_equipped = num_of_weapons;
all_guns_array = [default_gun,paintball_gun,shotgun_gun,bubble_gun,burstfire_gun,grenade_gun,laser_gun,bouncyball_gun,missile_gun,boomerang_gun,starsucker_gun,sniper_gun,slime_gun,yoyo_gun,javelin_gun]; //all guns

if (random_weapon = true) { //choose random weapons
	randomize();
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
		}else {
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
		}else {
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
	gun_1 = all_guns_array[gun_1_manual_value];
	gun_2 = all_guns_array[gun_2_manual_value];
	gun_3 = all_guns_array[gun_3_manual_value];
}

//set what weapons will actually be equipped at the start
if (num_of_weapons = 1) {
	gun_array = [gun_1, gun_1, gun_1];
}else if (num_of_weapons = 2) {
	gun_array = [gun_1, gun_2, gun_1];
}else {
	gun_array = [gun_1, gun_2, gun_3];
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
all_pickups_array = [pickup_chargejump,pickup_groundpound,pickup_hatgun,pickup_shieldbubble,pickup_firedash,pickup_jetpack,pickup_slowmo,pickup_bulletblast,pickup_reload,pickup_camera,pickup_freeze,pickup_frenzy,pickup_target]; //all pickups

if (random_pickup = true) { //choose random pickups
	randomize();
	
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
				buff_magicianstouch];		

//create text in proc gen room
if room = room_proc_gen_test || room = room_sprite_level_test {
	alarm[2] = 10;
}