/// @description player movement

/* //Print player position for debug purposes
var debug_message = "Player position" + string(x) + ", " + string(y)
show_debug_message(debug_message);
*/

#region //Get inputs (1 = pressed, 0 = not pressed)
if (dead = false) {
	key_right = global.key_right_player;
	key_left = global.key_left_player;
	key_fire_projectile = global.key_fire_projectile;

	key_right_pressed = global.key_right_pressed_player;
	key_left_pressed = global.key_left_pressed_player;
	
	key_recenter = global.key_recenter;
	if use_mouse {
		key_fire_projectile_pressed = global.key_fire_projectile_pressed;
		key_fire_projectile_released = global.key_fire_projectile_released;
	}else {
		key_fire_projectile_pressed = global.key_fire_projectile_pressed;
		key_fire_projectile_released = global.key_fire_projectile_released;
	}
	key_pickup_1 = global.key_pickup_1;
	key_pickup_2 = global.key_pickup_2;
	key_pickup_1_pressed = global.key_pickup_1_pressed;
	key_pickup_2_pressed = global.key_pickup_2_pressed;
}else {
	key_right = 0;
	key_left = 0;
	key_fire_projectile = 0;
	key_right_pressed = 0;
	key_left_pressed = 0;
	key_recenter = 0;
	key_fire_projectile_pressed = 0;
	key_fire_projectile_released = 0;
	key_pickup_1 = 0;
	key_pickup_2 = 0;
}
#endregion

//get mask object
msk_index = instance_nearest(x,y,obj_player_mask);

//land on and damage enemy
var condition = ground_pound_slam = false;
scr_Enemy_Collision_Check(condition);

//shop
if (room = room_shop) and state != state_shop_portal {
	state = state_shop;
}

//get sprites
//scr_Get_Player_Sprites();

if current_iframes <= 0 {
	bubble = false;	
}

//run state machine
state();

#region //pickups

//call pickups
if room != room_shop and table = false {
	if pickups_array[0].on_cooldown = false and pickups_array[0].reload_on_bounce = false and pickups_array[0].enemies_count_max = 0 { //cooldown
		if (key_pickup_1) and scr_In_Array(pickups_array[0].states_to_call_in, state) and pickups_array[0].key_held 
		or (key_pickup_1_pressed) and scr_In_Array(pickups_array[0].states_to_call_in, state) and !pickups_array[0].key_held {
			pickups_array[0].on_call();
		}
	}else if pickups_array[0].reload_on_bounce = true and pickups_array[0].uses_per_bounce > 0 and pickups_array[0].enemies_count_max = 0 { //no cooldown
		if (key_pickup_1) and scr_In_Array(pickups_array[0].states_to_call_in, state) and pickups_array[0].key_held 
		or (key_pickup_1_pressed) and scr_In_Array(pickups_array[0].states_to_call_in, state) and !pickups_array[0].key_held {
			pickups_array[0].on_call();   
		}
	}else if pickups_array[0].enemies_count_max > 0 and pickups_array[0].enemies_count <= 0 {
		if (key_pickup_1) and scr_In_Array(pickups_array[0].states_to_call_in, state) and pickups_array[0].key_held 
		or (key_pickup_1_pressed) and scr_In_Array(pickups_array[0].states_to_call_in, state) and !pickups_array[0].key_held {
			pickups_array[0].on_call();
		}
	}  
	
	//call pickup 2
	if pickups_array[1].on_cooldown = false and pickups_array[1].reload_on_bounce = false and pickups_array[1].enemies_count_max = 0 { //cooldown
		if (key_pickup_2) and scr_In_Array(pickups_array[1].states_to_call_in, state) and pickups_array[1].key_held 
		or (key_pickup_2_pressed) and scr_In_Array(pickups_array[1].states_to_call_in, state) and !pickups_array[1].key_held {
			pickups_array[1].on_call();
		}
	}else if pickups_array[1].reload_on_bounce = true and pickups_array[1].uses_per_bounce > 0 and pickups_array[1].enemies_count_max = 0 { //no cooldown
		if (key_pickup_2) and scr_In_Array(pickups_array[1].states_to_call_in, state) and pickups_array[1].key_held 
		or (key_pickup_2_pressed) and scr_In_Array(pickups_array[1].states_to_call_in, state) and !pickups_array[1].key_held {
			pickups_array[1].on_call();
		}
	}else if pickups_array[1].enemies_count_max > 0 and pickups_array[1].enemies_count <= 0 {
		if (key_pickup_2) and scr_In_Array(pickups_array[1].states_to_call_in, state) and pickups_array[1].key_held 
		or (key_pickup_2_pressed) and scr_In_Array(pickups_array[1].states_to_call_in, state) and !pickups_array[1].key_held {
			pickups_array[1].on_call();
		}
	}
}

