key_left = global.key_left_menu;
key_right = global.key_right_menu;
key_up = global.key_up_menu;
key_down = global.key_down_menu;
key_select = global.key_select;
key_back = global.key_back || global.key_item_menu;

if select_y = 0 { //top row, change between item types
	if select != 3 {
		select_x = 1;
	}
	if key_left and select > 1 and selected_x = false {
		select -= 1;
		selected_x = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[2] = alarm2_time;
	}
	if key_right and select < select_max and selected_x = false {
		select += 1;
		selected_x = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[2] = alarm2_time;
	}
	//down
	if select = 1 and key_down and select_y < select_y_max and selected_y = false {
		select_y += 1;
		selected_y = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[3] = alarm3_time;
	}
}

//passives
if select = 1 and select_y > 0 {
	if key_left and select_x > 1 and selected_x = false {
		select_x -= 1;
		selected_x = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[2] = alarm2_time;
	}
	if key_right and select_x < select_x_max and selected_x = false {
		select_x += 1;
		selected_x = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[2] = alarm2_time;
	}
	if key_up and select_y > 0 and selected_y = false {
		select_y -= 1;
		selected_y = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[3] = alarm3_time;
	}
	if key_down and select_y < select_y_max and selected_y = false {
		select_y += 1;
		selected_y = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[3] = alarm3_time;
	}
	
	//change pages
	if key_right and select_x = select_x_max and selected_x = false and page_num = 1 and array_length(global.all_buff_sprites) > 20 {
		page_num = 2;
		select_x = 1;
		selected_x = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[2] = alarm2_time;
	}
	if key_left and select_x = 1 and selected_x = false and page_num = 2 and array_length(global.all_buff_sprites) > 20 {
		page_num = 1;
		select_x = select_x_max;
		selected_x = true;
		audio_play_sound(snd_menuNavigation,0,false);
		alarm[2] = alarm2_time;
	}
}

