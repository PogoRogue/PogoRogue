// Inherit the parent event
event_inherited();

buff();
with obj_item_text {
	if 	item_string = other.item_name {
		other.text_exists = true;
	}
}

//add buff sprite to ui
if !scr_In_Array(global.all_buff_sprites,sprite_index) and add_sprite_to_list = true {
	array_resize(global.all_buff_sprites,array_length(global.all_buff_sprites)+1);
	array_resize(global.all_buff_sprites_index,array_length(global.all_buff_sprites_index)+1);
	array_resize(global.all_buff_numbers,array_length(global.all_buff_numbers)+1);
	array_resize(global.all_buff_names,array_length(global.all_buff_names)+1);
	array_resize(global.all_buff_descriptions,array_length(global.all_buff_descriptions)+1);
	array_resize(global.all_buff_stats,array_length(global.all_buff_stats)+1);
	array_resize(global.all_buff_costs,array_length(global.all_buff_costs)+1);
	global.all_buff_sprites[array_length(global.all_buff_sprites)-1] = sprite_index;
	global.all_buff_numbers[array_length(global.all_buff_numbers)-1] = 1;
	global.all_buff_names[array_length(global.all_buff_names)-1] = item_name;
	global.all_buff_descriptions[array_length(global.all_buff_descriptions)-1] = item_tagline;
	global.all_buff_stats[array_length(global.all_buff_stats)-1] = item_stats;
	global.all_buff_costs[array_length(global.all_buff_costs)-1] = item_cost;
	
	if scr_In_Array(global.all_passives_used,item_name) = false {
		array_resize(global.all_passives_used,array_length(global.all_passives_used)+1);
		global.all_passives_used[array_length(global.all_passives_used)-1] = sprite_index;
	}
	
	ini_open("itemsunlocked.ini");
	if scr_In_Array(obj_player.all_buffs_array,buff) {
		for(i = 0; i < array_length(obj_player.all_buffs_array);i++) {
			if obj_player.all_buffs_array[i] = buff {
				if global.passive_unlocked_array[i] = false /*and room != room_tutorial*/ and text_exists = false {
					//instance_create_depth(x,y,depth,obj_item_text_newdiscovery);
					with instance_create_depth(x,y,depth-1000,obj_item_text) {
						new_discovery = true;
						item_string = other.item_name;
						if other.play_sound = true { audio_play_sound(snd_passivePowerup,0,false); }
					}
				}else if global.passive_unlocked_array[i] = true/* and room != room_tutorial*/ and text_exists = false {
					with instance_create_depth(x,y,depth-1000,obj_item_text) {
						new_discovery = false;
						item_string = other.item_name;
						if other.play_sound = true { audio_play_sound(snd_passivePowerup,0,false); }
					}
				}
				global.passive_unlocked_array[i] = true;
				ini_write_real("itemsunlocked", "passive " + string(i), global.passive_unlocked_array[i]);
			}
		}
	}
	ini_close();
}else if add_sprite_to_list = true {
	for (i = 0; i < array_length(global.all_buff_sprites); i++) {
		if global.all_buff_sprites[i] = sprite_index {
			if play_sound = true { audio_play_sound(snd_passivePowerup,0,false); }
			//update image index
			global.all_buff_sprites_index[i] = image_index;
			//update name
			global.all_buff_names[i] = item_name;
			//update text
			global.all_buff_descriptions[i] = item_tagline;
			//update numbers
			if global.all_buff_numbers[i] < max_uses and max_uses > 0 {
				global.all_buff_numbers[i] += 1;
				if play_sound = true and text_exists = false {
					with instance_create_depth(x,y,depth-1000,obj_item_text) {
						item_string = other.item_name;
					}
				}
			}else if max_uses <= 0 {
				global.all_buff_numbers[i] += 1;
				if play_sound = true and text_exists = false {
					with instance_create_depth(x,y,depth-1000,obj_item_text) {
						item_string = other.item_name;
					}
				}
			}
		}
	}
}