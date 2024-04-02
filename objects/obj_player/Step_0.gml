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
scr_Get_Player_Sprites();

//run state machine
state();

#region //pickups

//call pickups
if room != room_shop {
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
	}
	impatience_used = true;
}


#endregion

//reset ground pound variables
if state != state_groundpound {
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

if centering = true and can_rotate {
	can_rotate = false;
	if angle >= rotation_speed or angle <= -rotation_speed {
		angle += rotation_speed * -sign(angle);
	}else {
		angle = 0;
		can_rotate = true;
		centering = false;
	}
	
	//stop if right or left key
	if key_left or key_right or state = state_bouncing {
		can_rotate = true;
		centering = false;
	}
}

#region shooting

if global.key_fire_projectile_pressed {
	global.water_index += 1;	
}

if can_shoot = true and room != room_shop { 
	var shoot = gun.full_auto ? key_fire_projectile : key_fire_projectile_pressed;
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

if (canshoot > 0) {
	canshoot -= 1;
}else if (shoot) {
	//reset firerate
	canshoot = ammo.firerate;
	
	//lerp firerate to end while shooting
	ammo.firerate = lerp(ammo.firerate, ammo.firerate_end, ammo.firerate_mult);
	
	if ((gun.current_bullets) > 0 and state != state_bouncing and state != state_chargejump) {
		scr_Shoot();
	
		var delay = gun.burst_delay;
		
		repeat (gun.burst_number - 1) {
			if gun._name = "Burst Fire Gun" and delay = gun.burst_delay {
				audio_play_sound(snd_burstfire,0,false);	
			}
			call_later(delay,time_source_units_frames,scr_Shoot);
			delay += gun.burst_delay;
		}
		
		//decrease ammo count for spread weapons
		if gun.spread_number > 1 and frenzy = false {
			gun.current_bullets -= 1;
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
		water_gun.current_bullets += 1/3;
	}else if water_gun.current_bullets < water_gun.bullets_per_bounce+max_ammo_buff {
		water_gun.current_bullets += 1/10;
	}else {
		water_gun.current_bullets = water_gun.bullets_per_bounce+max_ammo_buff;
	}
}

#endregion

//switch between weapons
if global.key_weapon_up {
	if (current_gun) < weapons_equipped-1 {
		current_gun += 1;
	}else {
		current_gun = 0;
	}
	
	gun = gun_array[current_gun];
	weapon_arrow_index = 0;
}

if global.key_weapon_down {
	if (current_gun) > 0 {
		current_gun -= 1;
	}else {
		current_gun = weapons_equipped-1;
	}
	
	gun = gun_array[current_gun];
	weapon_arrow_index = 0;
}

//number keys
if global.key_weapon_1 {
	current_gun = 0;
	gun = gun_array[current_gun];
	weapon_arrow_index = 0;
}else if global.key_weapon_2 and weapons_equipped > 1 {
	current_gun = 1;
	gun = gun_array[current_gun];
	weapon_arrow_index = 0;
}
else if global.key_weapon_3 and weapons_equipped > 2 {
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
			}else if current_gun = 1 {
				gun_1.current_bullets = gun_1.bullets_per_bounce;
			}
		}
	}else if weapons_equipped = 3 {
		if gun_1.current_bullets = 0 and gun_2.current_bullets = 0 {
			if current_gun = 0 {
				gun_2.current_bullets = gun_2.bullets_per_bounce;
			}else if current_gun = 1 {
				gun_1.current_bullets = gun_1.bullets_per_bounce;
			}
		}else if gun_1.current_bullets = 0 and gun_3.current_bullets = 0 {
			if current_gun = 0 {
				gun_3.current_bullets = gun_3.bullets_per_bounce;
			}else if current_gun = 2 {
				gun_1.current_bullets = gun_1.bullets_per_bounce;
			}
		}if gun_2.current_bullets = 0 and gun_3.current_bullets = 0 {
			if current_gun = 1 {
				gun_3.current_bullets = gun_3.bullets_per_bounce;
			}else if current_gun = 2 {
				gun_2.current_bullets = gun_2.bullets_per_bounce;
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
	}
	
	//fall through ground on death
	mask_index = spr_nothing;
	state = state_dead;
	with obj_player_mask {
		mask_index = spr_nothing;
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
	global.revive = false;
	hp = floor((max_hp/8)/2) * 8;
	state = state_revive;
	revive_alpha = 1;
	current_iframes = max(current_iframes - 1, 0);
	
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
}else if (dead && current_iframes <= 0) {
	//see stats
	with obj_runstats {
		event_user(0);	
	}
}

//One Heart Stresser
if (hp <= 8 and hp > 0) {
	if !audio_is_playing(snd_oneHeart) {
		audio_play_sound(snd_oneHeart,0,false);
	}	
}

if room = room_items {
	speed = 0;
}	
	
	
//revive fade out
if revive_alpha > 0 {
	revive_alpha -= 0.05;	
}

weapon_arrow_index += 0.05;