if room = room_shop {

if cant_move = false {
	key_left = global.key_left_menu;
	key_right = global.key_right_menu;
	key_up = global.key_up_menu;
	key_down = global.key_down_menu;
	key_select = global.key_select;
}else {
	key_left = 0;
	key_right = 0;
	key_up = 0;
	key_down = 0;
	key_select = 0;
}


if selected_x = false {
	if key_left and select % 2 = 0 {
		audio_play_sound(snd_menuNavigation,0,false);
		if select != 0 {
			if refresh_button = false {
				select -= 1;
			}
		}else {
			select = last_select;	
		}
		selected_x = true;
	}else if key_right and select % 2 != 0 {
		
		audio_play_sound(snd_menuNavigation,0,false);
		if refresh_button = false {
			select += 1;
		}
		selected_x = true;
	}
}else {
	if !key_left and !key_right {
		selected_x = false;
		alarm2_time = 30;
	}
}

if selected_y = false {
	if key_up and select > 2 {
		audio_play_sound(snd_menuNavigation,0,false);
		selected_y = true;
		if refresh_button = true {
			refresh_button = false;	
		}else {
			select -= 2;	
		}
		alarm[3] = alarm3_time;
	}else if key_down and select < 7 {
		audio_play_sound(snd_menuNavigation,0,false);
		select += 2;	
		selected_y = true;
		alarm[3] = alarm3_time;
	}else if key_down {
		if refresh_button = false {
			audio_play_sound(snd_menuNavigation,0,false);
			refresh_button = true;	
			alarm[3] = alarm3_time;
		}
	}
}

if !key_up and !key_down {
	selected_y = false;
	alarm3_time = 30;
	alarm[3] = alarm3_time;
}

//create items
var xx = 0;
var yy = 0;
if created_items = false {
	//choose random items
	//randomize();

	buff_1 = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
	buff_2 = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
	while (buff_2 = buff_1) { //dont want 2 of the same buff
		buff_2 = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
	}

	weapon_1 = global.all_weapons[irandom_range(0,array_length(global.all_weapons)-1)];
	weapon_2 = global.all_weapons[irandom_range(0,array_length(global.all_weapons)-1)];
	while (weapon_2 = weapon_1) { //dont want 2 of the same weapon
		weapon_2 = global.all_weapons[irandom_range(0,array_length(global.all_weapons)-1)];
	}

	pickup_1 = global.all_pickups[irandom_range(0,array_length(global.all_pickups)-1)];
	pickup_2 = global.all_pickups[irandom_range(0,array_length(global.all_pickups)-1)];
	while (pickup_2 = pickup_1) { //dont want 2 of the same pickup
		pickup_2 = global.all_pickups[irandom_range(0,array_length(global.all_pickups)-1)];
	}

	slot_items_array = [default_item_1, default_item_2, buff_1, buff_2, weapon_1, weapon_2, pickup_1, pickup_2];
	
	//create items 
	for (i = 0; i < array_length(slot_items_array); i++) {
		index = i;
		if i % 2 = 0 {
			xx = 272+32;
		}else {
			xx = 336+32;
		}
		yy = 104 + 64 * floor(i / 2);
		with instance_create_depth(xx,yy,depth-1,slot_items_array[i]) {
			follow_player = false;
			index = other.index;
			ii = other.i;
		}
		//replace weapon with new weapon if player already has it
		if i = 4 
		or i = 5 {
			while (obj_player.gun_array[0] = slot_items_array[i].weapon or obj_player.gun_array[1] = slot_items_array[i].weapon or obj_player.gun_array[2] = slot_items_array[i].weapon) {
				if obj_player.gun_array[0] = slot_items_array[i].weapon or obj_player.gun_array[1] = slot_items_array[i].weapon or obj_player.gun_array[2] = slot_items_array[i].weapon {
					//destroy old item
					slot_items_array[i].item_cost = 0;
					instance_destroy(slot_items_array[i]);
				}
				
				slot_items_array[i] = global.all_weapons[irandom_range(0,array_length(global.all_weapons)-1)];
				while slot_items_array[4] = slot_items_array[5] { //change if 2 of same item
					slot_items_array[i] = global.all_weapons[irandom_range(0,array_length(global.all_weapons)-1)];
				}
				with instance_create_depth(xx,yy,depth-1,slot_items_array[i]) {
					follow_player = false;
					index = other.index;
				}
			}
		}
		//replace pickup with new pickup if player already has it
		if i = 6 
		or i = 7 {
			while (obj_player.pickups_array[0] = slot_items_array[i].pickup or obj_player.pickups_array[1] = slot_items_array[i].pickup) {
				if obj_player.pickups_array[0] = slot_items_array[i].pickup or obj_player.pickups_array[1] = slot_items_array[i].pickup {
					//destroy old item
					slot_items_array[i].item_cost = 0;
					instance_destroy(slot_items_array[i]);
				}
				
				slot_items_array[i] = global.all_pickups[irandom_range(0,array_length(global.all_pickups)-1)];
				while slot_items_array[6] = slot_items_array[7] { //change if 2 of same item
					slot_items_array[i] = global.all_pickups[irandom_range(0,array_length(global.all_pickups)-1)];
				}
				with instance_create_depth(xx,yy,depth-1,slot_items_array[i]) {
					follow_player = false;
					index = other.index;
				}
			}
		}
		
	}
	created_items = true;
}

//get item info
if select != 0 {
	if instance_exists(slot_items_array[select-1]) {
		item_name = slot_items_array[select-1].item_name;
		item_description = slot_items_array[select-1].item_description;
		item_cost = round(slot_items_array[select-1].item_cost * global.sale);
		
		//sold out
		if global.num_of_coins >= round(slot_items_array[select-1].item_cost * global.sale) {
			too_expensive = false;
		}else {
			too_expensive = true;
		}
		//sold out
		if slot_items_array[select-1].sold_out = true {
			sold_out = true;
			if soundPlayed = false {
				//temporarily disabled
				//audio_play_sound(snd_unavailable,0,false);
				soundPlayed = true;
			}
		}else {
			sold_out = false;
			soundPlayed = false;
		}
		
	}else {
		item_name = "";
		item_description = "";
		sold_out = false;
	}
}

//select item 
if key_select {
	if select != 0 and instance_exists(slot_items_array[select-1]) and refresh_button = false {
		if slot_items_array[select-1].sold_out = false {
			audio_play_sound(snd_selectOption,0,false);
		}else {
			audio_play_sound(snd_unavailable,0,false);
		}
		last_select = select;
		select = 0;
	}else if select = 0 and refresh_button = false {
		select = last_select;
		if global.num_of_coins >= round(slot_items_array[last_select-1].item_cost * global.sale) and slot_items_array[select-1].sold_out = false {
			//item follow player
			last_item_created = slot_items_array[select-1];
			audio_play_sound(snd_chaching,0,false);
			with slot_items_array[select-1] {
				if (index = other.select-1) {
					follow_player = true;
					depth -= 1;
					other.cant_move = true;
				}
			}
		}else {
			audio_play_sound(snd_unavailable,0,false);	
		}
	}else if refresh_button = true {
		audio_play_sound(snd_refreshShop,0,false);
		if global.num_of_coins >= global.refresh_cost {
			with instance_create_depth(obj_player_mask.x,obj_player_mask.y,obj_player_mask.depth-1,obj_coin_spawner) {
				num_of_coins = global.refresh_cost;
			}
			with obj_item_parent {
				select = other.select;
				refresh_button = other.refresh_button;
				create_coins = false;
				instance_destroy();
			}
			instance_destroy();
			with instance_create_depth(x,y,depth,obj_shop) {
				if global.refresh_cost != 0 {
					global.refresh_cost = global.refresh_cost+25;
				}else {
					global.refresh_cost = global.prev_refresh_cost;
					global.picky_buyer = false;
				}
				first_shop = false;
				global.refreshes_used += 1;
			}
		}
	}
}

//if item canceled on item swap pop up
if recreated_bought_item = true {
	audio_play_sound(snd_unavailable,0,false);
	if (select-1) % 2 = 0 {
		xx = 272+32;
	}else {
		xx = 336+32;
	}
	yy = 104 + 64 * floor((select-1) / 2);
	with instance_create_depth(xx,yy,depth-1,last_item_created) {
		index = other.select-1;
		follow_player = false;
	}
	recreated_bought_item = false;
}

//picky buyer item
if global.picky_buyer = true and global.refresh_cost != 0 {
	global.prev_refresh_cost = global.refresh_cost;
	global.refresh_cost = 0;
}

//refresh in new shop
if spawn = true {
	spawn = false;
	with obj_item_parent {
		select = other.select;
		refresh_button = other.refresh_button;
		create_coins = false;
		instance_destroy();
	}
	instance_destroy();
	with instance_create_depth(x,y,depth,obj_shop) {
		first_shop = false;
		if global.current_shop_num < global.shop_num {
			global.current_shop_num += 1;
		}
	}
}
}