// Inherit the parent event
event_inherited();

if weapon != obj_player.gun_1 and obj_player.weapons_equipped = 1
or weapon != obj_player.gun_1 and weapon != obj_player.gun_2 and obj_player.weapons_equipped = 2
or weapon != obj_player.gun_1 and weapon != obj_player.gun_2 and weapon != obj_player.gun_3 and obj_player.weapons_equipped = 3 
or obj_player.weapons_equipped = 0 {
	if obj_player.num_of_weapons = 1 or obj_player.num_of_weapons = 2 and obj_player.weapons_equipped = 1 {
		global.all_weapon_costs[1] = item_cost;
		
		with obj_player {
			num_of_weapons = 2;
			gun_2 = other.weapon;
			gun_array = [gun_1,gun_2,gun_3];
			//gun =  obj_player.gun_array[1];
			//current_gun = 1;
		}
		
		ini_open("itemsunlocked.ini");
		if scr_In_Array(obj_player.all_guns_array,weapon) {
			for(i = 0; i < array_length(obj_player.all_guns_array);i++) {
				if obj_player.all_guns_array[i] = weapon {
					if global.weapon_unlocked_array[i] = false {
						instance_create_depth(x,y,depth,obj_item_text_newdiscovery);
					}
					global.weapon_unlocked_array[i] = true;
					ini_write_real("itemsunlocked", "weapon " + string(i), global.weapon_unlocked_array[i]);
				}
			}
		}
		ini_close();
	}else if obj_player.num_of_weapons = 2 and obj_player.weapons_equipped = 2 {
		//create pop-up
		with instance_create_depth(x,y,depth,obj_item_swap) {
			pickups_mode = false;
			weapons_mode = true;
			sprite_1 = obj_player.gun_1.sprite;
			sprite_2 = obj_player.gun_2.sprite;
			new_item = other.weapon;
			item_name = other.item_name;
			new_item_cost = other.item_cost;
			item1_name = obj_player.gun_1._name;
			item2_name = obj_player.gun_2._name;
		}
	}else if obj_player.num_of_weapons = 3 and obj_player.weapons_equipped = 1 {
		global.all_weapon_costs[1] = item_cost;
		
		with obj_player {
			num_of_weapons = 3;
			gun_2 = other.weapon;
			gun_array = [gun_1,gun_2,gun_3];
			//gun =  obj_player.gun_array[1];
			//current_gun = 1;
		}
		
		ini_open("itemsunlocked.ini");
		if scr_In_Array(obj_player.all_guns_array,weapon) {
			for(i = 0; i < array_length(obj_player.all_guns_array);i++) {
				if obj_player.all_guns_array[i] = weapon {
					if global.weapon_unlocked_array[i] = false {
						instance_create_depth(x,y,depth,obj_item_text_newdiscovery);
					}
					global.weapon_unlocked_array[i] = true;
					ini_write_real("itemsunlocked", "weapon " + string(i), global.weapon_unlocked_array[i]);
				}
			}
		}
		ini_close();
	}else if obj_player.num_of_weapons = 3 and obj_player.weapons_equipped = 2 {
		global.all_weapon_costs[2] = item_cost;
		
		with obj_player {
			num_of_weapons = 3;
			gun_3 = other.weapon;
			gun_array = [gun_1,gun_2,gun_3];
			//gun =  obj_player.gun_array[2];
			//current_gun = 2;
		}
		
		ini_open("itemsunlocked.ini");
		if scr_In_Array(obj_player.all_guns_array,weapon) {
			for(i = 0; i < array_length(obj_player.all_guns_array);i++) {
				if obj_player.all_guns_array[i] = weapon {
					if global.weapon_unlocked_array[i] = false {
						instance_create_depth(x,y,depth,obj_item_text_newdiscovery);
					}
					global.weapon_unlocked_array[i] = true;
					ini_write_real("itemsunlocked", "weapon " + string(i), global.weapon_unlocked_array[i]);
				}
			}
		}
		ini_close();
	}else if obj_player.num_of_weapons = 3 and obj_player.weapons_equipped = 3 {
		//create pop-up
		with instance_create_depth(x,y,depth,obj_item_swap) {
			pickups_mode = false;
			weapons_mode = true;
			sprite_1 = obj_player.gun_1.sprite;
			sprite_2 = obj_player.gun_2.sprite;
			sprite_3 = obj_player.gun_3.sprite;
			new_item = other.weapon;
			item_name = other.item_name;
			new_item_cost = other.item_cost;
			item1_name = obj_player.gun_1._name;
			item2_name = obj_player.gun_2._name;
			item3_name = obj_player.gun_3._name;
		}
	}else if obj_player.num_of_weapons = 0 {
		
		global.all_weapon_costs[0] = item_cost;
		
		with obj_player {
			num_of_weapons = 1;
			weapons_equipped = 1;
			gun_1 = other.weapon;
			gun_2 = other.weapon;
			gun_3 = other.weapon;
			gun_array = [gun_1, gun_1, gun_1];	
			gun =  obj_player.gun_array[0];
			current_gun = 0;
		}
		
		ini_open("itemsunlocked.ini");
		if scr_In_Array(obj_player.all_guns_array,weapon) {
			for(i = 0; i < array_length(obj_player.all_guns_array);i++) {
				if obj_player.all_guns_array[i] = weapon {
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
	audio_play_sound(snd_weaponPowerup,0,false);
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