//actives
if select = 2 {
	instance_activate_object(obj_player);
	instance_activate_object(obj_player_mask);
	
	with obj_player {
		//weapons
		other.gun_1 = gun_1;
		other.gun_2 = gun_2;
		other.gun_3 = gun_3;
		other.num_of_weapons = weapons_equipped;
		if num_of_weapons = 0 { 
			other.num_of_weapons = 0;
		}
		//pickups
		if num_of_pickups > 0 {
			other.pickup_1 = pickups_array[0];
		}
		if num_of_pickups > 1 {
			other.pickup_2 = pickups_array[1];
		}
		other.num_of_pickups = num_of_pickups;
	}
	
	if obj_player.pickups_array[0] !=  global.parent_synergy1
	and obj_player.pickups_array[0] !=  global.item_1_pickup
	and obj_player.pickups_array[0] !=  global.item_2_pickup {
		global.synergy_slot_equipped1 = false;
		global.synergy_slot_equipped2 = false;
	}
	
	if obj_player.pickups_array[1] !=  global.parent_synergy2
	and obj_player.pickups_array[1] !=  global.item_3_pickup
	and obj_player.pickups_array[1] !=  global.item_4_pickup {
		global.synergy_slot_equipped3 = false;
		global.synergy_slot_equipped4 = false;
	}
	
	if  global.parent_synergy1.is_synergy = true {
		scr_Convert_Sprite_To_Active(global.parent_synergy1.base_item_sprite_1).synergy_equipped = true;
		scr_Convert_Sprite_To_Active(global.parent_synergy1.base_item_sprite_2).synergy_equipped = true;
	}
	
	if  global.parent_synergy2.is_synergy = true {
		scr_Convert_Sprite_To_Active(global.parent_synergy2.base_item_sprite_1).synergy_equipped = true;
		scr_Convert_Sprite_To_Active(global.parent_synergy2.base_item_sprite_2).synergy_equipped = true;
	}
	
	
	if obj_player.pickups_array[0] !=  global.parent_synergy1
	and obj_player.pickups_array[0] !=  global.item_1_pickup
	and obj_player.pickups_array[0] !=  global.item_2_pickup 
	and obj_player.pickups_array[1] !=  global.parent_synergy1
	and obj_player.pickups_array[1] !=  global.item_1_pickup
	and obj_player.pickups_array[1] !=  global.item_2_pickup {
		global.item_1_pickup.synergy_equipped = false;
		global.item_2_pickup.synergy_equipped = false;
	}
	
	if obj_player.pickups_array[0] !=  global.parent_synergy2
	and obj_player.pickups_array[0] !=  global.item_3_pickup
	and obj_player.pickups_array[0] !=  global.item_4_pickup 
	and obj_player.pickups_array[1] !=  global.parent_synergy2
	and obj_player.pickups_array[1] !=  global.item_3_pickup
	and obj_player.pickups_array[1] !=  global.item_4_pickup {
		global.item_3_pickup.synergy_equipped = false;
		global.item_4_pickup.synergy_equipped = false;
	}
	
	if global.item_1_pickup = obj_player.pickups_array[1]
	or global.item_2_pickup = obj_player.pickups_array[1] {
		obj_player.pickups_array[1].synergy_equipped = false;
	}
	
	if global.item_3_pickup = obj_player.pickups_array[0]
	or global.item_4_pickup = obj_player.pickups_array[0] {
		obj_player.pickups_array[0].synergy_equipped = false;
	}
	
	if num_of_pickups = 2 {
		if pickup_1.synergy_equipped = true or pickup_2.synergy_equipped = true {
			select_y_max = 2;
		}else {
			select_y_max = 1;
			global.synergy_slot_equipped1 = false;
			global.synergy_slot_equipped2 = false;
			global.synergy_slot_equipped3 = false;
			global.synergy_slot_equipped4 = false;
		}
		
		if key_up and selected_y = false and select_y > 0 {
			if actives_swap = true {
				actives_swap = false;	
			}else {
				actives_swap = true;
			}
			select_y -= 1;
			selected_y = true;
			audio_play_sound(snd_menuNavigation,0,false);
			alarm[3] = alarm3_time;
		}
		if key_down and selected_y = false and select_y < select_y_max {
			if actives_swap = false {
				actives_swap = true;
			}else {
				actives_swap = false;
			}
			select_y += 1;
			selected_y = true;
			audio_play_sound(snd_menuNavigation,0,false);
			alarm[3] = alarm3_time;
		}
	}else {
		if pickup_1.synergy_equipped = true {
			select_y_max = 1;
		}else {
			select_y_max = 0;
			global.synergy_slot_equipped1 = false;
			global.synergy_slot_equipped2 = false;
		}
		if key_up and selected_y = false and select_y > 0 {
			select_y -= 1;
			selected_y = true;
			audio_play_sound(snd_menuNavigation,0,false);
			alarm[3] = alarm3_time;
		}
		if key_down and selected_y = false and select_y < select_y_max {
			select_y += 1;
			selected_y = true;
			audio_play_sound(snd_menuNavigation,0,false);
			alarm[3] = alarm3_time;
		}
		actives_swap = false;	
	}
	
	if num_of_pickups = 2 {
		if pickup_1.synergy_equipped = true and pickup_2.synergy_equipped = true {
			synergy_slot_x_min = 1;
			synergy_slot_x_max = 4;
			
			if pickup_1.is_synergy = true {
				global.parent_synergy1 = pickup_1;
			}
			if pickup_2.is_synergy = true {
				global.parent_synergy2 = pickup_2;
			}
			if pickup_1.is_synergy {
				global.item_1_pickup = scr_Convert_Sprite_To_Active(pickup_1.base_item_sprite_1);
				global.item_2_pickup = scr_Convert_Sprite_To_Active(pickup_1.base_item_sprite_2);
			}
			if pickup_2.is_synergy {
				global.item_3_pickup = scr_Convert_Sprite_To_Active(pickup_2.base_item_sprite_1);
				global.item_4_pickup = scr_Convert_Sprite_To_Active(pickup_2.base_item_sprite_2);
			}
		}else if pickup_1.synergy_equipped = true and pickup_2.synergy_equipped = false {
			synergy_slot_x_min = 1;
			synergy_slot_x_max = 2;
			global.synergy_slot_equipped3 = false;
			global.synergy_slot_equipped4 = false;
			
			if pickup_1.is_synergy = true {
				global.parent_synergy1 = pickup_1;
			}
			global.parent_synergy2 = obj_player.pickup_nothing;
			if pickup_1.is_synergy {
				global.item_1_pickup = scr_Convert_Sprite_To_Active(pickup_1.base_item_sprite_1);
				global.item_2_pickup = scr_Convert_Sprite_To_Active(pickup_1.base_item_sprite_2);
			}
			global.item_3_pickup = obj_player.pickup_nothing;
			global.item_4_pickup = obj_player.pickup_nothing;
		}else if pickup_1.synergy_equipped = false and pickup_2.synergy_equipped = true {
			synergy_slot_x_min = 3;
			synergy_slot_x_max = 4;
			global.synergy_slot_equipped1 = false;
			global.synergy_slot_equipped2 = false;
			
			global.parent_synergy1 = obj_player.pickup_nothing;
			if pickup_2.is_synergy = true {
				global.parent_synergy2 = pickup_2;
			}
			global.item_1_pickup = obj_player.pickup_nothing;
			global.item_2_pickup = obj_player.pickup_nothing;
			if pickup_2.is_synergy {
				global.item_3_pickup = scr_Convert_Sprite_To_Active(pickup_2.base_item_sprite_1);
				global.item_4_pickup = scr_Convert_Sprite_To_Active(pickup_2.base_item_sprite_2);
			}
		}else if pickup_1.synergy_equipped = false and pickup_2.synergy_equipped = false {
			synergy_slot_x_min = 0;
			synergy_slot_x_max = 0;
			global.synergy_slot_equipped1 = false;
			global.synergy_slot_equipped2 = false;
			global.synergy_slot_equipped3 = false;
			global.synergy_slot_equipped4 = false;
			
			global.parent_synergy1 = obj_player.pickup_nothing;
			global.parent_synergy2 = obj_player.pickup_nothing;
			global.item_1_pickup = obj_player.pickup_nothing;
			global.item_2_pickup = obj_player.pickup_nothing;
			global.item_3_pickup = obj_player.pickup_nothing;
			global.item_4_pickup = obj_player.pickup_nothing;
		}
	}else if num_of_pickups = 1 {
		if pickup_1.synergy_equipped = true {
			synergy_slot_x_min = 1;
			synergy_slot_x_max = 2;
			
			if pickup_1.is_synergy = true {
				global.parent_synergy1 = pickup_1;
			}
			global.parent_synergy2 = obj_player.pickup_nothing;
			if pickup_1.is_synergy {
				global.item_1_pickup = scr_Convert_Sprite_To_Active(pickup_1.base_item_sprite_1);
				global.item_2_pickup = scr_Convert_Sprite_To_Active(pickup_1.base_item_sprite_2);
			}
			global.item_3_pickup = obj_player.pickup_nothing;
			global.item_4_pickup = obj_player.pickup_nothing;
		}else {
			synergy_slot_x_min = 0;
			synergy_slot_x_max = 0;
			global.synergy_slot_equipped1 = false;
			global.synergy_slot_equipped2 = false;
			
			global.parent_synergy1 = obj_player.pickup_nothing;
			global.parent_synergy2 = obj_player.pickup_nothing;
			global.item_1_pickup = obj_player.pickup_nothing;
			global.item_2_pickup = obj_player.pickup_nothing;
			global.item_3_pickup = obj_player.pickup_nothing;
			global.item_4_pickup = obj_player.pickup_nothing;
		}
	}
	
	if synergy_slot_x < synergy_slot_x_min {
		synergy_slot_x = synergy_slot_x_min;
	}else if synergy_slot_x > synergy_slot_x_max {
		synergy_slot_x = synergy_slot_x_max;
	}
	
	
	if select_y = 2 and synergy_slot_x_min > 0 {
		if key_left and synergy_slot_x > synergy_slot_x_min and selected_x = false {
			synergy_slot_x -= 1;
			selected_x = true;
			audio_play_sound(snd_menuNavigation,0,false);
			alarm[2] = alarm2_time;
		}
		if key_right and synergy_slot_x < synergy_slot_x_max and selected_x = false {
			synergy_slot_x += 1;
			selected_x = true;
			audio_play_sound(snd_menuNavigation,0,false);
			alarm[2] = alarm2_time;
		}
	}else if select_y = 1 and synergy_slot_x_min > 0 and actives_swap = false {
		if key_left and synergy_slot_x > 1 and selected_x = false {
			synergy_slot_x -= 1;
			selected_x = true;
			audio_play_sound(snd_menuNavigation,0,false);
			alarm[2] = alarm2_time;
		}
		if key_right and synergy_slot_x < synergy_slot_x_max and selected_x = false {
			synergy_slot_x += 1;
			selected_x = true;
			audio_play_sound(snd_menuNavigation,0,false);
			alarm[2] = alarm2_time;
		}
	}
	
	if key_select and (num_of_pickups = 2 and select_y = 2 or num_of_pickups = 1 and select_y = 1) 
	and !(global.item_1_pickup = obj_player.pickups_array[1] and synergy_slot_x = 1 or global.item_2_pickup = obj_player.pickups_array[1] and synergy_slot_x = 2)
	and !(global.item_3_pickup = obj_player.pickups_array[0] and synergy_slot_x = 3 or global.item_4_pickup = obj_player.pickups_array[0] and synergy_slot_x = 4)  {
		if synergy_slot_x = 1 {
			if global.synergy_slot_equipped1 = false {
				global.synergy_slot_equipped1 = true;
				global.synergy_slot_equipped2 = false;
				///
				scr_Change_Actives_Loadout(global.item_1_pickup,obj_player.pickups_array[1]);
				audio_play_sound(snd_selectOption,0,false);
			}else {
				global.synergy_slot_equipped1 = false;
				
				scr_Change_Actives_Loadout(global.parent_synergy1,obj_player.pickups_array[1]);
				audio_play_sound(snd_selectOption,0,false);
			}
		}else if synergy_slot_x = 2 {
			if global.synergy_slot_equipped2 = false {
				global.synergy_slot_equipped2 = true;
				global.synergy_slot_equipped1 = false;

				scr_Change_Actives_Loadout(global.item_2_pickup,obj_player.pickups_array[1]);
				audio_play_sound(snd_selectOption,0,false);
			}else {
				global.synergy_slot_equipped2 = false;
				scr_Change_Actives_Loadout(global.parent_synergy1,obj_player.pickups_array[1]);
				audio_play_sound(snd_selectOption,0,false);
			}	
		}else if synergy_slot_x = 3 {
			if global.synergy_slot_equipped3 = false {
				global.synergy_slot_equipped3 = true;
				global.synergy_slot_equipped4 = false;
				
				scr_Change_Actives_Loadout(obj_player.pickups_array[0],global.item_3_pickup);
				audio_play_sound(snd_selectOption,0,false);
			}else {
				global.synergy_slot_equipped3 = false;
				scr_Change_Actives_Loadout(obj_player.pickups_array[0],global.parent_synergy2);
				audio_play_sound(snd_selectOption,0,false);
			}
		}else if synergy_slot_x = 4 {
			if global.synergy_slot_equipped4 = false {
				global.synergy_slot_equipped4 = true;
				global.synergy_slot_equipped3 = false;
				
				scr_Change_Actives_Loadout(obj_player.pickups_array[0],global.item_4_pickup);
				audio_play_sound(snd_selectOption,0,false);
			}else {
				global.synergy_slot_equipped4 = false;
				scr_Change_Actives_Loadout(obj_player.pickups_array[0],global.parent_synergy2);
				audio_play_sound(snd_selectOption,0,false);
			}
		}
	}
	
	//swap
	if key_select and actives_swap = true {
		//instance_activate_object(obj_player);
		with obj_player {
			var old_pickup_1 = pickup_1;
			var old_pickup_2 = pickup_2;
			pickup_1 = old_pickup_2;
			pickup_2 = old_pickup_1;
			pickups_array = [pickup_1, pickup_2];
			global.pickup_1 = pickup_1;
			global.pickup_2 = pickup_2;
			other.pickup_1 = pickup_1;
			other.pickup_2 = pickup_2;
			global.num_of_pickups = num_of_pickups;
			var prev_cost = global.all_pickup_costs[0];
			global.all_pickup_costs[0] = global.all_pickup_costs[1];
			global.all_pickup_costs[1] = prev_cost;
			var prev_synergy_slot_equipped1 = global.synergy_slot_equipped1;
			var prev_synergy_slot_equipped2 = global.synergy_slot_equipped2;
			global.synergy_slot_equipped1 = global.synergy_slot_equipped3;
			global.synergy_slot_equipped2 = global.synergy_slot_equipped4;
			global.synergy_slot_equipped3 = prev_synergy_slot_equipped1;
			global.synergy_slot_equipped4 = prev_synergy_slot_equipped2;
			
			var prev_parent_synergy1 = global.parent_synergy1;
			var prev_item_1_pickup = global.item_1_pickup;
			var prev_item_2_pickup = global.item_2_pickup;
			
			global.parent_synergy1 = global.parent_synergy2;
			global.parent_synergy2 = prev_parent_synergy1;
			global.item_1_pickup = global.item_3_pickup;
			global.item_2_pickup = global.item_4_pickup;
			global.item_3_pickup = prev_item_1_pickup;
			global.item_4_pickup = prev_item_2_pickup;
		}
		//instance_deactivate_object(obj_player);
		audio_play_sound(snd_selectOption,0,false);
	}
	
	instance_deactivate_object(obj_player);
	instance_deactivate_object(obj_player_mask);
	
}else if select = 3 { //weapons
	select_y_max = 1;
	select_x_max = 2;
	if num_of_weapons = 2 {
		if key_up and selected_y = false and weapons_swap1 = true and select_y > 0 {
			weapons_swap1 = false;	
			weapons_swap2 = false;
			select_y -= 1;
			selected_y = true;
			audio_play_sound(snd_menuNavigation,0,false);
			alarm[3] = alarm3_time;
		}
		if key_down and selected_y = false and weapons_swap1 = false and select_y < select_y_max {
			weapons_swap1 = true;
			select_y += 1;
			selected_y = true;
			audio_play_sound(snd_menuNavigation,0,false);
			alarm[3] = alarm3_time;
		}
	}else if num_of_weapons = 3 {
		if key_up and selected_y = false and weapons_swap = true and select_y > 0 {
			weapons_swap = false;	
			weapons_swap1 = false;
			weapons_swap2 = false;
			select_y -= 1;
			selected_y = true;
			audio_play_sound(snd_menuNavigation,0,false);
			alarm[3] = alarm3_time;
		}
		if key_down and selected_y = false and weapons_swap = false and select_y < select_y_max {
			weapons_swap = true;
			select_y += 1;
			selected_y = true;
			audio_play_sound(snd_menuNavigation,0,false);
			alarm[3] = alarm3_time;
		}
		
		if weapons_swap = true {
			if key_left and select_x > 1 and selected_x = false {
				select_x -= 1;
				selected_x = true;
				audio_play_sound(snd_menuNavigation,0,false);
				alarm[2] = alarm2_time;
			}
			if key_right and select_x < select_x_max and selected_x = false {
				select_x += 1;
				selected_x = true;
				audio_play_sound(snd_menuNavigation,0,false);
				alarm[2] = alarm2_time;
			}
			
			if select_x = 2 {
				weapons_swap1 = false;
				weapons_swap2 = true;
			}else if select_x = 1 {
				weapons_swap1 = true;
				weapons_swap2 = false;	
			}
		}
	}else {
		select_x_max = 4;
		select_y_max = 5;
		weapons_swap = false;	
		weapons_swap1 = false;	
		weapons_swap2 = false;	
		actives_swap = false;	
	}
	
	//swap
	if key_select and weapons_swap1 = true {
		instance_activate_object(obj_player);
		with obj_player {
			var old_weapon_1 = gun_1;
			var old_weapon_2 = gun_2;
			gun_1 = old_weapon_2;
			gun_2 = old_weapon_1;
			gun_array = [gun_1, gun_2, gun_3];
			other.gun_1 = gun_1;
			other.gun_2 = gun_2;
			if current_gun = 0 {
				current_gun = 1;
			}else if current_gun = 1 {
				current_gun = 0;
			}
			var prev_cost = global.all_weapon_costs[0];
			global.all_weapon_costs[0] = global.all_weapon_costs[1];
			global.all_weapon_costs[1] = prev_cost;
		}
		instance_deactivate_object(obj_player);
		if instance_exists(obj_coin_spawner) {
			//instance_deactivate_object(obj_coin_spawner);
		}
		if instance_exists(obj_coin) {
			//instance_deactivate_object(obj_coin);
		}
		audio_play_sound(snd_selectOption,0,false);
	}
	
	if key_select and weapons_swap2 = true {
		instance_activate_object(obj_player);
		with obj_player {
			var old_weapon_2 = gun_2;
			var old_weapon_3 = gun_3;
			gun_2 = old_weapon_3;
			gun_3 = old_weapon_2;
			gun_array = [gun_1,gun_2, gun_3];
			other.gun_2 = gun_2;
			other.gun_3 = gun_3;
			if current_gun = 1 {
				current_gun = 2;
			}else if current_gun = 2 {
				current_gun = 1;
			}
			var prev_cost = global.all_weapon_costs[1];
			global.all_weapon_costs[1] = global.all_weapon_costs[2];
			global.all_weapon_costs[2] = prev_cost;
		}
		instance_deactivate_object(obj_player);
		audio_play_sound(snd_selectOption,0,false);
	}
	
}else {
	select_x_max = 4;
	select_y_max = 5;
	weapons_swap = false;	
	weapons_swap1 = false;	
	weapons_swap2 = false;	
	actives_swap = false;	
}

if !key_left and !key_right {
	selected_x = false;
	alarm2_time = 30;
	alarm[2] = alarm2_time;
}

if !key_up and !key_down {
	selected_y = false;
	alarm3_time = 30;
	alarm[3] = alarm3_time;
}

if key_back {
	alarm[0] = 1;
}

global.last_item_menu = select;