//cooldowns
for (i = 0; i <= 1; i++) {
	if pickups_array[i].reload_on_bounce = false {
		if pickups_array[i].on_cooldown and pickups_array[i].cooldown_time > 0 and pickups_array[i].enemies_count_max = 0 {
			pickups_array[i].cooldown_time -= 1;
		}else if pickups_array[i].on_cooldown and pickups_array[i].enemies_count_max = 0 {
			pickups_array[i].on_cooldown = false;
			pickups_array[i].cooldown_time = pickups_array[i].max_cooldown_time;
		}else if pickups_array[i].on_cooldown and pickups_array[i].enemies_count <= 0 {
			pickups_array[i].on_cooldown = false;
		}
	}
}

// if player has obtained Impatience passive item, reduce all cooldown times by 25%
if(global.impatience == true and impatience_used = false){
	var cd_multiplier = 0.75;
	for(var i = 0; i < array_length(all_pickups_array); i++){
		if all_pickups_array[i].cooldown_time = all_pickups_array[i].max_cooldown_time {
			all_pickups_array[i].cooldown_time = all_pickups_array[i].max_cooldown_time * cd_multiplier;
			all_pickups_array[i].max_cooldown_time = all_pickups_array[i].max_cooldown_time * cd_multiplier;
		}else {
			all_pickups_array[i].max_cooldown_time = all_pickups_array[i].max_cooldown_time * cd_multiplier;
		}
		
		if all_pickups_array[i].bounce_reset = all_pickups_array[i].bounce_reset_max 
		and all_pickups_array[i].bounce_reset_max > 1 {
			all_pickups_array[i].bounce_reset -= 1;
			all_pickups_array[i].bounce_reset_max -= 1;
		}else if all_pickups_array[i].bounce_reset_max > 1 {
			all_pickups_array[i].bounce_reset_max -= 1;
		}
		
		if all_pickups_array[i].enemies_count = all_pickups_array[i].enemies_count_max 
		and all_pickups_array[i].enemies_count_max > 1 {
			all_pickups_array[i].enemies_count -= 1;
			all_pickups_array[i].enemies_count_max -= 1;
		}else if all_pickups_array[i].enemies_count_max > 1 {
			all_pickups_array[i].enemies_count_max -= 1;
		}
		
		
	}
	impatience_used = true;
}


#endregion



//reset ground pound variables
if harpooning = true and state != state_grappling {
	if speed < 8 or vspeed > 0 {
		harpooning = false;
		invincible = false;
	}
}
if state != state_groundpound and harpooning = false and state != state_megabounce {
	ground_pound_slam = false;
	//can_shoot = true;
	slam_speed = 12;
	slam_trail_distance = 0;
}

//stop sounds
if audio_is_playing(snd_jetpack){
	var not_jetpack_button_1 = !(key_pickup_1 and pickups_array[0] = pickup_jetpack);
	var not_jetpack_button_2 = !(key_pickup_2 and pickups_array[1] = pickup_jetpack);
	if not_jetpack_button_1 and not_jetpack_button_2 {
		audio_stop_sound(snd_jetpack);
	}
}	




if state != state_portal and state != state_shop_portal {
	image_angle = angle;
}
#endregion

//recentering
if key_recenter and centering = false and angle != 0 and !key_left and !key_right and can_rotate {
	centering = true;
}

