/// @description Player collision + button pressed
if table_num = global.salesman_spawn_area {
key_interact = global.key_interact;
key_back = global.key_back;
key_left = global.key_left_menu;
key_right = global.key_right_menu;
key_select = global.key_select;

//check for player coliision
if (place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask)) { //and all_out = false {
	colliding = true;
	show_debug_message("COLLIDING");
}else {
	colliding = false;	
}

if (colliding and key_interact) and !instance_exists(obj_fade_in) { //and all_out = false {
	being_used = not being_used;
	obj_player.can_rotate = true;
	obj_player.centering = true;
	obj_player.table = being_used;
}

if being_used = true {
	if instance_exists(obj_camera) {
		obj_camera.follow = self;
	}
	obj_player.can_rotate = false;
	obj_player.can_shoot = false;
	if distance_to_object(obj_player) > 128 or key_back {
		being_used = false;
		if instance_exists(obj_camera) {
			obj_camera.follow = obj_player;
		}
		obj_player.can_rotate = true;
		obj_player.table = false;
	}
	
	if key_right and !key_left and buff_selected < 2 and !selected_x {
		buff_selected += 1;
		audio_play_sound(snd_menuNavigation,0,false);
		selected_x = true;
		alarm[2] = alarm2_time;
		if !instance_exists(passives_array[buff_selected]) {
			if buff_selected = 2 {
				if instance_exists(passives_array[1]) {
					buff_selected = 1;
				}else {
					buff_selected = 0;
				}
			}else if buff_selected = 1 {
				if instance_exists(passives_array[2]) {
					buff_selected = 2;
				}else {
					buff_selected = 0;
				}
			}
		}
	}
	
	if !key_right and key_left and buff_selected > 0 and !selected_x {
		buff_selected -= 1;
		audio_play_sound(snd_menuNavigation,0,false);
		selected_x = true;
		alarm[2] = alarm2_time;
		if !instance_exists(passives_array[buff_selected]) {
			if buff_selected = 0 {
				if instance_exists(passives_array[1]) {
					buff_selected = 1;
				}else {
					buff_selected = 2;
				}
			}else if buff_selected = 1 {
				if instance_exists(passives_array[0]) {
					buff_selected = 0;
				}else {
					buff_selected = 2;
				}
			}
		}
	}
	
	if !key_right and !key_left {
		selected_x = false;
		alarm2_time = 30;
	}
}

