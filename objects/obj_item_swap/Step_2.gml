key_left = global.key_left_menu;
key_right = global.key_right_menu;
key_select = global.key_interact and global.use_keyboard or global.key_select;

if selected = false and fade_away = false and centered = true {
	if key_left {
		if select > 1 {
			audio_play_sound(snd_menuNavigation,0,false);
			select -= 1;
		}
		selected = true;
	}
	if key_right {
		if select < num_of_slots {
			audio_play_sound(snd_menuNavigation,0,false);
			select += 1;
		}
		selected = true;
	}
}else {
	if !key_left and !key_right {
		selected = false;
	}
}

if key_select and fade_away = false and centered = true {
	//slot 1
	if select = 1 {
		audio_play_sound(snd_selectOption,0,false);
		sprite_1 = sprite_new;
		sprite_new = spr_nothing;
		item_name = "";
		with obj_pause {
			item_swap = false;
			paused_outside = true;	
		}
		//change gun
		instance_activate_object(obj_player);
		with obj_player {
			if other.pickups_mode = true {
				global.all_pickup_costs[0] = other.new_item_cost;
				
				pickup_1 = other.new_item;
				pickups_array = [pickup_1, pickup_2];
			}else if other.weapons_mode = true  {
				global.all_weapon_costs[0] = other.new_item_cost;
				
				if weapons_equipped = 2 {
					gun_1 = other.new_item;
					gun_3 = gun_1;
					gun_array = [gun_1, gun_2, gun_3];
					gun = gun_array[current_gun];
				}else if weapons_equipped = 3 {
					gun_1 = other.new_item;
					gun_array = [gun_1, gun_2, gun_3];
					gun = gun_array[current_gun];
				}
			}
		}
		
		//experimentation buff
		if global.experimentation = true {
			with obj_player {
				if hp < max_hp {
					hp += 8;	
					audio_play_sound(snd_heartPickup,0,false);
					instance_activate_object(obj_player_health);
					with obj_player_health {
						heart_gain_num = other.hp;	
					}
				}
			}
			//global.num_of_coins += experimenting_coins;
			//global.current_total_coins += experimenting_coins;
			//alarm[2] = 1;
		}
		
		if weapons_mode = true {
			ini_open("itemsunlocked.ini");
			if scr_In_Array(obj_player.all_guns_array,new_item) {
				for(i = 0; i < array_length(obj_player.all_guns_array);i++) {
					if obj_player.all_guns_array[i] = new_item {
						global.weapon_unlocked_array[i] = true;
						ini_write_real("itemsunlocked", "weapon " + string(i), global.weapon_unlocked_array[i]);
					}
				}
			}
			ini_close();
		}
		
		if pickups_mode = true {
			ini_open("itemsunlocked.ini");
			if scr_In_Array(obj_player.all_pickups_array,new_item) {
				for(i = 0; i < array_length(obj_player.all_pickups_array);i++) {
					if obj_player.all_pickups_array[i] = new_item {
						global.active_unlocked_array[i] = true;
						ini_write_real("itemsunlocked", "active " + string(i), global.active_unlocked_array[i]);
					}
				}
			}
			ini_close();
		}
	}
	//slot 2
	if select = 2 {
		audio_play_sound(snd_selectOption,0,false);
		sprite_2 = sprite_new;
		sprite_new = spr_nothing;
		item_name = "";
		with obj_pause {
			item_swap = false;
			paused_outside = true;	
		}
		//change gun
		instance_activate_object(obj_player);
		with obj_player {
			if other.pickups_mode = true {
				global.all_pickup_costs[1] = other.new_item_cost;
				
				pickup_2 = other.new_item;
				pickups_array = [pickup_1, pickup_2];
			}else if other.weapons_mode = true  {
				global.all_weapon_costs[1] = other.new_item_cost;
				gun_2 = other.new_item;
				gun_array = [gun_1, gun_2, gun_3];
				gun = gun_array[current_gun];
			}
		}
		
		//experimentation buff
		if global.experimentation = true {
			with obj_player {
				if hp < max_hp {
					hp += 8;	
					audio_play_sound(snd_heartPickup,0,false);
					instance_activate_object(obj_player_health);
					with obj_player_health {
						heart_gain_num = other.hp;	
					}
				}
			}
			//global.num_of_coins += experimenting_coins;
			//global.current_total_coins += experimenting_coins;
			//alarm[2] = 1;
		}
		
		if weapons_mode = true {
			ini_open("itemsunlocked.ini");
			if scr_In_Array(obj_player.all_guns_array,new_item) {
				for(i = 0; i < array_length(obj_player.all_guns_array);i++) {
					if obj_player.all_guns_array[i] = new_item {
						global.weapon_unlocked_array[i] = true;
						ini_write_real("itemsunlocked", "weapon " + string(i), global.weapon_unlocked_array[i]);
					}
				}
			}
			ini_close();
		}
		
		if pickups_mode = true {
			ini_open("itemsunlocked.ini");
			if scr_In_Array(obj_player.all_pickups_array,new_item) {
				for(i = 0; i < array_length(obj_player.all_pickups_array);i++) {
					if obj_player.all_pickups_array[i] = new_item {
						global.active_unlocked_array[i] = true;
						ini_write_real("itemsunlocked", "active " + string(i), global.active_unlocked_array[i]);
					}
				}
			}
			ini_close();
		}
	}
	//slot 3
	if select = 3 and num_of_slots > 3 {
		audio_play_sound(snd_selectOption,0,false);
		sprite_3 = sprite_new;
		sprite_new = spr_nothing;
		item_name = "";
		with obj_pause {
			item_swap = false;
			paused_outside = true;	
		}
		//change gun
		instance_activate_object(obj_player);
		with obj_player {
			global.all_weapon_costs[2] = other.new_item_cost;
				
			gun_3 = other.new_item;
			gun_array = [gun_1, gun_2, gun_3];
			gun = gun_array[current_gun];
		}
		
		//experimentation buff
		if global.experimentation = true {
			with obj_player {
				if hp < max_hp {
					hp += 8;	
					audio_play_sound(snd_heartPickup,0,false);
					instance_activate_object(obj_player_health);
					with obj_player_health {
						heart_gain_num = other.hp;	
					}
				}
			}
			//global.num_of_coins += experimenting_coins;
			//global.current_total_coins += experimenting_coins;
			//alarm[2] = 1;
		}
		
		if weapons_mode = true {
			ini_open("itemsunlocked.ini");
			if scr_In_Array(obj_player.all_guns_array,new_item) {
				for(i = 0; i < array_length(obj_player.all_guns_array);i++) {
					if obj_player.all_guns_array[i] = new_item {
						global.weapon_unlocked_array[i] = true;
						ini_write_real("itemsunlocked", "weapon " + string(i), global.weapon_unlocked_array[i]);
					}
				}
			}
			ini_close();
		}
	}
	//cancel
	if select = num_of_slots {
		audio_play_sound(snd_unavailable,0,false);
		
		//recycling buff
		if global.recycling = true and room != room_shop {
			global.num_of_coins += round(new_item_cost/4);
			global.current_total_coins += round(new_item_cost/4);
			alarm[3] = 1;
		}
		
		with obj_pause {
			item_swap = false;
			paused_outside = true;	
		}
		alarm[1] = 1; //dont lose any coins in shop
	}
	fade_away = true;
}

if fade_away = true {
	if spd2 < 16 {
		spd2 += 1;
	}
	x += spd2;
	alpha -= 0.025	
	if alpha <= 0 {
		instance_destroy();	
	}
}

//get slot sprites
with obj_player {
	if other.pickups_mode = true {
		other.sprite_1 = pickup_1.gui_sprite;
		other.sprite_2 = pickup_2.gui_sprite;
		other.item1_name = pickup_1._name;
		other.item2_name = pickup_2._name;
	}else if other.weapons_mode = true {
		other.sprite_1 = gun_1.sprite;
		other.sprite_2 = gun_2.sprite;
		other.sprite_3 = gun_3.sprite;
		other.item1_name = gun_1._name;
		other.item2_name = gun_2._name;
		other.item3_name = gun_3._name;
	}
}

//get item sprite
if fade_away = false {
	if pickups_mode = true {
		sprite_new = new_item.gui_sprite;
	}else if weapons_mode = true {
		sprite_new = new_item.sprite;
	}
}