if centering = true and can_rotate or centering = true and state = state_pogosmith {
	can_rotate = false;
	if angle >= rotation_speed or angle <= -rotation_speed {
		angle += rotation_speed * -sign(angle);
	}else {
		angle = 0;
		can_rotate = true;
		centering = false;
	}
	
	//stop if right or left key
	if !instance_exists(obj_salesman_table) and !instance_exists(obj_pogosmith_table) { 
		if key_left or key_right or state = state_bouncing {
			can_rotate = true;
			centering = false;
		}
	}else {
		if instance_exists(obj_salesman_table) and instance_exists(obj_pogosmith_table) {
			if obj_salesman_table.being_used = false and obj_pogosmith_table.being_used = false {
				if key_left or key_right or state = state_bouncing {
					can_rotate = true;
					centering = false;
				}
			}
		}else if instance_exists(obj_salesman_table) {
			if obj_salesman_table.being_used = false {
				if key_left or key_right or state = state_bouncing {
					can_rotate = true;
					centering = false;
				}
			}
		}else if instance_exists(obj_pogosmith_table) {
			if obj_pogosmith_table.being_used = false {
				if key_left or key_right or state = state_bouncing {
					can_rotate = true;
					centering = false;
				}
			}
		}
	}
}

#region shooting

if global.key_fire_projectile_pressed {
	global.water_index += 1;	
}

if can_shoot = true and room != room_shop { 
	var shoot = (gun.full_auto and fullauto_condtional = true) ? key_fire_projectile : key_fire_projectile_pressed;
	if gun = laser_gun and !instance_exists(obj_laser) or gun = javelin_gun and !instance_exists(obj_javelin_charge) { //special conditions for laser gun and javelins
		shoot = key_fire_projectile;
	}
	if key_fire_projectile_pressed and gun.current_bullets <= 0 {
		audio_play_sound(snd_outofammo,0,false);
	}
}else {
	var shoot = 0;
	global.water_index += 1;
}

var ammo = gun.ammo[bullet_index];
//ammo += max_ammo_increase;// increase ammo by max ammo increase if players has collected max ammo buffs

//six shooter
if gun = sixshooter_gun and shoot = true {
	sixshooter_held = true;
}
if gun = sixshooter_gun and state = state_bouncing and key_fire_projectile {
	sixshooter_held = true;
	if sixshooter_held_num < 15 {
		sixshooter_held_num = 15;
	}
	sixshooter_held_num += 1;
	fullauto_condtional = false;
	sixshooter_gun.inaccuracy = 15;
}
if sixshooter_held = true and gun = sixshooter_gun {
	if key_fire_projectile {
		sixshooter_held_num += 1;
		if sixshooter_held_num >= 45 {
			if fullauto_condtional = false {
				fullauto_condtional = true;
				sixshooter_gun.current_bullets += 0;
				if sixshooter_gun.current_bullets > sixshooter_gun.bullets_per_bounce {
					sixshooter_gun.current_bullets = sixshooter_gun.bullets_per_bounce;
				}
				sixshooter_gun.spread_angle = 0;
			}
			sixshooter_gun.inaccuracy = 15;
			if hspeed != 0 {
				//sixshooter_gun.spread_angle += 4 * sign(hspeed);
			}else {
				//sixshooter_gun.spread_angle += 4 * sign(image_xscale);
			}
			sixshooter_gun.max_speed += 0.075;
			if sixshooter_gun.max_speed > 8.5 {
				sixshooter_gun.max_speed = 8.5;
			}
			shoot = true;
		}
	}else if !key_fire_projectile and sixshooter_held_num < 45 {
		sixshooter_held_num = 0;
		sixshooter_held = false;
		fullauto_condtional = gun != sixshooter_gun;
		sixshooter_gun.inaccuracy = 5;
		sixshooter_gun.max_speed = -vsp_basicjump;
		sixshooter_gun.spread_angle = 0;
	}else if !key_fire_projectile and sixshooter_gun.inaccuracy = 25 {
		sixshooter_held_num += 1;
		if sixshooter_held_num >= 30 {
			if fullauto_condtional = false {
				fullauto_condtional = true;
				sixshooter_gun.current_bullets += 0;
				if sixshooter_gun.current_bullets > sixshooter_gun.bullets_per_bounce {
					sixshooter_gun.current_bullets = sixshooter_gun.bullets_per_bounce;
				}
				sixshooter_gun.spread_angle = 0;
			}
			if hspeed != 0 {
				//sixshooter_gun.spread_angle += 4 * sign(hspeed);
			}else {
				//sixshooter_gun.spread_angle += 4 * sign(image_xscale);
			}
			sixshooter_gun.inaccuracy = 25;
			sixshooter_gun.max_speed += 0.075;
			if sixshooter_gun.max_speed > 8.5 {
				sixshooter_gun.max_speed = 8.5;
			}
			shoot = true;
		}
	}
}else {
	fullauto_condtional = gun != sixshooter_gun;
	sixshooter_gun.inaccuracy = 5;
	sixshooter_gun.max_speed = -vsp_basicjump;
	sixshooter_held_num = 0;
	sixshooter_gun.spread_angle = 0;
}

