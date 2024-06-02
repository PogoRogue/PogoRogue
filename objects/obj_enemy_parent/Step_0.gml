/// @description Handle death

if(is_dead) {
	image_alpha *= 0.9;
	mask_index = spr_nothing;
	spd = 0;
	speed = 0;
	if image_alpha <= 0.005 {
		instance_destroy();	
	}
} else if (hp <= 0) {
	alarm_set(0, despawn_timer);
	alarm_set(11, 10);
	randomize();
	var random_death_sound = choose(snd_enemy_death,snd_enemy_death2,snd_enemy_death3);
	random_set_seed(global.seed);
	if !audio_is_playing(random_death_sound) {
		audio_play_sound(random_death_sound,0,false);
	}
	
	//screen shake
	scr_Screen_Shake(6, 10, false);
	
	//combo
	if room != room_boss_1 and room != room_boss_2 and room != room_boss_3 { 
		global.combo += 1;
		global.combo_length = global.combo_max;
		if global.combo > 0 and global.combo % 10 = 0 and global.combo_master = true { //combo master powerup
			with obj_player {
				if hp < max_hp {
					hp += 8;
					with obj_player_health {
						heart_gain_num = other.hp;	
					}
					audio_play_sound(snd_heartPickup,0,false);
				}
			}
		}
		global.enemy_killed = true;
		
		//aerial assassin buff (old version)
		with obj_player {
			if global.aerial_assassin = true {
				aerial_assassin_count += 1;	
				if aerial_assassin_count >= 3 {
					//global.combo += 1; (old version)
					gun_1.current_bullets = gun_1.bullets_per_bounce + max_ammo_buff;
					gun_2.current_bullets = gun_2.bullets_per_bounce + max_ammo_buff;
					gun_3.current_bullets = gun_3.bullets_per_bounce + max_ammo_buff;
					aerial_assassin_frenzy = true;
					alarm[4] = 120;
					aerial_assassin_frenzy_count = 120;
					aerial_assassin_count = 0;
				}
			}
		}
	}
	
	//create coins and items
	var center_x = x - sprite_get_xoffset(sprite_index) + ((sprite_width / 2)*image_xscale);
	var center_y = y - sprite_get_yoffset( sprite_index) + sprite_height / 2;
	if drop_coins = true {
		with instance_create_depth(center_x,center_y,depth-1,obj_coin_spawner) {
			if global.combo < global.combo_max_coins {
				num_of_coins = global.combo + global.added_coins;
			}else {
				num_of_coins = global.combo_max_coins + global.added_coins;
			}
			if(global.robbery == true and obj_player.landed_on_enemy == true){
				num_of_coins *= 2;
				obj_player.landed_on_enemy = false;
			}
		}
	}
	
	if (created_items2 = false and heart_drop > heart_chance) {
		Create_Item_Drops(random_items);
		created_items2 = true;
	}
	
	with obj_player {
		//lower enemy kill cooldowns
		if pickups_array[0].enemies_count_max > 0 and pickups_array[0].enemies_count > 0 {
			//account for double/triple/quadruple kill passive
			if global.combo <= 10 or obj_player.double_kill = 0 {
				pickups_array[0].enemies_count -= 1;
			}else if global.combo > 10 and obj_player.double_kill = 1
			or global.combo > 10 and global.combo <= 20 and obj_player.double_kill > 1 {
				pickups_array[0].enemies_count -= 2;
			}else if global.combo > 20 and obj_player.double_kill = 2
			or global.combo > 20 and global.combo <= 30 and obj_player.double_kill > 2 {
				pickups_array[0].enemies_count -= 3;
			}else if global.combo > 30 and obj_player.double_kill > 2 {
				pickups_array[0].enemies_count -= 4;
			}
		}
		if pickups_array[1].enemies_count_max > 0 and pickups_array[1].enemies_count > 0 {
			//account for double/triple/quadruple kill passive
			if global.combo <= 10 or obj_player.double_kill = 0 {
				pickups_array[1].enemies_count -= 1;
			}else if global.combo > 10 and obj_player.double_kill = 1
			or global.combo > 10 and global.combo <= 20 and obj_player.double_kill > 1 {
				pickups_array[1].enemies_count -= 2;
			}else if global.combo > 20 and obj_player.double_kill = 2
			or global.combo > 20 and global.combo <= 30 and obj_player.double_kill > 2 {
				pickups_array[1].enemies_count -= 3;
			}else if global.combo > 30 and obj_player.double_kill > 2 {
				pickups_array[1].enemies_count -= 4;
			}
		}
		
		//recharge jetpack
		if pickups_array[0] = pickup_jetpack {
			pickups_array[0].cooldown_time += pickups_array[0].max_cooldown_time/4;
			if pickups_array[0].cooldown_time > pickups_array[0].max_cooldown_time {
				pickups_array[0].cooldown_time = pickups_array[0].max_cooldown_time;
			}
		}
		if pickups_array[1] = pickup_jetpack {
			pickups_array[1].cooldown_time += pickups_array[1].max_cooldown_time/4;
			if pickups_array[1].cooldown_time > pickups_array[1].max_cooldown_time {
				pickups_array[1].cooldown_time = pickups_array[1].max_cooldown_time;
			}
		}
	}
	
	is_dead = true;
	mask_index = spr_nothing;
	
	if(proc_gen_tag != -1 && instance_exists(obj_proc_gen_location_analysis))
	{
			show_debug_message("Enemy killed! +1 added, region: " + string(proc_gen_tag));		
		
			//Decrease enemy count for region
			var location_obj = instance_nearest(x,y,obj_proc_gen_location_analysis);
			with(location_obj)
			{
				var enemies_in_region = ds_list_find_value(region_enemy_count, other.proc_gen_tag);
				ds_list_set(region_enemy_count, other.proc_gen_tag, enemies_in_region - 1);
			
				//Check gate open condition
				var gate_list_val = ds_list_find_value(region_gate_objects, other.proc_gen_tag);
				if(gate_list_val != 0) //Do something only if there's a gate for this region
				{
					if(instance_exists(gate_list_val))
					{
						var enemies_in_region = ds_list_find_value(region_enemy_count, other.proc_gen_tag);
						gate_list_val.current_enemies_in_region = enemies_in_region;							
						show_debug_message(enemies_in_region);
						gate_list_val.alarm[1] = 1; //Tells the gate to check it's opening condition
					}
				}
			}
	}
	else {
		show_debug_message("Enemy killed! Couldn't change region enemy count");
	}
	
	//fast forward passive
	with obj_player {
		if global.fast_forward > 0 {
			scr_Reduce_Colldown_Times(global.fast_forward * 60);
		}
	}

	global.current_enemies_killed += 1;
	global.enemies_killed += 1;
	scr_Save_Real("enemies_killed",global.enemies_killed);
}

// Update iframes
current_iframes = max(current_iframes - 1, 0);

// Update red shader frames
red_frames = max(red_frames - 1, 0);
