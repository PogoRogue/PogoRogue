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
	coin_string_set = true;
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
		
		//new recycling buff
		if global.recycling > 0 {
			if weapons_mode = true {
				replaced_item_cost = global.all_weapon_costs[0];
			}else {
				replaced_item_cost = global.all_pickup_costs[0];
			}
			var new_recycling_cost = 0;
			switch(global.recycling) {
				case 1: new_recycling_cost = round(replaced_item_cost/4); break;
				case 2: new_recycling_cost = round(replaced_item_cost/2); break;
				case 3: new_recycling_cost = round(replaced_item_cost/2) + round(replaced_item_cost/4); break;
				case 4: new_recycling_cost = replaced_item_cost; break;
			}
			global.num_of_coins += new_recycling_cost;
			global.current_total_coins += new_recycling_cost;
			
			if room != room_starting_area and room != room_tutorial {
				global.total_coins += new_recycling_cost;
				scr_Save_Real("total_coins",global.total_coins);
			}
			
			replaced_item_cost = new_recycling_cost;
			alarm[3] = 1;
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
		if global.experimentation > 0 {
			with obj_player {
				var temp_experimentation = global.experimentation;
				while hp < max_hp and temp_experimentation > 0 {
					hp += 8;	
					audio_play_sound(snd_heartPickup,0,false);
					instance_activate_object(obj_player_health);
					instance_create_depth(28 + ((hp-8) * 3), 32,depth-1,obj_heart_gain);
					temp_experimentation -= 1;
				}
				while armor_buff < max_armor_buff and temp_experimentation > 0 {
					armor_buff += 1;
					audio_play_sound(snd_ArmorHeart,0,false);
					instance_create_depth(28 + (max_hp/8 * 24) + ((armor_buff-1) * 24), 32,depth-1,obj_heart_shield_gain);
					temp_experimentation -= 1;
				}
			}
		}
		
		if weapons_mode = true {
			ini_open("itemsunlocked.ini");
			if scr_In_Array(obj_player.all_guns_array,new_item) {
				for(i = 0; i < array_length(obj_player.all_guns_array);i++) {
					if obj_player.all_guns_array[i] = new_item {
						if global.weapon_unlocked_array[i] = false {
							instance_create_depth(x,y,depth,obj_item_text_newdiscovery);
						}
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
						if global.active_unlocked_array[i] = false {
							instance_create_depth(x,y,depth,obj_item_text_newdiscovery);
						}
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
		
		//new recycling buff
		if global.recycling > 0 {
			if weapons_mode = true {
				replaced_item_cost = global.all_weapon_costs[1];
			}else {
				replaced_item_cost = global.all_pickup_costs[1];
			}
			var new_recycling_cost = 0;
			switch(global.recycling) {
				case 1: new_recycling_cost = round(replaced_item_cost/4); break;
				case 2: new_recycling_cost = round(replaced_item_cost/2); break;
				case 3: new_recycling_cost = round(replaced_item_cost/2) + round(replaced_item_cost/4); break;
				case 4: new_recycling_cost = replaced_item_cost; break;
			}
			global.num_of_coins += new_recycling_cost;
			global.current_total_coins += new_recycling_cost;
			if room != room_starting_area and room != room_tutorial {
				global.total_coins += new_recycling_cost;
				scr_Save_Real("total_coins",global.total_coins);
			}
			
			replaced_item_cost = new_recycling_cost;
			alarm[3] = 1;
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
		if global.experimentation > 0 {
			with obj_player {
				var temp_experimentation = global.experimentation;
				while hp < max_hp and temp_experimentation > 0 {
					hp += 8;	
					audio_play_sound(snd_heartPickup,0,false);
					instance_activate_object(obj_player_health);
					instance_create_depth(28 + ((hp-8) * 3), 32,depth-1,obj_heart_gain);
					temp_experimentation -= 1;
				}
				while armor_buff < max_armor_buff and temp_experimentation > 0 {
					armor_buff += 1;
					audio_play_sound(snd_ArmorHeart,0,false);
					instance_create_depth(28 + (max_hp/8 * 24) + ((armor_buff-1) * 24), 32,depth-1,obj_heart_shield_gain);
					temp_experimentation -= 1;
				}
			}
		}
		
		if weapons_mode = true {
			ini_open("itemsunlocked.ini");
			if scr_In_Array(obj_player.all_guns_array,new_item) {
				for(i = 0; i < array_length(obj_player.all_guns_array);i++) {
					if obj_player.all_guns_array[i] = new_item {
						if global.weapon_unlocked_array[i] = false {
							instance_create_depth(x,y,depth,obj_item_text_newdiscovery);
						}
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
						if global.active_unlocked_array[i] = false {
							instance_create_depth(x,y,depth,obj_item_text_newdiscovery);
						}
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
		
		//new recycling buff
		if global.recycling > 0 {
			if weapons_mode = true {
				replaced_item_cost = global.all_weapon_costs[2];
			}else {
				replaced_item_cost = 0;
			}
			var new_recycling_cost = 0;
			switch(global.recycling) {
				case 1: new_recycling_cost = round(replaced_item_cost/4); break;
				case 2: new_recycling_cost = round(replaced_item_cost/2); break;
				case 3: new_recycling_cost = round(replaced_item_cost/2) + round(replaced_item_cost/4); break;
				case 4: new_recycling_cost = replaced_item_cost; break;
			}
			global.num_of_coins += new_recycling_cost;
			global.current_total_coins += new_recycling_cost;
			if room != room_starting_area and room != room_tutorial {
				global.total_coins += new_recycling_cost;
				scr_Save_Real("total_coins",global.total_coins);
			}
			
			replaced_item_cost = new_recycling_cost;
			alarm[3] = 1;
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
		if global.experimentation > 0 {
			with obj_player {
				var temp_experimentation = global.experimentation;
				while hp < max_hp and temp_experimentation > 0 {
					hp += 8;	
					audio_play_sound(snd_heartPickup,0,false);
					instance_activate_object(obj_player_health);
					instance_create_depth(28 + ((hp-8) * 3), 32,depth-1,obj_heart_gain);
					temp_experimentation -= 1;
				}
				while armor_buff < max_armor_buff and temp_experimentation > 0 {
					armor_buff += 1;
					audio_play_sound(snd_ArmorHeart,0,false);
					instance_create_depth(28 + (max_hp/8 * 24) + ((armor_buff-1) * 24), 32,depth-1,obj_heart_shield_gain);
					temp_experimentation -= 1;
				}
			}
		}
		
		if weapons_mode = true {
			ini_open("itemsunlocked.ini");
			if scr_In_Array(obj_player.all_guns_array,new_item) {
				for(i = 0; i < array_length(obj_player.all_guns_array);i++) {
					if obj_player.all_guns_array[i] = new_item {
						if global.weapon_unlocked_array[i] = false {
							instance_create_depth(x,y,depth,obj_item_text_newdiscovery);
						}
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
		
		//old recycling buff
		/*if global.recycling = true and room != room_shop {
			global.num_of_coins += round(new_item_cost/4);
			global.current_total_coins += round(new_item_cost/4);
			alarm[3] = 1;
		}*/
		
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
		other.item1_cost = global.all_pickup_costs[0];
		other.item2_cost = global.all_pickup_costs[1];
		other.item3_cost = 0;
	}else if other.weapons_mode = true {
		other.sprite_1 = gun_1.sprite;
		other.sprite_2 = gun_2.sprite;
		other.sprite_3 = gun_3.sprite;
		other.item1_name = gun_1._name;
		other.item2_name = gun_2._name;
		other.item3_name = gun_3._name;
		other.item1_cost = global.all_weapon_costs[0];
		other.item2_cost = global.all_weapon_costs[1];
		other.item3_cost = global.all_weapon_costs[2];
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

//unlock dogo skin
var weapons_unlocked = 0;

for(i = 0; i < array_length(global.weapon_unlocked_array); i++) { //weapons
	if global.weapon_unlocked_array[i] = true {
		weapons_unlocked++;
	}
}

if weapons_unlocked = array_length(global.weapon_unlocked_array) {
	//unlock skin
	var skin = 3;
	if global.skins_unlocked_array[skin-1] = false {
		ini_open("itemsunlocked.ini");
		instance_create_depth(x,y,depth,obj_skinunlocked_popup,{skin_num: skin});
		global.skins_unlocked_array[skin-1] = true;
		ini_write_real("itemsunlocked", "skin " + string(skin), global.skins_unlocked_array[skin-1]);
		ini_close();	
	}
}