if gun.current_bullets <= 0 {
	fullauto_condtional = true;	
	sixshooter_gun.inaccuracy = 5;
	sixshooter_gun.max_speed = -vsp_basicjump;
	if !key_fire_projectile and state != state_bouncing {
		sixshooter_held_num = 0;
		sixshooter_held = false;
	}
}
	
if !key_fire_projectile and state = state_bouncing {
	sixshooter_held_num = 0;
	sixshooter_held = false;
}

if (canshoot > 0) {
	canshoot -= 1;
}else if (shoot) {
	//reset firerate
	canshoot = ammo.firerate;
	
	if gun.spread_number = 1 and tripleshot = true {
		if gun != water_gun and gun != laser_gun {
			gun.spread_number = 3;
		}
	}else if gun.spread_number = 3 and tripleshot = false and !(gun._name = "Javelins" and gun.level >= 2)  
	and !(gun._name = "Pistol" and gun.level >= 4) and !(gun._name = "Burst Rifle" and gun.level >= 4) {
		gun.spread_number = 1;
	}
	
	//lerp firerate to end while shooting
	ammo.firerate = lerp(ammo.firerate, ammo.firerate_end, ammo.firerate_mult);
	
	if ((gun.current_bullets) > 0 and state != state_bouncing and state != state_chargejump and table = false) {
		scr_Shoot();
	
		var delay = gun.burst_delay;
		
		repeat (gun.burst_number - 1) {
			if gun._name = "Burst Rifle" and delay = gun.burst_delay {
				current_burst = 1;
				audio_play_sound(gun.sound,0,false);	
			}
			call_later(delay,time_source_units_frames,scr_Shoot);
			delay += gun.burst_delay;
		}
		
		//decrease ammo count for spread weapons
		if gun.spread_number > 1 and frenzy = false and pogomode = false and aerial_assassin_frenzy = false and gun._name != "Javelins" {
			gun.current_bullets -= 1;
		}
	}else {
		if (audio_is_playing(snd_watergun)) {
			audio_stop_sound(snd_watergun);
		}
	}	

}else {
	if (audio_is_playing(snd_watergun)) {
		audio_stop_sound(snd_watergun);
	}
}

if frenzy_time > 0 {
	frenzy_time -= 1;	
}

if invincibility_time > 0 {
	invincibility_time -= 1;	
}

if tripleshot_time > 0 {
	tripleshot_time -= 1;	
}


if aerial_assassin_frenzy_count > 0 {
	aerial_assassin_frenzy_count -= 1;
}

if pogomode_time > 0 {
	pogomode_time -= 1;	
}