//create items
in_air = false;
if created_items = false and usable = true {
	var shop_seed = global.seed+global.salesman_number;
	random_set_seed(shop_seed);
	
	buff_1 = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
	buff_2 = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
	buff_3 = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
	
	while (buff_2 = buff_1) { //dont want 2 of the same buff
		buff_2 = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
	}

	while (buff_3 = buff_1) or (buff_3 = buff_2) { //dont want 2 of the same buff
		buff_3 = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
	}
	
	instance_create_depth(x,y,depth,buff_1,{salesman: true});
	instance_create_depth(x,y,depth,buff_2,{salesman: true});
	instance_create_depth(x,y,depth,buff_3,{salesman: true});
	var old_object_array = [];
	if instance_exists(buff_3) {
		while buff_3.max_uses = 1 or (buff_3 = buff_2) or (buff_3 = buff_1) or buff_3.sold_out = true {
			array_resize(old_object_array,array_length(old_object_array)+1)
			array_insert(old_object_array,array_length(old_object_array)-1, buff_3);
			buff_3 = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
			instance_create_depth(x,y,depth,buff_3,{salesman: true});
		}
	}
	if instance_exists(buff_1) {
		while buff_1.sold_out = true {
			array_resize(old_object_array,array_length(old_object_array)+1)
			array_insert(old_object_array,array_length(old_object_array)-1, buff_1);
			buff_1 = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
			instance_create_depth(x,y,depth,buff_1,{salesman: true});
		}
	}
	if instance_exists(buff_2) {
		while buff_2.sold_out = true {
			array_resize(old_object_array,array_length(old_object_array)+1)
			array_insert(old_object_array,array_length(old_object_array)-1, buff_2);
			buff_2 = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
			instance_create_depth(x,y,depth,buff_2,{salesman: true});
		}
	}
	with buff_1 {
		instance_destroy();
	}
	with buff_2 {
		instance_destroy();
	}
	with buff_3 {
		instance_destroy();
	}
	for (k = 0; k < array_length(old_object_array); k++) {
		if instance_exists(old_object_array[k]) {
			instance_destroy(old_object_array[k]);
		}
	}

	passives_array = [buff_1,buff_2,buff_3];
	passives_array_x = [x-30,x,x+30];

	for (i = 0; i < array_length(passives_array); i++) {
		//check if any passive is in air before selecting again
		index = i;
		with instance_create_depth(passives_array_x[i],y-35,depth-1,passives_array[i],{salesman: true}) {
			follow_player = false;
			created_in_room = true;
			salesman = true;
			//don't oversell item quantity
			if other.i = 2 {
				for (j = 0; j < array_length(global.all_buff_sprites); j++) {
					if (sprite_index = global.all_buff_sprites[j]) {
						while global.all_buff_numbers[j]+other.buff_3_number > max_uses and max_uses != 0 {
							other.buff_3_number -= 1;
						}
					}
				}
			}
			//change item cost if item 3
			if other.i = 2 and other.buff_3_number > 1 {
				item_cost = (item_cost*other.buff_3_number)+(10*(other.buff_3_number-1));
			};
		}
		if instance_exists(passives_array[i]) {
			var temp_passive = passives_array[i];
			if passives_array[i].max_uses = 1 or passives_array[i].sold_out {
				while scr_In_Array(global.all_buff_sprites, passives_array[i].sprite_index) and (passives_array[i].max_uses = 1 or passives_array[i].sold_out) {
					if scr_In_Array(global.all_buff_sprites, passives_array[i].sprite_index) and (passives_array[i].max_uses = 1 or passives_array[i].sold_out) {
						//destroy old item
						passives_array[i].item_cost = 0;
						instance_destroy(passives_array[i]);
					}
					
					passives_array[i] = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
				
					while (passives_array[1] = passives_array[0]) { //dont want 2 of the same buff
						passives_array[1] = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
						//continue;
					}

					while (passives_array[2] = passives_array[0]) or (passives_array[2] = passives_array[1]) { //dont want 2 of the same buff
						passives_array[2] = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
						//continue;
					}

					//make sure new item is stackable
					if i = 2 {
						instance_create_depth(x,y,depth,passives_array[2],{salesman: true});
						while passives_array[2].max_uses = 1 or passives_array[2].sold_out = true or (passives_array[2] = passives_array[1]) or (passives_array[2] = passives_array[0]) {
							instance_destroy(passives_array[2]);
							passives_array[2] = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
							instance_create_depth(x,y,depth,passives_array[2],{salesman: true});
						}
						instance_destroy(passives_array[2]);
					}
				
					with instance_create_depth(passives_array_x[i],y-35,depth-1,passives_array[i], {salesman: true}) {
						follow_player = false;
						created_in_room = true;
						//don't oversell item quantity
						if other.i = 2 {
							for (j = 0; j < array_length(global.all_buff_sprites); j++) {
								if (sprite_index = global.all_buff_sprites[j]) {
									while global.all_buff_numbers[j]+other.buff_3_number > max_uses and max_uses != 0 {
										other.buff_3_number -= 1;
									}
								}
							}
						}
						//change item cost if item 3
						if other.i = 2 and other.buff_3_number > 1 {
							item_cost = (item_cost*other.buff_3_number)+(10*(other.buff_3_number-1));
						};
					}
				}
			}
		}
	}
	created_items = true;
	random_set_seed(global.seed);
}

