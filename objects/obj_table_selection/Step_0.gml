key_interact = global.key_interact;
key_back = global.key_back;
key_left = global.key_left_menu;
key_right = global.key_right_menu;
key_select = global.key_select;

//check for player coliision
if (place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask)) { //and all_out = false {
	colliding = true;
}else {
	colliding = false;	
}


if (colliding and key_interact) and !instance_exists(obj_fade_in) {
	if item_equipped = 1 {
		item_equipped = 2;
	}else if item_equipped = 2 {
		item_equipped = 1;
	}
	
	item_changed = true;
}

if item_changed = true {
	if item_equipped = 1 {
		with obj_player {
			if global.current_skin = 0 { //Rogo
				num_of_weapons = 2;
				gun_1 = paintball_gun;
				gun_2 = default_gun;
				gun_3 = gun_1;
				gun_array = [gun_1,gun_2,gun_3];
				audio_play_sound(snd_weaponPowerup,0,false);
				
				var temp_item = instance_create_depth(0,0,depth,obj_item_weapon_paintball);
				global.all_weapon_costs[0] = obj_item_weapon_javelins.item_cost;
				instance_destroy(temp_item);
				
				global.all_weapon_costs[1] = 25;
				
				ini_open("itemsunlocked.ini");
				if global.weapon_unlocked_array[1] = false {
					instance_create_depth(x,y,depth,obj_item_text_newdiscovery);
				}
				global.weapon_unlocked_array[1] = true;
				ini_write_real("itemsunlocked", "weapon " + string(1), global.weapon_unlocked_array[i]);
				ini_close();
			}else if global.current_skin = 3 { //Dogo
				num_of_weapons = 2;
				gun_1 = boomerang_gun;
				gun_2 = default_gun;
				gun_3 = gun_1;
				gun_array = [gun_1,gun_2,gun_3];
				audio_play_sound(snd_weaponPowerup,0,false);
				
				var temp_item = instance_create_depth(0,0,depth,obj_item_weapon_boomerang);
				global.all_weapon_costs[0] = obj_item_weapon_boomerang.item_cost;
				instance_destroy(temp_item);
				
				global.all_weapon_costs[1] = 25;
				
				ini_open("itemsunlocked.ini");
				if global.weapon_unlocked_array[8] = false {
					instance_create_depth(x,y,depth,obj_item_text_newdiscovery);
				}
				global.weapon_unlocked_array[8] = true;
				ini_write_real("itemsunlocked", "weapon " + string(8), global.weapon_unlocked_array[i]);
				ini_close();
			}else if global.current_skin = 6 { //3D
				num_of_pickups = 1;
				pickup_1 = pickup_hatgun;
				pickup_2 = pickup_nothing;
				pickups_array = [pickup_1,pickup_2];
				audio_play_sound(snd_activePowerup,0,false);
				
				var temp_item = instance_create_depth(0,0,depth,obj_item_pickup_hatgun);
				global.all_pickup_costs[0] = obj_item_pickup_hatgun.item_cost;
				instance_destroy(temp_item);
				
				ini_open("itemsunlocked.ini");
				if global.active_unlocked_array[9] = false {
					instance_create_depth(x,y,depth,obj_item_text_newdiscovery);
				}
				global.active_unlocked_array[9] = true;
				ini_write_real("itemsunlocked", "active " + string(9), global.active_unlocked_array[i]);
				ini_close();
			}
		}
	}else if item_equipped = 2 {
		with obj_player {
			if global.current_skin = 0 { //Rogo
				num_of_weapons = 2;
				gun_1 = shotgun_gun;
				gun_2 = default_gun;
				gun_3 = gun_1;
				gun_array = [gun_1,gun_2,gun_3];
				audio_play_sound(snd_weaponPowerup,0,false);
				
				var temp_item = instance_create_depth(0,0,depth,obj_item_weapon_shotgun);
				global.all_weapon_costs[0] = obj_item_weapon_shotgun.item_cost;
				instance_destroy(temp_item);
				
				global.all_weapon_costs[1] = 25;
				
				ini_open("itemsunlocked.ini");
				if global.weapon_unlocked_array[2] = false {
					instance_create_depth(x,y,depth,obj_item_text_newdiscovery);
				}
				global.weapon_unlocked_array[2] = true;
				ini_write_real("itemsunlocked", "weapon " + string(2), global.weapon_unlocked_array[i]);
				ini_close();
			}else if global.current_skin = 3 { //Dogo
				num_of_weapons = 2;
				gun_1 = bouncyball_gun;
				gun_2 = default_gun;
				gun_3 = gun_1;
				gun_array = [gun_1,gun_2,gun_3];
				audio_play_sound(snd_weaponPowerup,0,false);
				
				var temp_item = instance_create_depth(0,0,depth,obj_item_weapon_bouncyball);
				global.all_weapon_costs[0] = obj_item_weapon_bouncyball.item_cost;
				instance_destroy(temp_item);
				
				global.all_weapon_costs[1] = 25;
				
				ini_open("itemsunlocked.ini");
				if global.weapon_unlocked_array[7] = false {
					instance_create_depth(x,y,depth,obj_item_text_newdiscovery);
				}
				global.weapon_unlocked_array[7] = true;
				ini_write_real("itemsunlocked", "weapon " + string(7), global.weapon_unlocked_array[i]);
				ini_close();
			}else if global.current_skin = 6 { //3D
				num_of_pickups = 1;
				pickup_1 = pickup_grappling;
				pickup_2 = pickup_nothing;
				pickups_array = [pickup_1,pickup_2];
				audio_play_sound(snd_activePowerup,0,false);
				
				var temp_item = instance_create_depth(0,0,depth,obj_item_pickup_grappling);
				global.all_pickup_costs[0] = obj_item_pickup_grappling.item_cost;
				instance_destroy(temp_item);
				
				ini_open("itemsunlocked.ini");
				if global.active_unlocked_array[8] = false {
					instance_create_depth(x,y,depth,obj_item_text_newdiscovery);
				}
				global.active_unlocked_array[8] = true;
				ini_write_real("itemsunlocked", "active " + string(8), global.active_unlocked_array[i]);
				ini_close();
			}
		}
	}
	with obj_player {
		current_gun = 0;
		gun = gun_array[current_gun];
	}
	item_changed = false;
}

//image_index
if image_index != sprite_get_number(sprite_index)-1 {
	if item_equipped = 1 {
		image_index = (init_image_index) + (colliding*6);
	}else {
		image_index = (init_image_index-1) + (colliding*6);
	}
}