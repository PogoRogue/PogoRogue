// Inherit the parent event
event_inherited();

buff();

//add buff sprite to ui
if !scr_In_Array(global.all_buff_sprites,sprite_index) and add_sprite_to_list = true {
	array_resize(global.all_buff_sprites,array_length(global.all_buff_sprites)+1);
	array_resize(global.all_buff_sprites_index,array_length(global.all_buff_sprites_index)+1);
	array_resize(global.all_buff_numbers,array_length(global.all_buff_numbers)+1);
	array_resize(global.all_buff_names,array_length(global.all_buff_names)+1);
	array_resize(global.all_buff_descriptions,array_length(global.all_buff_descriptions)+1);
	array_resize(global.all_buff_stats,array_length(global.all_buff_stats)+1);
	global.all_buff_sprites[array_length(global.all_buff_sprites)-1] = sprite_index;
	global.all_buff_numbers[array_length(global.all_buff_numbers)-1] = 1;
	global.all_buff_names[array_length(global.all_buff_names)-1] = item_name;
	global.all_buff_descriptions[array_length(global.all_buff_descriptions)-1] = item_tagline;
	global.all_buff_stats[array_length(global.all_buff_stats)-1] = item_stats;
	
	if scr_In_Array(global.all_passives_used,item_name) = false {
		array_resize(global.all_passives_used,array_length(global.all_passives_used)+1);
		global.all_passives_used[array_length(global.all_passives_used)-1] = sprite_index;
	}
	
	ini_open("itemsunlocked.ini");
	if scr_In_Array(obj_player.all_buffs_array,buff) {
		for(i = 0; i < array_length(obj_player.all_buffs_array);i++) {
			if obj_player.all_buffs_array[i] = buff {
				global.passive_unlocked_array[i] = true;
				ini_write_real("itemsunlocked", "passive " + string(i), global.passive_unlocked_array[i]);
			}
		}
	}
	ini_close();
	
	with instance_create_depth(x,y,depth-1000,obj_item_text) {
		item_string = other.item_name;
	}
}else if add_sprite_to_list = true {
	for (i = 0; i < array_length(global.all_buff_sprites); i++) {
		if global.all_buff_sprites[i] = sprite_index {
			//update image index
			global.all_buff_sprites_index[i] = image_index;
			//update numbers
			if global.all_buff_numbers[i] < max_uses and max_uses > 0 {
				global.all_buff_numbers[i] += 1;
				with instance_create_depth(x,y,depth-1000,obj_item_text) {
					item_string = other.item_name;
				}
			}else if max_uses <= 0 {
				global.all_buff_numbers[i] += 1;
				with instance_create_depth(x,y,depth-1000,obj_item_text) {
					item_string = other.item_name;
				}
			}
		}
	}
}