if usable = true {

	for (i = 0; i < array_length(passives_array); i++) {
		if instance_exists(passives_array[i]) {
			if passives_array[i].follow_player = true {
				in_air = true;
			}
		}
		if instance_exists(buff_3) {
			if buff_3.follow_player = true {
				in_air = true;
			}
		}
	}

	if key_select and being_used and in_air = false {
		if instance_exists(passives_array[buff_selected]) {
			if global.num_of_coins >= passives_array[buff_selected].item_cost and passives_array[buff_selected].sold_out = false {
				audio_play_sound(snd_chaching,0,false);
				with passives_array[buff_selected] {
					global.num_of_coins -= item_cost;
					created_in_room = false;
					follow_player = true;
					mask_index = sprite_index;
				}
				if buff_selected = 2 {
					with passives_array[buff_selected] {
						repeat(other.buff_3_number-1) {
							instance_create_depth(x,y,depth,other.buff_3,{follow_player: true, image_index: other.image_index, play_sound: false});
						}
					}
				}
				//create coins
				with instance_create_depth(obj_player_mask.x,obj_player_mask.y,obj_player_mask.depth-1,obj_coin_spawner, {salesman_spawner: true}) {
					num_of_coins = other.passives_array[other.buff_selected].item_cost;
					init_num_of_coins = other.passives_array[other.buff_selected].item_cost;
				}
				//switch to other item
				if buff_selected = 0 and in_air = false {
					if instance_exists(passives_array[1]) {
						buff_selected = 1;
					}else if instance_exists(passives_array[2]) {
						buff_selected = 2;
					}else {
						buff_selected = 0;
						being_used = false;
						if instance_exists(obj_camera) {
							obj_camera.follow = obj_player;
						}
						all_out = true;
					}
				}else if buff_selected = 1 and in_air = false {
					if instance_exists(passives_array[0]) {
						buff_selected = 0;
					}else if instance_exists(passives_array[2]) {
						buff_selected = 2;
					}else {
						buff_selected = 0;	
						being_used = false;
						if instance_exists(obj_camera) {
							obj_camera.follow = obj_player;
						}
						all_out = true;
					}
				}else if in_air = false  {
					if instance_exists(passives_array[1]) {
						buff_selected = 1;
					}else if instance_exists(passives_array[0]) {
						buff_selected = 0;
					}else {
						buff_selected = 0;	
						being_used = false;
						if instance_exists(obj_camera) {
							obj_camera.follow = obj_player;
						}
						all_out = true;
					}
				}
			}else {
				audio_play_sound(snd_unavailable,0,false);	
			}
		}
	}

	if !instance_exists(passives_array[0]) and !instance_exists(passives_array[1]) and !instance_exists(passives_array[2])
	or !instance_exists(passives_array[0]) and !instance_exists(passives_array[1]) and in_air = true
	or !instance_exists(passives_array[0]) and in_air = true and !instance_exists(passives_array[2])
	or in_air = true and !instance_exists(passives_array[1]) and !instance_exists(passives_array[2]) {
		all_out = true;
		being_used = false;
		if instance_exists(obj_camera) {
			obj_camera.follow = obj_player;
		}
		colliding = false;
		obj_player.table = false;
	}
}

}

/*
if instance_exists(obj_fade_out)  {
	if instance_exists(buff_1) {
		with buff_1 {
			if !place_meeting(x,y,obj_salesman_table) {
				instance_destroy();
			}
		}
	}

	if instance_exists(buff_2) {
		with buff_2 {
			if !place_meeting(x,y,obj_salesman_table) {
				instance_destroy();
			}
		}
	}

	if instance_exists(buff_3) {
		with buff_3 {
			if !place_meeting(x,y,obj_salesman_table) {
				instance_destroy();
			}
		}
	}
}

/*
for (j = 0; j < array_length(global.all_buff_sprites); j++) {
	for (jj = 0; jj < array_length(passives_array); jj++) {
		if instance_exists(passives_array[jj]) {
			while (passives_array[jj].sprite_index = global.all_buff_sprites[j]) and passives_array[jj].max_uses = 1 {
				instance_destroy(passives_array[jj]);
				passives_array[jj] = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
				with instance_create_depth(passives_array_x[jj],y-35,depth-1,passives_array[jj],{salesman: true}) {
					follow_player = false;
					created_in_room = true;
					mask_index = spr_nothing;
				}
			}
		}
	}
}