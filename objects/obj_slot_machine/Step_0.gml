if handle_frame < sprite_get_number(spr_slotmachine_handle) and handle_done = false and pull_handle = true { 
	handle_frame += 0.25;
	if handle_frame >= 5 and spin = false {
		spin = true;
		alarm[2] = spin_time;
		item1_index = 0;//irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
		item2_index = 0;//irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
		item3_index = 0;//irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
	}
}else if handle_done = false and pull_handle = true {
	handle_frame = 0;
	handle_done = true;
}

if jackpot = true {
	jackpot_index += 0.05;
}

if tryagain = true {
	tryagain_index += 0.05;
}

if tryagain_index > blink_max or jackpot_index > blink_max {
	fade_out = true;
	tryagain = false;
	//jackpot = false;
}

if fade_out = true {
	if retreat_speed < 8 {
		retreat_speed += 0.5;
	}
	y_subtract += retreat_speed;
	if y_subtract >= 400 {
		instance_destroy();	
	}
	/*
	if image_alpha > 0 {
		image_alpha -= 0.05;
	}else {
		instance_destroy();	
	}*/
}

if y_subtract > 104 and fade_out = false {
	var distance = abs(y_subtract - 96);
	if(distance <= 80){
		spd_multiply = distance / 80;
	}
	y_subtract -= 8 * spd_multiply;
}

if y_subtract < 256 {
	//pull_handle = true;
	/*coin_spawner = instance_create_depth(x,y,depth+1,obj_coin_spawner);
	with coin_spawner {
		num_of_coins = obj_player.pickup_winners.cost;
	}*/
	if !instance_exists(obj_coin25) and pull_handle = false {
		//instance_create_depth(obj_player.x+lengthdir_x(34,obj_player.angle+90),obj_player.y+lengthdir_y(34,obj_player.angle+90),obj_player.depth+10,obj_coin25);
	}
	image_speed = 1;
}

//create object on jackpot
if win = true {
	if jackpot = true {
		if jackpot_index = 6 or ((jackpot_index = 2 or jackpot_index = 4 or jackpot_index = 6) and item1 = 0) or ((jackpot_index = 2 or jackpot_index = 4 or jackpot_index = 6) and item1 = 1) {
			//heart
			if item1 = 0 {
				heart_chance = 100;
				buff_chance = 0;
				weapon_chance = 0;
				pickup_chance = 0;
				with instance_create_depth(x,y+33,depth-1,obj_item_buff_heart) {
					follow_player = true;	
				}
			}else if item1 = 1 { //armored heart
				heart_chance = 100;
				buff_chance = 0;
				weapon_chance = 0;
				pickup_chance = 0;
				random_items = scr_Random_Item_Drops();
				instance_create_depth(x,y+33,depth-1,obj_item_buff_armor);
			}else if item1 = 2 { //coin
				heart_chance = 0;
				buff_chance = 0;
				weapon_chance = 0;
				pickup_chance = 0;
				//random_items = scr_Random_Item_Drops();
				//Create_Item_Drops(random_items);
				coin_spawner = instance_create_depth(x,y+25,depth+1,obj_coin_spawner);
				with coin_spawner {
					num_of_coins = 100;
				}
				blink_max = 10.9;
			}else if item1 = 3 { //weapon
				heart_chance = 0;
				buff_chance = 0;
				weapon_chance = 100;
				pickup_chance = 0;

				random_items = scr_Random_Item_Drops();
			
				if random_weapon = true {
					y += 33;
					Create_Item_Drops(random_items);
					y -= 33;
				}else {
					with instance_create_depth(x,y+33,depth-2,custom_weapon_drop) {
						follow_player = true;
					}	
				}
			}else if item1 = 4 { //active
				heart_chance = 0;
				buff_chance = 0;
				weapon_chance = 0;
				pickup_chance = 100;

				random_items = scr_Random_Item_Drops();
			
				if random_pickup == true {
					y += 37;
					Create_Item_Drops(random_items);	
					y -= 37;
				}else {
					var center_x = x;
					var center_y = y ;
					with instance_create_depth(x,y+37,depth-2,custom_pickup_drop) {
						follow_player = true;
					}	
				}
			}else if item1 = 5 { //passive
				heart_chance = 0;
				buff_chance = 100;
				weapon_chance = 0;
				pickup_chance = 0;

				random_items = scr_Random_Item_Drops();
				y += 25;
				Create_Item_Drops(random_items);
				y -= 25;
			}
		}
	}
}

//update coin spawner position
with coin_spawner {
	x = other.x;
	y = other.y;
}

propeller_frame += 0.5;	

//item 2
if num_of_spins <= 15 {
	item2 = item2_array[item2_index];
	if win = true or twoinarow = true {
		if item2 = item1 {
			item2_locked = true;
		}
	}
}
//item 3
if num_of_spins <= array_length(item3_array) {
	item3 = item3_array[item3_index];
	if win = true {
		if item3 = item2 {
			num_of_spins = 0;
			item3_locked = true;
			spin = false;
		}
	}
}

//animation effect
if num_of_spins > 0 and spin = true {
	if item1_locked = false {
		item1_y += (item_spacing/spin_time);
	}else {
		item1_y = 0;
	}
	if item2_locked = false {
		item2_y += (item_spacing/spin_time);
	}else {
		item2_y = 0;
	}
	if item3_locked = false {
		item3_y += (item_spacing/spin_time);
	}else {
		item3_y = 0;
	}
}else {
	item1_y = 0;
	item2_y = 0;
	item3_y = 0;
}