if pogomode = true {
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

if !(key_fire_projectile) { //lerp back to starting firerate while not shooting
	ammo.firerate = lerp(ammo.firerate, ammo.firerate_start, ammo.firerate_mult);
}

//auto reload water gun
if gun_array[current_gun] = water_gun and !global.key_fire_projectile
or gun_array[current_gun] != water_gun and gun_1 = water_gun
or gun_array[current_gun] != water_gun and gun_2 = water_gun
or gun_array[current_gun] != water_gun and gun_3 = water_gun {
	if water_gun.current_bullets < water_gun.bullets_per_bounce+max_ammo_buff and gun_array[current_gun] = water_gun {
		if water_gun.level = 1 {
			water_gun.current_bullets += 1/3;
		}else if water_gun.level = 2 {
			water_gun.current_bullets += 3/5;
		}else if water_gun.level = 3 {
			water_gun.current_bullets += 3/5;
		}else if water_gun.level >= 4 {
			water_gun.current_bullets += 1;
		}
	}else if water_gun.current_bullets < water_gun.bullets_per_bounce+max_ammo_buff {
		if water_gun.level = 1 {
			water_gun.current_bullets += 1/10;
		}else if water_gun.level = 2 {
			water_gun.current_bullets += 1/10;
		}if water_gun.level = 3 {
			water_gun.current_bullets += 1/5;
		}if water_gun.level >= 4 {
			water_gun.current_bullets += 1/3;
		}
	}else {
		water_gun.current_bullets = water_gun.bullets_per_bounce+max_ammo_buff;
	}
}

#endregion

if gun_1._name != "Burst Rifle" and gun_2._name != "Burst Rifle" and gun_3._name != "Burst Rifle" {
	current_burst = 0;
}

//switch between weapons
if global.key_weapon_up and current_burst = 0 {
	if (current_gun) < weapons_equipped-1 {
		current_gun += 1;
	}else {
		current_gun = 0;
	}
	
	gun = gun_array[current_gun];
	weapon_arrow_index = 0;
}

if global.key_weapon_down and current_burst = 0 {
	if (current_gun) > 0 {
		current_gun -= 1;
	}else {
		current_gun = weapons_equipped-1;
	}
	
	gun = gun_array[current_gun];
	weapon_arrow_index = 0;
}

//number keys
if global.key_weapon_1 and current_burst = 0 {
	current_gun = 0;
	gun = gun_array[current_gun];
	weapon_arrow_index = 0;
}else if global.key_weapon_2 and weapons_equipped > 1 and current_burst = 0 {
	current_gun = 1;
	gun = gun_array[current_gun];
	weapon_arrow_index = 0;
}
else if global.key_weapon_3 and weapons_equipped > 2 and current_burst = 0 {
	current_gun = 2;
	gun = gun_array[current_gun];
	weapon_arrow_index = 0;
}


if gun_2 = gun_1 {
	weapons_equipped = 1;	
}else if gun_2 != gun_1 and gun_3 = gun_1 or gun_2 != gun_1 and gun_3 = gun_2 {
	weapons_equipped = 2;	
}else if gun_2 != gun_1 and gun_3 != gun_1 and gun_3 != gun_2 {
	weapons_equipped = 3;
}

//juggler passive
if global.juggler = true {
	if weapons_equipped = 2 {
		if gun_1.current_bullets = 0 and gun_2.current_bullets = 0 {
			if current_gun = 0 {
				gun_2.current_bullets = gun_2.bullets_per_bounce;
				instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
			}else if current_gun = 1 {
				gun_1.current_bullets = gun_1.bullets_per_bounce;
				instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
			}
		}
	}else if weapons_equipped = 3 {
		if gun_1.current_bullets = 0 and gun_2.current_bullets = 0 {
			if current_gun = 0 {
				gun_2.current_bullets = gun_2.bullets_per_bounce;
				instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
			}else if current_gun = 1 {
				gun_1.current_bullets = gun_1.bullets_per_bounce;
				instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
			}
		}else if gun_1.current_bullets = 0 and gun_3.current_bullets = 0 {
			if current_gun = 0 {
				gun_3.current_bullets = gun_3.bullets_per_bounce;
				instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
			}else if current_gun = 2 {
				gun_1.current_bullets = gun_1.bullets_per_bounce;
				instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
			}
		}if gun_2.current_bullets = 0 and gun_3.current_bullets = 0 {
			if current_gun = 1 {
				gun_3.current_bullets = gun_3.bullets_per_bounce;
				instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
			}else if current_gun = 2 {
				gun_2.current_bullets = gun_2.bullets_per_bounce;
				instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
			}
		}
	}
}

// Update iframes
current_iframes = max(current_iframes - 1, 0);

//create death screen
if (dead = true and global.revive = false and state != state_revive) {
	//death screen
	if !instance_exists(obj_deathscreen) {
		instance_create_depth(x,y,depth-1000,obj_deathscreen);
		speed /= 2;
		audio_play_sound(snd_player_death,0,false);
	}
	
	//fall through ground on death
	mask_index = spr_nothing;
	state = state_dead;
	with obj_player_mask {
		mask_index = spr_nothing;
	}
	
	if y > obj_camera.y + (obj_camera.view_h_half) + 48 {
		state = state_immobile;
	}else if room = room_boss_3 {
		mask_index = spr_nothing;
		with obj_player_mask {
			mask_index = spr_nothing;
		}
	}
}

// Handle death
dead = hp <= 0;
if(dead && current_iframes <= 0 and global.revive = false) {
	//see stats
	with obj_runstats {
		event_user(0);	
	}
}else if (dead && current_iframes <= 0 and global.revived = false) {
	//Revive
	global.revived = true;
	if room != room_tutorial {
		global.revive = false;
	}
	hp = floor((max_hp/8)/2) * 8;
	state = state_revive;
	revive_alpha = 1;
	current_iframes = max(current_iframes - 1, 0);
	
	if room != room_tutorial {
		//change revive item sprite
		for (i = 0; i < array_length(global.all_buff_sprites); i++) {
			if global.all_buff_sprites[i] = spr_buffitem_revive {
				//update image index
				global.all_buff_sprites_index[i] += 2;
			}
		}
		//change revive item name
		for (i = 0; i < array_length(global.all_buff_names); i++) {
			if global.all_buff_names[i] = "Revive" {
				global.all_buff_names[i] = "Revive (Used)";
			}
		}
	}
}else if (dead && current_iframes <= 0) {
	//see stats
	with obj_runstats {
		event_user(0);	
	}
}

//One Heart Stresser
if (hp <= 8 and hp > 0) {
	if !audio_is_playing(snd_oneHeart) {
		//audio_play_sound(snd_oneHeart,0,false);
	}	
}

if !dead and state != state_revive {
	global.revived = false;
	revive_time = 0;
}

if room = room_items {
	speed = 0;
}	
	
	
//revive fade out
if revive_alpha > 0 {
	revive_alpha -= 0.05;	
}

weapon_arrow_index += 0.05;

// In the Step Event of obj_player
if (damage_boost_active) {
    damage_boost_timer -= 1;
    if (damage_boost_timer <= 0) {
        damage_boost_active = false;
        damage_boost_timer = 0; // Reset the timer for safety.
    }
}

if audio_is_playing(snd_bulletblast) and state = state_bouncing or dead = true {
	audio_stop_sound(snd_bulletblast);
}

//for testing
//hp = 40;

//speed cap for player
vspeed = min(16,vspeed);

//snail slime collision
if(place_meeting(x, y, obj_enemy_snail_slime)) {
	snail_slime_object = instance_place(x, y, obj_enemy_snail_slime);
	vsp_basicjump = snail_slime_object.diminished_player_jump;
	snail_slime_object.is_touching_player = true;
	snail_slime_object.wobble = 0.4;
	depth = snail_slime_object.depth + 5;
}else if depth != init_depth {
	depth = init_depth;	
}

//delete grappling hook

with obj_projectile {
	if gun_name = "Grappling Helmet"  {
		var not_grappling_1 = !(other.key_pickup_1) and other.pickups_array[0] = other.pickup_grappling;
		var not_grappling_2 = !(other.key_pickup_2) and other.pickups_array[1] = other.pickup_grappling;
		if not_grappling_1 or not_grappling_2 {
			retract = true;
			//spd = 0;
		}
	}else if gun_name = "Harpoon Helmet"  {
		var not_grappling_1 = !(other.key_pickup_1) and other.pickups_array[0] = other.pickup_harpoon;
		var not_grappling_2 = !(other.key_pickup_2) and other.pickups_array[1] = other.pickup_harpoon;
		if not_grappling_1 or not_grappling_2 {
			retract = true;
			//spd = 0;
		}
	}
}

//wearing hat
if pickups_array[0] = pickup_hatgun or pickups_array[1] = pickup_hatgun
or pickups_array[0] = pickup_grappling or pickups_array[1] = pickup_grappling
or pickups_array[0] = pickup_harpoon or pickups_array[1] = pickup_harpoon {
	wearing_hat = true;
}else {
	wearing_hat = false;
}

num_iframes = (1.5 + iframes_add) * room_speed;

//show_debug_message("Player X: " + string(x) + " Player Y: " + string(y));

if global.triplethreat = true {
	num_of_weapons = 3;
}

if mask_index != spr_nothing {
	mask_index = spr_player_zekai;	
}

synergy_frame += 0.25;