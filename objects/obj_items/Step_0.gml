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
	select_y_max = 1;
	if num_of_pickups = 2 {
		if key_up and selected_y = false and actives_swap = true and select_y > 0 {
			actives_swap = false;	
			select_y -= 1;
			selected_y = true;
			audio_play_sound(snd_menuNavigation,0,false);
			alarm[3] = alarm3_time;
		}
		if key_down and selected_y = false and actives_swap = false and select_y < select_y_max {
			actives_swap = true;
			select_y += 1;
			selected_y = true;
			audio_play_sound(snd_menuNavigation,0,false);
			alarm[3] = alarm3_time;
		}
	}else {
		select_y_max = 5;
		actives_swap = false;	
	}
	
	//swap
	if key_select and actives_swap = true {
		instance_activate_object(obj_player);
		with obj_player {
			var old_pickup_1 = pickup_1;
			var old_pickup_2 = pickup_2;
			pickup_1 = old_pickup_2;
			pickup_2 = old_pickup_1;
			pickups_array = [pickup_1, pickup_2];
			other.pickup_1 = pickup_1;
			other.pickup_2 = pickup_2;
			other.num_of_pickups = num_of_pickups;
			var prev_cost = global.all_pickup_costs[0];
			global.all_pickup_costs[0] = global.all_pickup_costs[1];
			global.all_pickup_costs[1] = prev_cost;
		}
		instance_deactivate_object(obj_player);
		audio_play_sound(snd_selectOption,0,false);
	}
	
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